package vm;

import java.util.Hashtable;
import java.util.concurrent.locks.ReentrantLock;

public class VMInstance extends LockbleObject{
    VMClass type;
    Hashtable<VMField, VMField> fields;

    public VMInstance(VMClass type) {
        this.lock = new ReentrantLock();

        this.type = type;
    }

    public VMField getInstanceField(VMField fieldKey){
        return fields.get(fieldKey);
    }
}
