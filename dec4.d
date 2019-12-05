import std.algorithm;
import std.range;
import std.conv;
import std.stdio;
import std.array;

void main(){


    const start = 178416, stop = 676461;

    int count = 0;
    foreach(i; start .. stop){
        string s = to!string(i);
        bool adjacents = false;
        bool nondecreasing = true;

        const groups = s.group.array;
        foreach(j, g; groups){
            if(g[1] == 2){
                adjacents = true;
            }
            if(j < groups.length -1 && g[0] > groups[j+1][0]){
                nondecreasing = false;
            }
        }
        /*
        int(j = 0; j < s.length; j++){

            
            if(s[j] == s[j+1] && (j >= (s.length -2) || s[j+2] != s[j])){
                adjacents = true;
            }
            if(s[j] > s[j+1]){
                nondecreasing = false;
                break;
            }
            }*/
        if(adjacents && nondecreasing){
            count++;
        }
        
    }
    writeln(count);

    
}
