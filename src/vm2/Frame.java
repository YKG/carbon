package vm2;

public class Frame {
    Object[] regs;
    ast.stm.T[] code;
    int pc;

    public Frame(Object[] regs, ast.stm.T[] code, int pc){
        this.regs = regs;
        this.code = code;
        this.pc = pc;
    }
}
