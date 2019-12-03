const input = `1,0,0,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,9,19,1,13,19,23,2,23,9,27,1,6,27,31,2,10,31,35,1,6,35,39,2,9,39,43,1,5,43,47,2,47,13,51,2,51,10,55,1,55,5,59,1,59,9,63,1,63,9,67,2,6,67,71,1,5,71,75,1,75,6,79,1,6,79,83,1,83,9,87,2,87,10,91,2,91,10,95,1,95,5,99,1,99,13,103,2,103,9,107,1,6,107,111,1,111,5,115,1,115,2,119,1,5,119,0,99,2,0,14,0`;

//const input = `1,9,10,3,2,3,11,0,99,30,40,50`;

import std.algorithm;
import std.array;
import std.range;
import std.stdio;
import std.conv;
import std.string;

import cpu;

void main(){

    foreach(n; 0..100){
        foreach(v; 0..100){
            
            int[] array = input.split(',').map!(to!int).array;
            array[1] = n;
            array[2] = v;
            if(runProgram(array) == 19690720){
                writeln("n:", n, " v: ", v, " ans: " , 100*n + v);
                return;
            }
        }
    }
}

unittest {
    int[] array = input.split(',').map!(to!int).array;
    array[1] = 93;
    array[2] = 42;
    assert(runProgram(array) == 19690720);
}
