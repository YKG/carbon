package vm2;

public class Method {
    int registerCount;
    ast.stm.T[] code;
    boolean isNative;

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
}
