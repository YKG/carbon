package vm;

public class VMArray {
    VMClass klass;
    int length;
    int dimension;

    // element type (no primitive?)

    public VMArray(VMClass klass, int length) {
        this.length = length;
        this.klass = klass;
    }

    public int length(){
        // TODO
        return 0;
    }

    public Object get(int index){
        return null;
    }

    public void set(int index, Object obj){

    }
}
