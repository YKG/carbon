package vm2;

import java.lang.reflect.Constructor;

public class Method {
    int registerCount;
    ast.stm.T[] code;
    boolean isNative;

    //hack for system call
    boolean isSystemMethod;
    boolean isConstructor;
    java.lang.reflect.Method systemMethod;
    Constructor constructor;

    public Method(ast.method.Method method) {

        if((method.accessFlag & Const.NATIVE) != 0){
            Debug.verbose("NATIVE METHOD: " + method.getMethodSign() + " regs: " + method.registers_directive_count);
            this.isNative = true;
            return;
        }


        this.registerCount = Integer.parseInt(method.registers_directive_count);
        this.code = new ast.stm.T[method.statements.size()];
        for(int i = 0; i < method.statements.size(); i++){
            code[i] = method.statements.get(i);
        }
        this.isNative = false;
    }
    //TODO ---------------------------------------------------------------------------------
    public Method(java.lang.reflect.Method systemMethod) {
        this.isSystemMethod = true;
        this.isConstructor = false;
        this.systemMethod = systemMethod;
    }

    public Method(Constructor constructor) {
        this.isSystemMethod = true;
        this.isConstructor = true;
        this.constructor = constructor;
    }
    //TODO ---------------------------------------------------------------------------------
}
