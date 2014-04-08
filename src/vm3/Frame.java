package vm3;

public class Frame {
    Object[] reg;
    ast.stm.T[] code;
    int pc;

    String currentClazz;
    String currentMethod;

// NO DEBUG INFO
//    public Frame(Object[] reg, ast.stm.T[] code, int pc){
//        this.reg = reg;
//        this.code = code;
//        this.pc = pc;
//    }

    public Frame(Object[] reg, ast.stm.T[] code, int pc, String currentClazz, String currentMethod){
        this.reg = reg;
        this.code = code;
        this.pc = pc;

        this.currentClazz = currentClazz;
        this.currentMethod = currentMethod;
    }
}
