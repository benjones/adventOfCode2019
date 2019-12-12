const input = `<x=14, y=15, z=-2>
<x=17, y=-3, z=4>
<x=6, y=12, z=-13>
<x=-2, y=10, z=-8>`;

/*const input = `<x=-1, y=0, z=2>
<x=2, y=-10, z=-7>
<x=4, y=-8, z=8>
<x=3, y=5, z=-1>`;*/

import std.algorithm;
import std.range;
import std.array;
import std.conv;
import std.stdio;
import std.regex;
import std.math;
import std.numeric;

struct Vec3{
    alias data this;
    short[3] data;
}

struct State{
    Vec3 p, v;
}

struct Universe{
    alias states this;
    State[4] states;
}

struct State1{
    int p, v;
}

struct U1{
    alias states this;
    State1[4] states;
}

struct RepInfo{
    ulong start;
    ulong period;
}

void main(){



    const reg = regex(r"<x=(-?\d+), y=(-?\d+), z=(-?\d+)>");

    Universe states;

    
    foreach(i, line; input.split("\n")){
        auto match = matchFirst(line, reg);
        states[i].p = Vec3([to!short(match[1]), to!short(match[2]),to!short(match[3])]);
    }


    
    writeln(states);

    //ulong[Universe] seen;

    RepInfo[3] repInfo;
    
    foreach(c; 0 ..3){
        U1 states1;
        foreach(i; 0 ..states.length){
            states1[i].p = states[i].p[c];
        }
        
        ulong[U1] seen1;
        
        foreach(i; 0 .. 10000000000){
            if((i & 0xFFFFFF) == 0){ writeln("iter: ", i); }
            foreach(a; 0 .. states.length){
                foreach(b; a + 1.. states.length){
                    if(states1[a].p < states1[b].p){
                        states1[a].v += 1;
                        states1[b].v -= 1;
                    }else if(states1[a].p > states1[b].p){
                        states1[a].v -= 1;
                        states1[b].v += 1;
                    }
                
                /*
                foreach(c; 0..3){
                    if(states[a].p[c] < states[b].p[c]){
                        states[a].v[c] += 1;
                        states[b].v[c] -= 1;
                    } else if(states[a].p[c] > states[b].p[c]){
                        states[a].v[c] -= 1;
                        states[b].v[c] += 1;
                    }
                }
                */
                
            }
        }

        foreach(ref state; states1){
            /*foreach(c; 0 ..3){
                state.p[c] += state.v[c];
                }*/
            state.p += state.v;
        }
        if(states1 in seen1){
            writeln("iter ", i, " saw the state in ", seen1[states1], " answer is ", i - seen1[states1]);
            repInfo[c] = RepInfo(seen1[states1], i - seen1[states1]);
            break;
        }
        seen1[states1] = i;
        //writeln("i: ", states);
        }
    }

    /*
    int energy = 0;
    foreach(state; states){
    int pe = abs(state.p[0]) + abs(state.p[1]) + abs(state.p[2]);
    int ke = abs(state.v[0]) + abs(state.v[1]) + abs(state.v[2]);
    energy += pe*ke;
    }*/
        
    writeln(repInfo);
    writeln(repInfo[0].period * repInfo[1].period * repInfo[2].period);

    auto lcm1 = repInfo[0].period*repInfo[1].period/ gcd(repInfo[0].period, repInfo[1].period);

    auto lcm2 = lcm1*repInfo[2].period / gcd(lcm1, repInfo[2].period);

    writeln(lcm1);
    writeln(lcm2);
    

}
