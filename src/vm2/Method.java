package vm2;

public class Method {
    int registerCount;
    ast.stm.T[] code;


    public Method(ast.method.Method method,ast.stm.T[] code) {
        this.registerCount = Integer.parseInt(method.registers_directive_count);
        this.code = code;
    }
}
