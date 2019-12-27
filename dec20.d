import std.stdio;
import std.algorithm;
import std.range;
import std.array;
import std.conv;
import std.utf;
import std.ascii;

struct Loc{
    ulong r,  c;
}

enum Dir{ U,D,L,R,None}

Dir adjacentDot(Loc l, const ref char[][] map){
    if((l.c +1) < map[l.r].length &&  map[l.r][l.c +1] == '.'){
        return Dir.R;
    } else if(l.c > 0 && map[l.r][l.c -1] == '.'){
        return Dir.L;
    } else if( (l.r + 1) < map.length && map[l.r +1][l.c] == '.'){
        return Dir.D;
    } else if( l.r > 0 && map[l.r -1][l.c] == '.'){
        return Dir.U;
    } else {
        return Dir.None;
    }
    
}

Loc forward(Loc l, Dir d){
    final switch(d){
        case Dir.U:
            return Loc(l.r -1, l.c);
        case Dir.D:
            return Loc(l.r +1, l.c);
        case Dir.L:
            return Loc(l.r, l.c -1);
        case Dir.R:
            return Loc(l.r, l.c +1);
        case Dir.None:
            assert(false);
    }
}

Dir opposite(Dir d){
    final switch(d){
        case Dir.U: return Dir.D;
        case Dir.D: return Dir.U;
        case Dir.L: return Dir.R;
        case Dir.R: return Dir.L;
        case Dir.None: assert(false);
    }
}

char get(Loc l, const ref char[][] map){
    return map[l.r][l.c];
}

Loc[] neighbors(Loc l, const ref char[][] map, const ref Loc[Loc] portal){
    Loc[] ret;
    foreach(d; [Dir.U, Dir.D, Dir.L, Dir.R]){
        auto n = forward(l, d);
        if(get(n, map) == '.'){
            ret ~= n;
        }
    }
    if(l in portal){
        ret ~= portal[l];
    }
    return ret;
}




int bfs(L)(L s, L t, const ref char[][] map, const ref Loc[Loc] portal){

    L[] q = [s];
    bool[L] seen;
    L[L] cameFrom;
    seen[s] = true;

    while(!q.empty){
        auto n = q.front;
        q.popFront;
        if(n == t){
            break;
        }

        foreach(neighbor; neighbors(n, map, portal)){
            if(neighbor !in seen){
                seen[neighbor] = true;
                cameFrom[neighbor]= n;
                q ~= neighbor;
            }
        }
    }

    if(t !in cameFrom){
        assert(false);
    }

    auto p = t;
    int steps = 0;
    while(p != s){
        p = cameFrom[p];
        ++steps;
    }
    return steps;
}

string stringAt(Loc l, const ref char[][] map){

    if(l.r > 0 && isUpper(map[l.r-1][l.c])){
        return [map[l.r -1][l.c], get(l, map) ];
    } else if( (l.r  + 1) < map.length && isUpper(map[l.r +1][l.c])){
        return [get(l, map), map[l.r + 1][l.c]];
    } else if( l.c > 0 && isUpper(map[l.r][l.c -1])){
        return [ map[l.r][l.c -1], get(l, map) ];
    } else if( (l.c + 1) < map[l.r].length && isUpper(map[l.r][l.c +1])){
        return [ get(l, map), map[l.r][l.c + 1] ];
    } else {
        assert(false);
    }
}

enum IO { In, Out }

IO portalType(Loc l, const ref char[][] map){
    if(l.r < 4 || l.r >= map.length - 4 ||
       l.c < 4 || l.c >= map[map.length/2].length -4){
        return IO.Out;
    } else {
        return IO.In;
    }
}

struct RLoc{
    Loc l;
    int depth;
}

RLoc[] neighbors(RLoc l, const ref char[][] map, const ref Loc[Loc] portal){
    RLoc[] ret;
    foreach(d; [Dir.U, Dir.D, Dir.L, Dir.R]){
        auto n = forward(l.l, d);
        if(get(n, map) == '.'){
            ret ~= RLoc(n, l.depth);
        }
    }
    if(l.l in portal){
        auto pt = portalType(l.l, map);
        if(pt == IO.In){

            ret ~= RLoc(portal[l.l], l.depth +1);
            
        } else {

            if(l.depth > 0){
                ret ~= RLoc(portal[l.l], l.depth -1);
            }
        }
    }
    return ret;

}

void main(){


    char[][] map = File("dec20input.txt").byLine.map!(a => a.byChar.array).array;

    if(map[$-1].empty){
        map = map[0 .. $ -1];
    }
    
    foreach(line; map){
        writeln(line);
    }


    Loc[Loc] portal;
    Loc[string] portalStarts;
    
    foreach(ri, row; map){
        foreach(ci, ch; row){
            if(isUpper(ch)){
                auto here = Loc(ri, ci);
                auto adjDir = adjacentDot(here, map);
                if(adjDir != Dir.None){
                    string pname = stringAt(here, map);
                    writeln(here, " adj ", adjDir, " pname ", pname);
                    auto portalPos = forward(here, adjDir);

                    if(pname in portalStarts){
                        auto other = portalStarts[pname];
                        portal[other] = portalPos;
                        portal[portalPos] = other;
                        portalStarts.remove(pname);
                    } else {
                        portalStarts[pname] = portalPos;
                    }
                }
            }
        }
    }

    foreach(k,v; portal){
        writeln(k, " to ", v);
    }

    writeln(portalStarts);

    writeln(bfs(portalStarts["AA"], portalStarts["ZZ"], map, portal));

    writeln(bfs(RLoc(portalStarts["AA"], 0), RLoc(portalStarts["ZZ"], 0), map, portal));
    
}



