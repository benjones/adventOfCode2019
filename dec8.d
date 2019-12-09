import std.stdio;
import std.range;
import std.algorithm;
import std.conv;
import std.array;
import std.file;
import std.utf;

void main(){


    char[] input = readText("dec8input.txt").byChar.array.dup;

    input = input[0 .. $ -1]; //toss ending newline

    enum width = 25;
    enum height = 6;

    alias layer = char[width*height];

    layer[] layers;

    foreach(ch; chunks(input, width*height)){
        layer l;
        char[] arr = ch.byChar.array;
        //        writeln(arr.length, arr);
        l[] = arr[];
        layers ~= l;
    }


    auto zeroes = layers.map!( a => count(a[], '0'));

    auto mi = zeroes.minIndex;

    auto minLayer = layers[mi];

    writeln(minLayer[].count('1') * minLayer[].count('2'));


    layer output = '2';
    foreach(l; layers){
        foreach(i, c; l){
            if(output[i] == '2'){
                output[i] = c;
            }
        }
    }

    foreach(r; 0 .. height){
        foreach(c; 0 .. width){
            write(output[c + r*width] == '0' ? 'X' : ' ');
        }
        writeln();
    }

}
