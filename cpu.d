module cpu;
import std.stdio;
import std.range;

struct IOPort{
    alias data this;
    int[] data;
};

struct CPU{

    int[] array;
    IOPort *input;
    IOPort *output;
    int pc;
    enum RetCode{ Halted, Blocked};

    RetCode run(){

        while(true){
            //    writeln("pc: ", pc, " arr: ", array);
            int opcode = array[pc] % 100;
            if(opcode == 99) return RetCode.Halted;
       
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
                    if(input.empty)
                        return RetCode.Blocked;
                    array[array[pc +1]] = (*input)[0];
                    *input = (*input)[1.. $];
                    pc += 2;
                    break;

                case 4:
                    int toPrint = mode1 == 1 ? array[pc +1] : array[array[pc +1]];
                    writeln("output: ", toPrint);
                    *output ~= toPrint;
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
        assert(false);
    }
}
