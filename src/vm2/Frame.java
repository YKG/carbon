package vm2;

public class Frame {
    Object[] reg;
    ast.stm.T[] code;
    int pc;

    public Frame(Object[] reg, ast.stm.T[] code, int pc){
        this.reg = reg;
        this.code = code;
        this.pc = pc;
    }
}
