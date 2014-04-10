package vm;

public class VMInstance extends LockbleObject{
    VMClass type;

    public VMInstance(VMClass type) {
        this.type = type;
    }

    /**
     * The parameter 'className' may used for type checking.
     */
    public VMField getField(String className, String fieldName){
        return null;
    }

    public VMField setField(String className, String fieldName, Object value){
        return null;
    }
}
