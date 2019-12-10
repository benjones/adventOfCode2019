const input = `##.##..#.####...#.#.####
##.###..##.#######..##..
..######.###.#.##.######
.#######.####.##.#.###.#
..#...##.#.....#####..##
#..###.#...#..###.#..#..
###..#.##.####.#..##..##
.##.##....###.#..#....#.
########..#####..#######
##..#..##.#..##.#.#.#..#
##.#.##.######.#####....
###.##...#.##...#.######
###...##.####..##..#####
##.#...#.#.....######.##
.#...####..####.##...##.
#.#########..###..#.####
#.##..###.#.######.#####
##..##.##...####.#...##.
###...###.##.####.#.##..
####.#.....###..#.####.#
##.####..##.#.##..##.#.#
#####..#...####..##..#.#
.##.##.##...###.##...###
..###.########.#.###..#.`;

/*const input = `.#..#
.....
#####
....#
...##`;*/

/*const input = `.#..##.###...#######
##.############..##.
.#.######.########.#
.###.#######.####.#.
#####.##.#.##.###.##
..#####..#.#########
####################
#.####....###.#.#.##
##.#################
#####.##.###..####..
..######..##.#######
####.##.####...##..#
.#####..#.######.###
##...#.##########...
#.##########.#######
.####.#.###.###.#.##
....##.##.###..#####
.#.#.###########.###
#.#.#.#####.####.###
###.##.####.##.#..##`;*/

/*const input = `.#....#####...#..
##...##.#####..##
##...#...#.#####.
..#.....#...###..
..#.#.....#....##`;*/


import std.algorithm;
import std.range;
import std.stdio;
import std.conv;
import std.array;
import std.utf;
import std.numeric;
import std.math;

struct Ratio{

    int a, b;
    this(int x, int y){
        if(x == 0 && y == 0){ a = 0; b = 0; return;}
        const g = gcd(abs(x), abs(y));
        a = x/g;
        b = y/g;
    }
    
}

struct Point{
    int r, c;
}

int distance(Point a, Point b){
    return abs(a.r - b.r) + abs(a.c - b.c);
}

void main(){


    bool[][] grid = input.split("\n").map!( a => a.byChar.map!(b => b == '#').array).array;

    int best = 0;
    Point bestPoint;

    foreach(int row; 0.. cast(int)grid.length){
        foreach(int col; 0.. cast(int)grid[0].length){
            if(!grid[row][col]){
                //                write(' ');
                continue;
            }
            bool[Ratio] count;
            foreach(int r; 0 .. cast(int)grid.length){
                foreach(int c; 0 .. cast(int)grid[0].length){

                    if((r != row || c != col) &&  grid[r][c]){
                        Ratio rat = Ratio(r - row, c - col);
                        count[rat] = true;
                    }
                }
            }
            if(count.length > best){
                best = cast(int)count.length;
                bestPoint = Point(row, col);
            }
        }
    }

    writeln(best);
    writeln(bestPoint);

    Point[][Ratio] roids;
    foreach(int r; 0..cast(int)grid.length){
        foreach(int c; 0..cast(int)grid[0].length){
            if( (r != bestPoint.r || c != bestPoint.c) && grid[r][c]){
                roids[Ratio(r - bestPoint.r, c - bestPoint.c)] ~= Point(r, c);
            }
        }
    }

    auto ratios = roids.keys;
    //swapping x an y makes 0rad be vertical, and go clockwise
    ratios.sort!((a, b) => atan2(cast(double)a.b, cast(double)a.a) > atan2(cast(double)b.b, cast(double)b.a));

    foreach(rat; ratios){
        roids[rat].sort!((a, b) => distance(a, bestPoint) < distance(b, bestPoint));
    }


    ulong nextRatio = 0;
    foreach(i; 0.. 200){
        while(roids[ratios[nextRatio]].empty){
            nextRatio++;
            nextRatio %= ratios.length;
        }

        writeln(i +1, " destroyed ", roids[ratios[nextRatio]].front);
        roids[ratios[nextRatio]] = roids[ratios[nextRatio]][1 ..$];
        nextRatio++;
    }

    
}
