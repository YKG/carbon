package vm;

import java.util.Stack;

public final class VMThread extends Thread{
    VM vm;
    int pc;
    Frame currentFrame;
    VMMethod currentMethod;
    VMClass currentClass;
    Stack<Frame> stack;

    Object returnValue;
    Object exception;
    // Stack<> nativeStack;

    private opt.Instruction.T code[];

    /**
     * May not enough.
     */
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
        while (!stack.empty()){
            try{
                code[pc].accept(interpreter);
                if (exception != null){
                    interpreter.handleException();
                }
            }catch (Exception e){
                interpreter.handleException();
            }
        }
    }

    final class Frame{
        public VMMethod method;
        VMMethod.ExceptionTable exceptionTable;
        boolean[] regType; // is a ref or a primitive
        Object[] reg;


        public Frame(VMMethod method){
            // TODO
        }

        void fixParameters(int[] args){
            // TODO
        }
    }
}


