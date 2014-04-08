package vm;

import java.util.Hashtable;
import java.util.Stack;

/**
 * Created by YKG on 14-4-8.
 */
public final class VMThread extends Thread{
    int pc;
    Frame currentFrame;
    VMMethod currentMethod;
    VMClass currentClass;
    Stack<Frame> stack;
    Object returnValue;
    // Stack<> nativeStack;

    private opt.Instruction.T code[];

    public VMThread(VM vm, VMClass klass, VMMethod initMethod){
        this.pc = 0;


        this.currentClass = klass;
        this.stack = new Stack<>();

    }

    public void run(){
        Interpreter interpreter = new Interpreter(this);
        while (stack.size() > 0){
            code[pc].accept(interpreter);
        }
    }

    final class Frame{
        boolean[] regType; // is a ref or a primitive
        Object[] reg;
        Hashtable<Range, Integer> exceptionTable;

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


