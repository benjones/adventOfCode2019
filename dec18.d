const input = `#################################################################################
#...........#.....#.#...........#.....#.#...#...#...........#...........#......u#
###.#######.#.###.#.#.###.#######.###.#.#.#.###.#.#######.###.#####.###.###.###.#
#...#.....#.#.#.#.#.....#.#.......#...#.#.#...#.#.#.....#.........#...#...#...#.#
#.#####I#.#.#.#.#.#######.#.#######.###.#.###.#.#.#####.#############.###.#####.#
#.....#.#.#.#.#...........#.....#.#.....#...#.#.#.......#.....#.....#...#...#...#
#.###.#.#.#.#.#################.#.#####.#.#.#.#J#######.#.#.#.#.###.###.###.#.#.#
#...#.#.#.....#.....#...........#.#.....#.#.#.#...#.....#.#.#.#.#.....#.#...Y.#.#
#####.#########.###.#.###########.#.#######.#.#.#.#.#####.#H#.#.#####.#.#######.#
#...#...#.......#...#...#...#.....#.....#...#...#.#...#.#.#.#.#...#...#.....#...#
#.#.###.#.#######.#####.#.#.#.###.#####.#.#######.###.#.#.#.#####.###.###.#.#####
#.#.....#.#..k#..z......#.#.#...#.....#.#.....#.....#.#...#.#...#...#...#.#.....#
#.#####.#.#.#.###########.#####.#.#####.#.###.#######.#.###.#.#.###.###.#######.#
#.....#l#.R.#.....#.......#.....#...#...#...#.....#...#.#...#.#.....#...........#
#.###.#.#######.#.###.#.###.#######.#.#####.#####.#.#####.###.###.#############.#
#.#.#.#...#...#.#...#.#...#.#.....#.#...#.#.#.#...#...#...#...#...#...#.....#...#
#.#.#.###.#.#.#####.#.###.#.#.#.###.###.#.#.#.#.#####.#.###.#.#####.#.#.###.#.###
#...#.#...#.#.......#...#...#.#d..#.#...#..q..#...#...#...#.#.#.....#...Z.#r#.#.#
###.#.###.#V###########.#####.###.#.#.###########O#.#####.#.###.###########.#.#.#
#...#...#.#........f..#.#.....#...#.#.#.#.......#.#.#.....#.........#.......#...#
#######.#############.#.#######.###.#.#.#.#####.#.#.#.###.#########.#.#########.#
#.......#...........#.#.......#...#...#.#...#.#.#.#...#.#...#...#...#...#.#..e..#
#.#######.###.#.#############.###.#####.###.#.#.#.#####.###.###.###.###.#.#.#####
#p........#.#.#.#.......#...#...#.....#.#...#.#.#.#.......#...#.F.#...#.#...#.K.#
#.#########.#.###.#.###.#.#.###.###.#.#.#.###.#.#.#N#####.###.###.#####.#####.#.#
#...#.......#.....#...#.#.#.....#...#...#.#.......#.#...#...#...#.....#.......#.#
###.#.###.###########.###.#######.#####.#.#########.#.#####.###.#####.#####.###.#
#.#.#...#...........#.#...#.....#...S.#.#.#...#.......#...#...#.....#.....#...#.#
#.#.###########.###.#.#.###.###.#####.#.#.#.#.#.#######.#.###.#####.#####.###.#.#
#...#.........#.#...#...#...#.#.......#.#...#...#...#...#...#..x..#.#...#...#.#.#
#.###.#######.#.#########.#.#.#########.#.#######.#.#.#####.###.###.#.#####.###.#
#.....#.....#.#.......#...#.#.#.......#.#.#.......#.#.#.......#.#...#.#...#...#.#
#########.###.#.###.###.###.#.#.#####.#.#.#######.#.#.#######.#.#.###.#.#.###.#.#
#.....#...#...#.#.#.#...#...#...#..t#...#...#.....#.#.....#.....#...#...#...#..v#
#.###.#.###.###.#.#.#.###.###.#####.#######.#.#####.#####.###.#####.#####.#######
#.#.....#...#.....#.....#.#...........#.#...#.#...#.#...#...#.#...#.....#.......#
#.#######.#######.#####.#.###########.#.#.###.#.###.#.#.###.###.#.#####.#####.#.#
#.......#.#.....#.#...#.#.......#.#...#.#.....#...#...#...#.....#.....#.#...#.#.#
#.#####.#.#X###.###.#.#########.#.#.###.#######.#.#######.###########.#.#.#P###.#
#.....#.....#.......#...........#...............#.........T....g....#.....#.....#
#######################################.@.#######################################
#..y#...#.................#...#...................#.....#.........#.....#...#...#
#.###.#.#.#########.#.#####E#.#####.#.#.#.###.#####.###.###.#.###.###.#.#.#.#.#.#
#.#...#...#...#.#.U.#.#.....#.#...#.#.#.#.#.#...#...#.#...#.#...#.#...#.#.#.#.#.#
#.#.#######.#.#.#.#####.#####.#.#.###.#.#.#.###.#.###.###.#####.#.#.###.#A#.#.#.#
#.#...#...C.#...#.........#..a#.#...#.#.#.....#...#.#...#.#.....#.#.#...#.#b..#.#
#.###.#.#######.###########.###.###.#.#.#####.#####.#.#.#.#.#####.#.#.###.#####.#
#.....#.#.......#.#...B...#.#...#.#...#.#.#...#...#...#.#.#.#...#...#...#.#.....#
#.#####.#.#######.#.#####.#.#.#.#.#####.#.#.###.#.#####.#.#.#.#.#######.#.#.#####
#.W.....#.#...#...#...#...#.#.#.#.....#.#.#.....#.......#.#...#.#.....#...#...#.#
#########.#.#.###.###.#.###.#.#.#.#.###.#.#############.#.###.#.###.#.#.#####.#.#
#.......#...#...#.#...#.#...#.#.#.#.....#.....#.......#.#...#.#...#.#.#.#...#...#
#####.#.#######.#.#.###.###.#.#.#.#######.#####.#.#####.###.#.###.###.#.#.#.###.#
#.....#.......#.#.#.#...#...#.#.#.....#.#.....#.#.........#.#.#.#...#...#.#c#...#
#.#########.###.#.#.###.#.#####.#####.#.#.###.#.###########.#.#.###.#.###.#.#####
#.#.....#...#...#.#...#...#.G.#.#...#.#.#...#...#...#...#...#...#.#.#...#.#.....#
#.#.#####.###.###.###.#####.#.#.#.#.#.#.###.#####.###.#.#.#####.#.#.#####.#####.#
#.#.....#...#.#.....#.#.....#...#.#.#.#.#.#...#.....#.#...#...#...#..w......#.#.#
#.#.###.###.#.###.###.###.#########.#.#.#.###.#.###.#.###.#.#.###.#########.#.#.#
#.#...#...#.#...#.#...#...#.........#.#.#...#.#.#.#.#.#...#.#...#.#...#...#...#.#
#.#######.#.###.#.#.###.#######.#####.#.#.#.#.#.#.#.#.#####.###.###.#.#.#.#####.#
#.......#.#.#...#.#...#.#.......#.....#.#.#.#.#...#.#...#...#.#.....#...#...#...#
#.#####.#.#.#.###.#####.###.#.###.#####.#.#.#.#####.###.#.###.#######.#####.#.#.#
#.#...#.#...#.#...#.....#...#.#...#.....#.#.#.....#...#...#...#.....#.....#.#.#.#
#.#.#.#.#####.#.#.#.#####.###.#.#####.#.#.#######.###.#####.###.###.#######.#.###
#.#.#...#.....#.#...#...#...#.#....s..#.#.....#...#.....#...#...#.........#.#...#
#.#.###.#.#####.#####.#.#.#.#.#########.#.###.#.###.###.#.###.#.#########.#.###.#
#.#..m#.#.....#...#...#...#.#.#.......#.#.#.#.#.#...#...#...#.#.#...#...#...#..i#
#.###.#######.#.#.#.#######.#.#####.#.#.#.#.#.#.#.###.#####.#.###.#.#.#######.#.#
#...#.........#.#.#.......#.#...#...#.#.#.#.#...#.#...#...#.#.....#.#.......#.#.#
###.#############.#######.#.###.#.#.###.#.#.#####.#.###.#.#.#.#####Q###.###M#.###
#...#.....#.......#..j#...#.#.....#.#...#...#.....#...#.#.#.#.#.....#...#...#...#
#.#####.#.###.#######.#.###.#########.#####.#.#.#####.#.#.#.###.#####.###.###.#.#
#...#...#.....#.....#...#.#.......#...#.#...#.#.#...#.#.#.#.....#.....#.#.#...#.#
###.#.#########.###.#.###.#######.#.###.#.#####.#.#.#.#.###########.###.#.#####.#
#.#.#.............#.#.#.....#....o#.#...#.......#.#.#.#...#.......#.#..h#...#...#
#.#.###############.#.#####.#.###.#.###.###########.#.#.#.#.###.#.#.#.#.###.#.###
#.#...#.........#...#.......#.#...#.D...#...#.......#.#.#...#...#...#.#...#.#...#
#.###.#.#######.#.#########.#.#########.#.#.#.###.###.#######.#######.#.###.###L#
#.......#.........#.........#..........n#.#.....#.............#.......#.........#
#################################################################################`;


/*const input = `########################
#f.D.E.e.C.b.A.@.a.B.c.#
######################.#
#d.....................#
########################`;
*/

import std.stdio;
import std.range;
import std.conv;
import std.array;
import std.algorithm;
import std.ascii;
import std.utf;

struct Pos{
    int r, c;
}

struct Letters{ char s, t; }

bool isPath(Pos p, const ref char[][] map, const ref bool[char] keys){
    return p.r >= 0 && p.c >= 0 && p.r < map.length && p.c < map[0].length &&
        (map[p.r][p.c] == '.' || map[p.r][p.c] == '@' || isLower(map[p.r][p.c]) ||
         (isUpper(map[p.r][p.c]) && toLower(map[p.r][p.c]) in keys));
}

bool isPath(Pos p, const ref char[][] map){
    return p.r >= 0 && p.c >= 0 && p.r < map.length && p.c < map[0].length &&
        map[p.r][p.c] != '#';
}



Pos[] neighbors(Pos p,  const ref char[][] map, const ref bool[char] keys){
    Pos[] ret;
    if(isPath(Pos(p.r -1, p.c), map, keys)){
        ret ~= Pos(p.r -1, p.c);
    }
    if(isPath(Pos(p.r + 1, p.c), map, keys)){
        ret ~= Pos(p.r + 1, p.c);
    }
    if(isPath(Pos(p.r, p.c + 1), map, keys)){
        ret ~= Pos(p.r, p.c + 1);
    }
    if(isPath(Pos(p.r, p.c -1 ), map, keys)){
        ret ~= Pos(p.r, p.c -1 );
    }
    return ret;
}


Pos[] neighbors(Pos p,  const ref char[][] map){
    Pos[] ret;
    if(isPath(Pos(p.r -1, p.c), map)){
        ret ~= Pos(p.r -1, p.c);
    }
    if(isPath(Pos(p.r + 1, p.c), map)){
        ret ~= Pos(p.r + 1, p.c);
    }
    if(isPath(Pos(p.r, p.c + 1), map)){
        ret ~= Pos(p.r, p.c + 1);
    }
    if(isPath(Pos(p.r, p.c -1 ), map)){
        ret ~= Pos(p.r, p.c -1 );
    }
    return ret;
}

int bfsLength(Pos s, Pos t, const ref char[][] map, const ref bool[char] keys){

    //writeln("searching from ", s, " to ", t);
    Pos[] q = [s];
    bool[Pos] seen;
    Pos[Pos] cameFrom;
    seen[s] = true;

    while(!q.empty){
        auto n = q.front;
        q.popFront;
        if(n == t){
            break;
        }

        foreach(neighbor; neighbors(n, map, keys)){
            if(neighbor !in seen){
                seen[neighbor] = true;
                cameFrom[neighbor] = n;
                q ~= neighbor;
            }
        }
    }
    if(t !in cameFrom){
        return -1;
    }

    auto p = t;
    int steps = 0;
    while(p != s){
        p = cameFrom[p];
        steps++;
    }
    return steps;
    
}

char[] keysNeededOnPath(Pos s, Pos t, const ref char[][] map){
    //writeln("searching for keys from ", s, " to ", t);
    
    Pos[] q = [s];
    bool[Pos] seen;
    Pos[Pos] cameFrom;
    seen[s] = true;

    while(!q.empty){
        auto n = q.front;
        q.popFront;
        if(n == t){
            break;
        }

        foreach(neighbor; neighbors(n, map)){
            if(neighbor !in seen){
                seen[neighbor] = true;
                cameFrom[neighbor] = n;
                q ~= neighbor;
            }
        }
    }
    if(t !in cameFrom){
        return [];
    }

    auto p = t;
    int steps = 0;
    char[] keys;
    while(p != s){
        if(isUpper(map[p.r][p.c])){
            keys ~= toLower(map[p.r][p.c]);
        }
        p = cameFrom[p];
        steps++;
    }
    return keys;

}


struct CacheKey{
    char loc;
    char[] keysCollected;
}

int[CacheKey] cache;

int sp(Pos p, char loc, const ref char[][] map, const ref Pos[char] keyLocations,  bool[char] keys,
       bool[char] keysNeeded, bool[char][char] blocks, bool[char] accessibleKeys, const ref int[char][char] distanceTable){

    //writeln("sp searching from  ", loc, " need ", keysNeeded, " can reach ", accessibleKeys);


    auto myKeys = keys.keys.byChar.array;
    sort(myKeys.byChar);

    CacheKey ck = CacheKey(loc, myKeys);

    if(ck in cache){
        return cache[ck];
    }
    
    
    if(keysNeeded.empty){
        writeln("returning zero");
        return 0;
    }
    
    char bestNext;
    int pathCost = -1;

    foreach(needed; accessibleKeys.byKey){
        //writeln(" at ", loc, ", grabbing ", needed, " next");
        auto toKey = (loc in distanceTable) ? distanceTable[loc][needed] :
            bfsLength(p, keyLocations[needed], map, keys);

        auto newNeeded = keysNeeded.dup;
        newNeeded.remove(needed);
        if(newNeeded.empty){
            return toKey;
        }

        auto newKeys = keys.dup;
        newKeys[needed] = true;

        auto newAccessible = accessibleKeys.dup;
        newAccessible.remove(needed);
        
        
        auto newBlocks = blocks.dup;
        foreach(k; blocks.byKey){
            if(needed in blocks[k]){
                blocks[k].remove(needed);
                if(blocks[k].empty){
                    //writeln("just unlocked ", k);
                    newAccessible[k] = true;
                }
            }
        }

        foreach(na; newAccessible.byKey){
            int thisSp = sp(keyLocations[needed], needed, map, keyLocations, newKeys, newNeeded, newBlocks, newAccessible, distanceTable);
            if(thisSp >= 0 && (pathCost < 0 || (thisSp + toKey) < pathCost)){
                bestNext = needed;
                pathCost = thisSp + toKey;
            }
            
        }
        
    }
    if(keysNeeded.length > 13){
        writeln("finished branch that needed ", keysNeeded.length, " keys");
    }
    cache[ck] = pathCost;
    return pathCost;
    
}



int shortestPath(Pos p, const ref char[][] map, const ref Pos[char] keyLocations, const ref bool[char] keys, const ref bool[char] reachableKeys, const ref Letters[][char] unlockers, const ref char[][Letters] neededMap){

    //writeln("searching from ", p, " have ", keys, " and can get to ", reachableKeys);
    
    bool[char] keysNeeded;
    foreach(k; keyLocations.byKey){
        if(k !in keys){
            keysNeeded[k] = true;
        }
    }

    if(keysNeeded.empty){ return 0; }
    
    char bestNext;
    int pathCost = -1;
    
    foreach(needed; keysNeeded.byKey){
        if(needed ! in reachableKeys){ continue; }
        //writeln("trying to get to ", needed, " first");
        auto toKey = bfsLength(p, keyLocations[needed], map, keys);
        assert(toKey >= 0);

        bool[char] newKeys = cast(bool[char])keys.dup;
        newKeys[needed] = true;

        //writeln("new keys:", newKeys);
        
        bool[char] newReachable = cast(bool[char])reachableKeys.dup;
        foreach(k; keysNeeded.byKey){
            if(k !in reachableKeys){
                if(needed !in unlockers){ continue; }
                foreach(pr; unlockers[needed]){
                    //                    writeln("unlocker entry ", pr);
                    if(pr.s == needed){
                        
                        bool ok = true;
                        //                        writeln("checking all good in: ", neededMap[pr]);
                        foreach(n; neededMap[pr]){
                            if(n !in newKeys){
                                //                                writeln("nope: ", n);
                                ok = false;
                                break;
                            }
                        }
                        if(ok){
                            //                            writeln("good");
                            newReachable[ pr.t] = true;
                        }
                    }
                }
                
                //writeln("is ", k, " reachable now?");
                //auto dist = bfsLength(keyLocations[needed], keyLocations[k], map, newKeys);
                //writeln("checked for ", k, " dist: ", dist);
                //if(dist >= 0){
                //                    newReachable ~= k;
                //                }
            }
        }
        
        
        int sp = shortestPath(keyLocations[needed], map, keyLocations, newKeys, newReachable, unlockers, neededMap);
        
        if(sp >= 0 && (pathCost < 0 || (sp + toKey) < pathCost)){
            bestNext = needed;
            pathCost = toKey + sp;
        }

    }
    if(keys.length < 20){
        writeln("finished branch with ", keys.length, " keys");
    }
    return pathCost;
    
}



void main(){

    writeln(input);
    
    char[][] map;

    Pos[char] keyLocations;

    bool[char] keys;

    Pos robotPos;
    
    const cols = input.length - input.find('\n').length;

    char[] row;
    foreach(ch; input.byChar){
        
        if(ch == '\n'){
            map ~= row;
            row = [];
            continue;
        }
           
        
        row ~= ch;

        if(isLower(ch)){
            keyLocations[ch] = Pos(to!int(map.length), to!int(row.length -1));
        }

        if(ch == '@'){
            robotPos = Pos(to!int(map.length), to!int(row.length -1));
        }
    }

    const rows = map.length;

    writeln(keyLocations);
    writeln(keyLocations.length);

    bool[char] reachable;
    foreach(k, p; keyLocations){
        auto dist = bfsLength(robotPos, p, map, keys);
        if(dist >= 0){
            writeln("distance to ", k, " is ", dist);
            reachable[k] = true;
        }
    }


    /*
    char[][Letters] neededMap;
    
    Letters[][char] unlockers;

    foreach(char x; keyLocations.keys){
        foreach(char y; keyLocations.keys){
            
            auto needed = keysNeededOnPath(keyLocations[x], keyLocations[y], map);

            neededMap[Letters(x, y)] = needed;
            neededMap[Letters(y, x)] = needed;

            foreach( ch; needed){
                unlockers[ch] ~= Letters(x,y);
                unlockers[ch] ~= Letters(y,x);
            }
        }
        }*/

    bool[char] allKeys;
    foreach(k; keyLocations.byKey){
        allKeys[k] = true;
    }
    writeln("num keys", allKeys.length);
    int[char][char] distanceTable;
    foreach(char x; allKeys.byKey){
        foreach(char y; allKeys.byKey){
            distanceTable[x][y] = bfsLength(keyLocations[x], keyLocations[y], map, allKeys);
        }
    }
    

    bool[char][char] blocks;
    foreach(x; allKeys.byKey){
        auto kn = keysNeededOnPath(robotPos, keyLocations[x], map);
        foreach(k; kn){
            blocks[x][k] = true;
        }
    }

    writeln("blocks: ");
    writeln(blocks);
    
    writeln("done preprocessing");
    
    //    foreach(k, u; unlockers){
    //        writeln(k, ": ", u);
    //    }
    
    //    writeln(shortestPath(robotPos, map, keyLocations, keys, reachable, unlockers, neededMap));
    bool[char] noKeys;
    writeln("best: ", sp(robotPos, '@', map, keyLocations, noKeys, allKeys, blocks, reachable, distanceTable));
    

}
