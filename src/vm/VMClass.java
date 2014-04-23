package vm;

import java.util.ArrayList;
import java.util.Hashtable;

public class VMClass extends LockbleObject{
    VMClassLoader definingLoader;
    VMClassLoader initialLoader;
    VMClass superClass;
    ArrayList<VMClass> superinterfaces;
    String className;
    Hashtable<String, VMField> fields;
    Hashtable<String, VMMethod> methods;

    public VMClass(VMClassLoader definingLoader, VMClassLoader initialLoader,
                   String className, Hashtable<String, VMField> fields, Hashtable<String, VMMethod> methods){
        this.definingLoader = definingLoader;
        this.initialLoader = initialLoader;
        this.className = className;
        this.fields = fields;
        this.methods = methods;
    }

    public VMField getField(String filedName){
        // TODO
        return null;
    }

    public VMField getDeclaredField(String fieldName){
        return null;
    }

    /**
     * invoke-virtual is used to invoke a normal virtual method (a method
     * that is not private, static, or final, and is also not a constructor).
     */
    public VMMethod getVirtualMethod(String methodSign){
        // TODO
        return null;
    }

    /**
     * invoke-direct is used to invoke a non-static direct method (that is,
     * an instance method that is by its nature non-overridable, namely
     * either a private instance method or a constructor).
     */
    // no recursive
    public VMMethod getDirectMethod(String methodSign){
        // TODO
        return null;
    }

    /**
     * invoke-static is used to invoke a static method (which is always
     * considered a direct method).
     */
    public VMMethod getStaticMethod(String methodSign){
        // TODO
        VMMethod method = this.methods.get(methodSign);
        if( method == null) {

        }
        return null;
    }

    /**
     * invoke-interface is used to invoke an interface method, that is,
     * on an object whose concrete class isn't known, using a method_id
     * that refers to an interface.
     */
    public VMMethod getInterfaceMethod(String methodSign){
        // TODO
        return null;
    }

    public VMField getStaticField(VMField fieldKey){
        return fieldKey; // just return itself.
    }

    public boolean isInherit(VMClass klass){
        // TODO
        return false;
    }

    public boolean isAccessibleTo(VMClass caller){
        return false;
    }
}
