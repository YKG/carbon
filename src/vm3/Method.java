package vm3;

public class Method {
    int registerCount;
    ast.stm.T[] code;
    boolean isNative;
    String fullName;

    public Method(ast.method.Method method) {
        if((method.accessFlag & Const.NATIVE) != 0){
            Debug.verbose("NATIVE METHOD: " + method.getMethodSign() + " regs: " + method.registers_directive_count);
            this.isNative = true;
            return;
        }
        if((method.accessFlag & Const.ABSTRACT) != 0){
            Debug.verbose("ABSTRACT METHOD: " + method.getMethodSign() + " regs: " + method.registers_directive_count);
            return;
        }

        this.registerCount = Integer.parseInt(method.registers_directive_count);
        this.code = new ast.stm.T[method.statements.size()];
        for(int i = 0; i < method.statements.size(); i++){
            code[i] = method.statements.get(i);
        }
        this.isNative = false;

        this.fullName = method.getMethodSign();
    }

}
