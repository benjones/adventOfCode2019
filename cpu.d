module cpu;
import std.stdio;

int runProgram(int[] array, int[] inputs){
   int pc = 0;
   while(true){
       //    writeln("pc: ", pc, " arr: ", array);
       int opcode = array[pc] % 100;
       if(opcode == 99) break;
       
       int modes = array[pc] /100;

       int mode1 = modes % 10;
       int mode2 = (modes /10) % 10;
       int mode3 = modes / 100;

       //writeln("running: ", array[pc], " m1 ", mode1, " m2 ", mode2, " m3 ", mode3);

       switch(opcode){
           case 1: //plus
               assert(mode3 == 0);
               int op1 = mode1 == 1 ? array[pc +1] : array[array[pc +1]];
               int op2 = mode2 == 1 ? array[pc +2] : array[array[pc +2]];
               array[array[pc +3]] = op1 + op2;
               pc += 4;
               break;
           case 2: //times
               assert(mode3 == 0);
               int op1 = mode1 == 1 ? array[pc +1] : array[array[pc +1]];
               int op2 = mode2 == 1 ? array[pc +2] : array[array[pc +2]];
               array[array[pc +3]] = op1 * op2;
               pc += 4;
               break;


           case 3: //input
               assert(mode1 == 0);
               array[array[pc +1]] = inputs[0];
               inputs = inputs[1.. $];
               pc += 2;
               break;

           case 4:
               int toPrint = mode1 == 1 ? array[pc +1] : array[array[pc +1]];
               writeln("output: ", toPrint);
               pc += 2;
               break;

           case 5:  //jump if true
               int op1 = mode1 == 1 ? array[pc +1] : array[array[pc +1]];
               int op2 = mode2 == 1 ? array[pc +2] : array[array[pc +2]];
               if(op1 != 0){
                   pc = op2;
               } else {
                   pc += 3;
               }
               break;

           case 6: //jump if false
               int op1 = mode1 == 1 ? array[pc +1] : array[array[pc +1]];
               int op2 = mode2 == 1 ? array[pc +2] : array[array[pc +2]];
               if(op1 == 0){
                   pc = op2;
               } else {
                   pc += 3;
               }
               break;

           case 7: //less than
               int op1 = mode1 == 1 ? array[pc +1] : array[array[pc +1]];
               int op2 = mode2 == 1 ? array[pc +2] : array[array[pc +2]];

               assert(mode3 == 0);
               array[array[pc +3]] = op1 < op2 ? 1 : 0;
               
               pc += 4;
               break;

           case 8: //equals
               int op1 = mode1 == 1 ? array[pc +1] : array[array[pc +1]];
               int op2 = mode2 == 1 ? array[pc +2] : array[array[pc +2]];

               assert(mode3 == 0);
               array[array[pc +3]] = op1 == op2 ? 1 : 0;

               pc += 4;
               break;
           default:
               assert(false);
               
       }

       
    }
   //    writeln("pc: ", pc, " arr: ", array);
   if(array[pc] != 99){
       import std.stdio;
       writeln("error");
   }
   return array[0];   
}
