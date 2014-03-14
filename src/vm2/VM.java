package vm2;

import util.MultiThreadUtils;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Stack;

public class VM {
	ClazzArea clazzArea;
	MethodArea methodArea;
	StaticFieldsArea staticFieldsArea;
	InstanceFieldsArea instanceFieldsArea;
	private ClazzLoader clazzLoader;

	Map<String, MultiThreadUtils.TranslateWorker> classMap;

	Object returnValue; /* hen xian ran --comment by boss */
	Stack<Frame> callstack; /* you know it  --comment by boss */
	String mainClazzName; /* bu jie shi   --comment by boss */

	/**
	 * code:   simulate x86's CS register
	 * pc:     simulate x86's IP register,
	 *         '-1' indicate the program finished,
	 *         'code[pc]' is the current instruction.
	 */
	Object[] regs;
	ast.stm.T[] code;
	int pc;

	private Interpreter interpreter;

	public VM(Map<String, MultiThreadUtils.TranslateWorker> classMap) {
		// init
        this.clazzArea = new ClazzArea(this);
        this.methodArea = new MethodArea(this);
        this.staticFieldsArea = new StaticFieldsArea(this);
        this.instanceFieldsArea = new InstanceFieldsArea(this);
        this.clazzLoader = new ClazzLoader(this);
        this.classMap = classMap;
        this.returnValue = new Object();
        this.callstack = new Stack<Frame>();
        this.interpreter = new Interpreter(this);
	}

	public void loadClazz(String clazzName) {
		this.clazzLoader.loadClazz(clazzName);
	}
	
	public void setMainClazzName(String mainClazzName) {
		this.mainClazzName = mainClazzName;
	}

	public void run() {
        /**
         * When the main() method finished, we expect the pc is -1.
         */
        pc = -1;
        saveFrame();
        setExecuteEnv(getMethod(mainClazzName, "main([Ljava/lang/String;)V"), new LinkedList<String>());

		while (pc != -1) {
			code[pc].accept(interpreter);
		}
	}
	
    Object[] getObjectsByRegRange(String regFirst, String regLast){
        int first = vm2.Util.hex2int(regFirst.substring(1));
        int last  = vm2.Util.hex2int(regLast.substring(1));
        int count = last - first + 1;
        Object[] objs = new Object[count];
        for(int i = 0; i < count; i++){
            objs[i] = getObjectByReg(i);
        }
        return objs;
    }
    
    Object getObjectByReg(int index){
        return regs[index];
    }

	Object getObjectByReg(String regStr) {
		return regs[Integer.parseInt(regStr.substring(1))];
	}

    void setObjectToReg(int index, Object obj) {
        regs[index] = obj;
    }

	void setObjectToReg(String regStr, Object obj) {
		regs[Integer.parseInt(regStr.substring(1))] = obj;
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

	void popFrame() {
		pc = callstack.peek().pc;
		code = callstack.peek().code;
		regs = callstack.peek().regs;
		callstack.pop();
	}

	void setReturnValue(String regstr) {
		setObjectToReg(regstr, returnValue);
	}

	Object getReturnValue() {
		return returnValue;
	}

	Object[] getParameters(List<String> argList) {
        assert argList != null;
		int size = argList.size();
		Object[] parameters = new Object[size];
		for(int i =0 ;i<size ;i++)
			parameters[i] = getObjectByReg(argList.get(i));
		return parameters;
	}

    Method getMethod(String clazzName, String methodSign){
        return methodArea.getMethod(clazzName, methodSign);
    }

    // TODO FIX MY NAME
    //      the meaning should represent saving VM status to a
    //      frame, then push this saved frame on callstack.
    void saveFrame(){
        Frame frame = new Frame(regs, code, pc);
        callstack.push(frame);
    }

    private void passParameters(int regCount, List<String> argList){
        Object[] parameters = getParameters(argList);
        int p0index = regCount - parameters.length;
        //add by hong
        regs = new Object[regCount];
        System.arraycopy(parameters, 0, regs, p0index, parameters.length);
    }

    // TODO FIX MY NAME
    void setExecuteEnv(Method method, List<String> argList){
    	passParameters(method.registerCount, argList);
        code = method.code;
        pc = 0;
    }
}



















