package vm;

import java.util.Hashtable;

public class VMInstance extends LockbleObject{
    VMClass type;
    Hashtable<VMField, VMField> fields;

    public VMInstance(VMClass type) {
        this.type = type;
    }

    public VMField getInstanceField(VMField fieldKey){
        return fields.get(fieldKey);
    }
}
