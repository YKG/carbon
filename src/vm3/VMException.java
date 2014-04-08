package vm3;

public class VMException {
    VM vm;

    public VMException(VM vm){
        this.vm = vm;
    }

    public void printStackTrace(){
        int height = vm.callstack.indexOf(vm.callstack.lastElement());
        for(int i = height; ; i--){
            Frame frame = vm.callstack.elementAt(i);
            if (frame.pc < 0){
                break;
            }
            Debug.error("[STACK TRACE]: " + frame.currentClazz + "->" + frame.currentMethod + frame.code[frame.pc] + " pc: " + frame.pc);
        }
        Util.printErr("");
    }
}
