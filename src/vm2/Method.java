package vm2;

public class Method {
    int registerCount;
    ast.stm.T[] code;


    public Method(ast.method.Method method) {
        this.registerCount = Integer.parseInt(method.registers_directive_count);
        this.code = new ast.stm.T[method.statements.size()];
        for(int i = 0; i < method.statements.size(); i++){
            code[i] = method.statements.get(i);
        }
    }
}
