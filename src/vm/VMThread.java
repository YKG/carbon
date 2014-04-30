package vm;

import java.util.ArrayList;
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
    int count;

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
        Debug.info(Thread.currentThread() + " " + method.definingClass.className + "->" +  method.methodSign + "<<<<<<<<");
        Frame frame = new Frame(method);
        frame.fixParameters(args);
        stack.push(frame);

        currentFrame = frame;
        currentMethod = method;
        currentClass = method.definingClass;

        code = currentMethod.code;
        pc = 0;
    }

    public void run(){
        Interpreter interpreter = new Interpreter(this);
        while (!stack.empty()){
            try{
                Debug.info(Thread.currentThread() + " " + count++ + " " + code[pc].source);
                code[pc].accept(interpreter);
            }catch (Exception e){
                e.printStackTrace();
                exception = e;
            }

            if (exception != null){
                interpreter.handleException();
            }
        }
    }

    final class Frame{
        public VMMethod method;
        VMMethod.ExceptionTable exceptionTable;
        Object[] reg;
//        boolean[] regType; // is a ref or a primitive

        public Frame(VMMethod method){
            this.method = method;
            exceptionTable = method.exceptionTable;
            reg = new Object[method.regCount];
        }

        void fixParameters(int[] args){
            if (args.length == 0) return;

            Frame prev = stack.peek();
            ArrayList<Object> params = new ArrayList<>();
            for(int e : args){
                params.add(prev.reg[e]);
            }
            Object[] parameters = params.toArray();
            int p0index = reg.length - parameters.length;
//            reg = new Object[reg.length];
            System.arraycopy(parameters, 0, reg, p0index, parameters.length);
        }
    }
}
