package vm;

import java.util.ArrayList;
import java.util.Stack;

public final class VMThread extends Thread{
    VM vm;
    Interpreter interpreter;
    int pc;
    Frame currentFrame;
    VMMethod currentMethod;
    VMClass currentClass;
    Stack<Frame> stack;

    Object returnValue;
    Object exception;
    // Stack<> nativeStack;
    int count;

//    opt.Instruction.T code[];

    /**
     * May not enough.
     */
    public VMThread(VM vm, VMMethod initMethod){
        this.vm = vm;

        this.stack = new Stack<>();
        setExecuteEnv(initMethod, new int[0]);
    }

    void setExecuteEnv(VMMethod method, int[] args){
        if (method.isNative()){
            Debug.panic(Thread.currentThread() + " " + method.definingClass.className + "->" + method.methodSign + "<<<<<<<< NATIVE");
        }else{
            Debug.info(Thread.currentThread() + " " + method.definingClass.className + "->" +  method.methodSign + "<<<<<<<<");
        }

        Frame frame = new Frame(method);
        frame.fixParameters(args);
        stack.push(frame);

        pc = 0;
        currentFrame = frame;
        currentMethod = method;
        currentClass = method.definingClass;

        returnValue = null;
        exception = null;

        if (interpreter != null){
            interpreter.updateExecEnv(frame);
        }
    }

    public void run(){
        interpreter = new Interpreter(this);
        while (!stack.empty()){
            try{
                Debug.info(Thread.currentThread()
                        + " " + currentClass.className + "->" + currentMethod.methodSign + ":" + pc
                        + " " + count++ + " "
                        + currentMethod.code[pc].source);
                currentMethod.code[pc].accept(interpreter);
            }catch (Exception e){
                e.printStackTrace();
                Debug.panic("I am died!");
                exception = e;
            }

            if (exception != null){
                interpreter.handleException();
            }
        }
    }

    public void handleClinit(VMMethod clinit){
        int depth = stack.size();
        currentFrame.pc = pc;
        setExecuteEnv(clinit, new int[0]);
        while (stack.size() > depth){
            try{
                Debug.info(Thread.currentThread()
                        + " " + currentClass.className + "->" + currentMethod.methodSign + ":" + pc
                        + " " + count++ + " "
                        + currentMethod.code[pc].source);
                if (count == 316){
                    int ax = 1;
                }
                currentMethod.code[pc].accept(interpreter);
            }catch (Exception e){
                e.printStackTrace();
                Debug.panic("I am died!");
                exception = e;
            }

            if (exception != null){
                interpreter.handleException();
            }
        }
//        assert currentFrame.pc == pc;
        pc = currentFrame.pc;
    }

    final class Frame{
        public VMMethod method;
        VMMethod.ExceptionTable exceptionTable;
        Object[] reg;
        int pc;
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
