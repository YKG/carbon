package vm;

import ast.Const;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.concurrent.locks.ReentrantLock;

public class VMInstance extends LockbleObject{
    VMClass type;
    Hashtable<VMField, VMField> fields;

    public VMInstance(VMClass type) {
        this.lock = new ReentrantLock();

        this.type = type;

        this.fields = new Hashtable<>();
        Enumeration e = type.fields.keys();
        while(e.hasMoreElements()) {
            VMField fieldKey = (VMField)e.nextElement();
            VMField field = type.fields.get(fieldKey).clone();
            if((field.modifiers & Const.STATIC) == 0) {
                field.value = ast.Util.getNewObject(field.descriptor);
                this.fields.put(fieldKey, field);
            }
        }
    }

    public VMField getInstanceField(VMField fieldKey){
        return fields.get(fieldKey);
    }
}
