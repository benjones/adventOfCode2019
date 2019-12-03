module cpu;

int runProgram(int[] array){
   int pc = 0;
   while(array[pc] == 1 || array[pc] == 2){
       //    writeln("pc: ", pc, " arr: ", array);
       if(array[pc] == 1){
           array[array[pc +3]] = array[array[pc + 1]] + array[array[pc +2]];
       } else {
           array[array[pc +3]] = array[array[pc + 1]] * array[array[pc +2]];
       }
       pc += 4;
       
    }
   //    writeln("pc: ", pc, " arr: ", array);
   if(array[pc] != 99){
       import std.stdio;
       writeln("error");
   }
   return array[0];   
}
