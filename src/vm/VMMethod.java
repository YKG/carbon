package vm;

/**
 * Created by YKG on 14-4-8.
 */
public class VMMethod {
    opt.Instruction.T code[];
    VMClass definingClass;

    public VMClass getDefiningClass(){
        return definingClass;
    }
}
