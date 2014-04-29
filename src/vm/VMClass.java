package vm;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;

public class VMClass extends LockbleObject {
    VMClassLoader definingLoader;
    VMClassLoader initialLoader;
    VMClass superClass;
    ArrayList<VMClass> superinterfaces;
    String className;
    String packageName;
    Hashtable<VMField, VMField> fields;
    Hashtable<VMMethod, VMMethod> methods;
    int modifiers;
    String initialStatus;

    public VMClass(String className, String packageName, Hashtable<VMField, VMField> fields, Hashtable<VMMethod, VMMethod> methods, int modifiers) {
        this.className = className;
        this.packageName = packageName;
        this.fields = fields;
        this.methods = methods;
        this.modifiers = modifiers;
        this.initialStatus = "uninitialized";
    }

    public VMField getDeclaredField(String fieldName) {
        Enumeration e = methods.keys();
        while(e.hasMoreElements()) {
            VMField field = (VMField)e.nextElement();
            if (field.name.equals(fieldName)){
                return fields.get(field);
            }
        }
        return null;
    }

    public VMMethod getDeclaredMethod(String methodSign) {
        Enumeration e = methods.keys();
        while(e.hasMoreElements()) {
            VMMethod method = (VMMethod)e.nextElement();
            if (method.methodSign.equals(methodSign)){
                return methods.get(method);
            }
        }
        return null;
    }

    /**
     * invoke-virtual is used to invoke a normal virtual method (a method
     * that is not private, static, or final, and is also not a constructor).
     */
    // TODO: native / synchronized / etc..
    public VMMethod lookupVirtualMethod(VMMethod method) {
        String methodSign = method.methodSign;
        /**
         * • If C contains a declaration for an instance method m that
         *   overrides (§5.4.5) the resolved method, then m is the method to
         *   be invoked, and the lookup procedure terminates.
         */
        VMMethod m = getDeclaredMethod(methodSign);
        if (m != null) { // overide
            return m;
        }

        /**
         *  Otherwise, if C has a superclass, this same lookup procedure
         *  is performed recursively using the direct superclass of C; the
         *  method to be invoked is the result of the recursive invocation of
         *  this lookup procedure.
         */
        if (superClass != null) {
            return superClass.lookupVirtualMethod(method);
        }

        /**
         * • Otherwise, an AbstractMethodError is raised
         */
        throw new AbstractMethodError();
    }


    /**
     * invoke-static is used to invoke a static method (which is always
     * considered a direct method).
     */
    public VMMethod lookupStaticMethod(VMMethod method) {
        //TODO there isn't any description about lookupStaticMethod
        VMMethod m = getDeclaredMethod(method.methodSign);
        if (m != null)
            return m;
        if (superClass != null)
            return superClass.lookupStaticMethod(method);
        throw new NoSuchMethodError();
    }

    /**
     * invoke-interface is used to invoke an interface method, that is,
     * on an object whose concrete class isn't known, using a method_id
     * that refers to an interface.
     */
    public VMMethod lookupInterfaceMethod(VMMethod method) {
        /**
         * • If C contains a declaration for an instance method with the same
         *   name  and  descriptor  as  the  resolved  method,  then  this  is  the
         *   method to be invoked, and the lookup procedure terminates.
         */
        VMMethod m = getDeclaredMethod(method.methodSign);
        if (m != null) {
            return m;
        }

        /**
         * • Otherwise,  if  C has  a  superclass,  this  same  lookup  procedure
         *   is  performed  recursively  using  the  direct  superclass  of  C;  the
         *   method to be invoked is the result of the recursive invocation of
         *   this lookup procedure.
         */
        if (superClass != null) {
            return superClass.lookupInterfaceMethod(method);
        }

        /**
         * • Otherwise, an AbstractMethodErroris raised.
         */
        throw new AbstractMethodError();
    }


    public VMField getStaticField(VMField fieldKey) {
        return fieldKey; // just return itself.
    }

    public boolean isInherit(VMClass klass) {
        // TODO
        return false;
    }

    public boolean isAccessibleTo(VMClass caller) {
        return ((modifiers & ast.Const.PUBLIC) != 0 || packageName.equals(caller.packageName));
    }

    public boolean isInterface() {
        //TODO the function must exchange to access flag;
        return false;
    }

    public boolean isAbstract() {
        //TODO the function must exchange to access flag;
        return false;
    }
}
