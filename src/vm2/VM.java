package vm2;

import java.util.List;
import java.util.Map;
import java.util.Stack;

import util.MultiThreadUtils;

public class VM {
	ClazzArea clazzArea;
	MethodArea methodArea;
	StaticFieldsArea staticFieldsArea;
	InstanceFieldsArea instanceFieldsArea;

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

	Interpreter interpreter;

	public VM() {
		// init
	}

	public void setMainClazzName(String mainClazzName) {
		this.mainClazzName = mainClazzName;

		// pc = -1;
		// invoke-static mainClazz->main.
	}

	public void run() {
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
		return regs[Integer.parseInt(regStr)];
	}

	void setObjectToReg(String regStr, Object obj) {
		regs[Integer.parseInt(regStr)] = obj;
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
		callstack.pop();
		pc = callstack.peek().pc;
		code = callstack.peek().code;
		regs = callstack.peek().regs;
	}

	void setReturnValue(String regstr) {
		setObjectToReg(regstr, returnValue);
	}

	Object getReturnValue() {
		return returnValue;
	}

	void pushFrame(Frame frame) {
		callstack.push(frame);
		pc = 0;
		code = callstack.peek().code;
		regs = callstack.peek().regs;
	}

	Object[] getParameters(List<String> argList) {
		int size = argList.size();
		Object[] parameters = new Object[size];
		for(int i =0 ;i<size ;i++)
			parameters[i] = getObjectByReg(argList.get(i));
		return parameters;
	}
}



















