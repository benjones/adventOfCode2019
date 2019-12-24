const input =`59704176224151213770484189932636989396016853707543672704688031159981571127975101449262562108536062222616286393177775420275833561490214618092338108958319534766917790598728831388012618201701341130599267905059417956666371111749252733037090364984971914108277005170417001289652084308389839318318592713462923155468396822247189750655575623017333088246364350280299985979331660143758996484413769438651303748536351772868104792161361952505811489060546839032499706132682563962136170941039904873411038529684473891392104152677551989278815089949043159200373061921992851799948057507078358356630228490883482290389217471790233756775862302710944760078623023456856105493`;

//const input = `12345678`;

import std.array;
import std.algorithm;
import std.stdio;
import std.conv;
import std.string;
import std.utf;
import std.math;

const digits = input.byChar.map!(a => a - '0').array;

struct Entry{
    int index, iter;
}
int valAt(Entry entry){
    static int[Entry] data;

    const i = entry.index;

    if(entry.iter == 0){
        return digits[i % input.length];
    }
    if(entry in data){
        return data[entry];
    }

    int ret = 0;
    const limit = digits.length*10000;
    for(int start = i; start < limit; start += 4*(i+1)){
        foreach(add; 0 .. i + 1){
            if(start + add < limit){
                ret += valAt(Entry(start + add, entry.iter -1));
            }
            if(start + add + 2*(i + 1) < limit){
                ret -= valAt(Entry(start + add + 2*(i + 1), entry.iter -1));
            }
        }
    }
    ret = abs(ret) % 10;
    data[entry] = ret;
    return ret;
}

void main(){
    int offset = to!int(input[0 ..7]);
    writeln(offset);

    const msgLen = 10000uL*digits.length;
    writeln(msgLen);

    const neededLen = msgLen - offset;
    writeln(neededLen);
    
    writeln(msgLen/2 + 1);

    int[] current = new int[neededLen];
    foreach(i; 0 .. neededLen){
        current[i] = digits[(offset + i) % digits.length];
    }


    auto next = current.dup;

    foreach(step; 0.. 100){
        next[$-1] = current[$ -1];
        foreach_reverse(i; 0 .. neededLen -1){
            next[i] = (next[i+1] + current[i]) % 10;
        }
        swap(next, current);
    }
    foreach(i; 0 .. 8){
        write(current[i]);
    }
    writeln();
    
}
