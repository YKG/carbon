package vm2;

import util.MultiThreadUtils;

import java.util.Map;
import java.util.Stack;

public class VM {
    ClazzArea clazzArea;
    MethodArea methodArea;
    StaticFieldsArea staticFieldsArea;
    InstanceFieldsCopyArea instanceFieldsCopyArea;

    Map<String,MultiThreadUtils.TranslateWorker> classMap;

    Object returnValue;         /* hen xian ran --comment by boss */
    Stack<Frame> callstack;     /* you know it  --comment by boss */
    String mainClazzName;       /* bu jie shi   --comment by boss */

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

    public VM(){
        // init
    }

    public void setMainClazzName(String mainClazzName){
        this.mainClazzName = mainClazzName;

        // pc = -1;
        // invoke-static mainClazz->main.
    }

    public void run(){
        while(pc != -1){
            code[pc].accept(interpreter);
        }
    }

    Object getObjectByReg(String regStr){
        return regs[Integer.parseInt(regStr)];
    }

    void setObjectToReg(String regStr, Object obj){
        regs[Integer.parseInt(regStr)] = obj;
    }

    Object[] getArrayPayload(int index){
        return ((ast.stm.Instruction.ArrayDataDirective)code[index]).toArray();
    }
}
