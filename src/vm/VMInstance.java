package vm;

import ast.Const;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.concurrent.locks.ReentrantLock;

public class VMInstance extends LockbleObject{
    VMClass type;
    Hashtable<VMField, VMField> fields;
    VMInstance superInstance;

    public VMInstance(VMClass type) {
        this.lock = new ReentrantLock();

        this.type = type;

        this.fields = new Hashtable<>();
        Enumeration e = type.fields.keys();
        while(e.hasMoreElements()) {
            VMField fieldKey = (VMField)e.nextElement();
            VMField field = fieldKey.clone();
            if((field.modifiers & Const.STATIC) == 0) {
                field.value = ast.Util.getNewObject(field.descriptor);
                this.fields.put(fieldKey, field);
            }
        }

        this.superInstance = null;
        if (type.superClass != null){
            this.superInstance = new VMInstance(type.superClass);
        }
    }

    public VMField getInstanceField(VMField fieldKey){
        Hashtable<VMField, VMField> fields = this.fields;
        while (fields != null){
            if (fields.get(fieldKey) != null){
                return fields.get(fieldKey);
            }else{
                if (superInstance == null) return null;
                fields = superInstance.fields;
            }
        }
        return null;
    }
}
