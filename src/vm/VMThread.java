package vm;

import java.util.Hashtable;
import java.util.Stack;

/**
 * Created by YKG on 14-4-8.
 */
public final class VMThread extends Thread{
    VM vm;
    int pc;
    Frame currentFrame;
    VMMethod currentMethod;
    VMClass currentClass;
    Stack<Frame> stack;
    Object returnValue;
    // Stack<> nativeStack;

    private opt.Instruction.T code[];

    public VMThread(VM vm, VMMethod initMethod){
        this.vm = vm;

        this.stack = new Stack<>();
        setExecuteEnv(initMethod, new int[0]);
    }

    void setExecuteEnv(VMMethod method, int[] args){
        Frame frame = new Frame(method);
        frame.fixParameters(args);
        stack.push(frame);

        currentFrame = frame;
        currentMethod = method;
        currentClass = method.getDefiningClass();

        code = currentMethod.code;
        pc = 0;
    }

    public void run(){
        Interpreter interpreter = new Interpreter(this);
        while (stack.size() > 0){
            code[pc].accept(interpreter);
        }
    }

    final class Frame{
        VMMethod method;

        boolean[] regType; // is a ref or a primitive
        Object[] reg;
        Hashtable<Range, Integer> exceptionTable;

        public Frame(VMMethod method){

        }

        void fixParameters(int[] args){
            // TODO
        }

        final class Range{
            private int begin;
            private int end;

            Range(int begin, int end) {
                this.begin = begin;
                this.end = end;
            }

            public boolean capture(int pos){
                return begin <= pos && pos < end;
            }
        }
    }

    void saveReturnValue(int retReg){
        //TODO
    }

    void restoreThreadState(){
        //TODO
    }

    void saveThreadState(){
        //TODO
    }
}


