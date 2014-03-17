package vm2;

import util.MultiThreadUtils;

import java.util.Map;
import java.util.Stack;

public class VM {
    /**
     * code:   simulate x86's CS register
     * pc:     simulate x86's IP register,
     *         '-1' indicate the program finished,
     *         'code[pc]' is the current instruction.
     */
    Object[] reg;
    ast.stm.T[] code;
    int pc;

    Object returnValue; /* hen xian ran --comment by boss */
    Stack<Frame> callstack; /* you know it  --comment by boss */

	ClazzArea clazzArea;
	MethodArea methodArea;
	StaticFieldsArea staticFieldsArea;
	InstanceFieldsArea instanceFieldsArea;

    private ClazzLoader clazzLoader;
    private Interpreter interpreter;
    private String mainClazzName;

    //TODO ---------------------
    Map<String, MultiThreadUtils.TranslateWorker> classMap;
    //TODO ---------------------

	public VM(Map<String, MultiThreadUtils.TranslateWorker> classMap) {

        //TODO ---------------------
        this.classMap = classMap;
        //TODO ---------------------

        this.clazzArea = new ClazzArea(this);
        this.methodArea = new MethodArea(this, classMap);
        this.staticFieldsArea = new StaticFieldsArea(this);
        this.instanceFieldsArea = new InstanceFieldsArea(this);
        this.clazzLoader = new ClazzLoader(this, classMap);
        this.returnValue = new Object();
        this.callstack = new Stack<>();
        this.interpreter = new Interpreter(this);
	}

	public void setMainClazzName(String mainClazzName) {
		this.mainClazzName = mainClazzName;
	}

	public void run() {
        /**
         * When the main() method finished, we expect the pc is -1.
         */
        pc = -2;
        saveThreadState();
        setExecuteEnv(getMethod(mainClazzName, "main([Ljava/lang/String;)V"), new int[0]);

		while (pc != -1) {
            Debug.info(code[pc]);
			code[pc].accept(interpreter);
		}
	}

    void clinitHandle(Method method){
        Debug.info("exec <clinit>");
        saveThreadState();
        saveThreadState();
        setExecuteEnv(method, new int[0]);

        int deep = callstack.size();
        while(callstack.size() >= deep){
            Debug.info(code[pc]);
            code[pc].accept(interpreter);
        }
        restoreThreadState();
    }

    void saveThreadState(){
        Frame frame = new Frame(reg, code, pc);
        callstack.push(frame);
    }

	void restoreThreadState() {
        Frame frame = callstack.pop();
        reg  = frame.reg;
        code = frame.code;
        pc   = frame.pc;
	}

    void setExecuteEnv(Method method, int[] argvs){


        //TODO ----------------------
        if(method.isSystemMethod == true) {
            if(method.isConstructor == true) {
                Util.invokeConstructor(method.constructor, getObjectsFromRegs(argvs));
            } else {
                returnValue = Util.invokeSystemMethod(method.systemMethod, getObjectsFromRegs(argvs));
            }
            //simulate return
            restoreThreadState();
            pc ++ ;
            return ;
        }
        //TODO ----------------------　

        passParameters(method.registerCount, argvs);
        code = method.code;
        pc = 0;
    }

    Method getMethod(String clazzName, String methodSign){
        return methodArea.getMethod(clazzName, methodSign);
    }

    Object[] getArrayPayload(int index) {
        return ((ast.stm.Instruction.ArrayDataDirective) code[index]).toArray();
    }

    Map<Integer, Integer> getSwitchMap(int targetPc) {
        Object inst = code[targetPc];
        if (inst instanceof ast.stm.Instruction.PackedSwitchDirective)
            return ((ast.stm.Instruction.PackedSwitchDirective) inst).switchMap;
        else
            return ((ast.stm.Instruction.SparseSwitchDirective) inst).switchMap;
    }

    Object[] getObjectsFromRegs(int argvs[]) {
        assert argvs != null;
        int size = argvs.length;
        Object[] parameters = new Object[size];
        for(int i =0 ;i<size ;i++)
            parameters[i] = reg[argvs[i]];
        return parameters;
    }

    void loadClazz(String clazzName) {
        clazzLoader.loadClazz(clazzName);
    }

    private void passParameters(int regCount, int[] argvs){
        Object[] parameters = getObjectsFromRegs(argvs);
        int p0index = regCount - parameters.length;
        reg = new Object[regCount];
        System.arraycopy(parameters, 0, reg, p0index, parameters.length);
    }
}