module cpu;
import std.stdio;
import std.range;

struct IOPort{
    alias data this;
    long[] data;
};

struct CPU{

    long[long] memory;
    IOPort *input;
    IOPort *output;
    long pc;
    long relativeOffset; 
    enum RetCode{ Halted, Blocked};

    this(long[] insts, ref IOPort inp, ref IOPort outp){
        foreach(i, inst; insts){
            memory[i] = inst;
        }
        input = &inp;
        output = &outp;
        pc = 0;
        relativeOffset = 0;
    }

    private long readMem(long addr){
        if(addr !in memory)
            memory[addr] = 0;
        return memory[addr];
    }
    
    RetCode run(){

        while(true){
            //    writeln("pc: ", pc, " arr: ", array);
            long inst = readMem(pc);
            int opcode = inst % 100;
            long modes = inst /100;
                        
            if(opcode == 99) return RetCode.Halted;
       


            long readOp(int op){
                int mode = (modes / 10^^ (op -1)) % 10;
                switch(mode){
                    case 0: //position based
                        return readMem(readMem(pc + op));
                    case 1: //immediate
                        return readMem(pc + op);
                    case 2: //relative offset
                        return readMem(relativeOffset + readMem(pc + op));
                    default:
                        assert(false);
                }
            }

            long realAddress(int op){
                int mode = (modes / 10^^ (op -1)) % 10;
                switch(mode){
                    case 0:
                        return readMem(pc + op);
                    case 1:
                        assert(false); //immediate.. doesn't make sense
                    case 2:
                        return relativeOffset + readMem(pc + op);
                    default:
                        assert(false);
                }
            }

            //writeln("running: ", array[pc], " m1 ", mode1, " m2 ", mode2, " m3 ", mode3);

            switch(opcode){
                case 1: //plus
                    memory[realAddress(3)] = readOp(1) + readOp(2);
                    pc += 4;
                    break;
                case 2: //times
                    memory[realAddress(3)] = readOp(1) * readOp(2);
                    pc += 4;
                    break;


                case 3: //input
                    if(input.empty)
                        return RetCode.Blocked;
                    //writeln("input is: ", (*input)[0]);
                    memory[realAddress(1)] = (*input)[0];
                    *input = (*input)[1.. $];
                    pc += 2;
                    break;

                case 4:
                    long toPrint = readOp(1);
                    //                    writeln("output: ", toPrint);
                    *output ~= toPrint;
                    pc += 2;
                    break;

                case 5:  //jump if true
                    if(readOp(1) != 0){
                        pc = readOp(2);
                    } else {
                        pc += 3;
                    }
                    break;

                case 6: //jump if false
                    if(readOp(1) == 0){
                        pc = readOp(2);
                    } else {
                        pc += 3;
                    }
                    break;

                case 7: //less than
                    memory[realAddress(3)] = readOp(1) < readOp(2) ? 1 : 0;
                    pc += 4;
                    break;

                case 8: //equals
                    memory[realAddress(3)] = readOp(1) == readOp(2) ? 1 : 0;
                    pc += 4;
                    break;

                case 9: //change relpos
                    relativeOffset += readOp(1);
                    pc += 2;
                    break;
                    
                default:
                    assert(false);
               
            }

       
        }
        assert(false);
    }
}
