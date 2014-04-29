package vm;

import ast.Const;

public class VMField {
    VMClass definingClass;
    String name;
    String descriptor;
    Object value;
    int modifiers;

    public VMField(String name, String descriptor, Object value, int modifiers) {
        this.name = name;
        this.descriptor = descriptor;
        this.value = value;
        this.modifiers = modifiers;
    }

    public boolean isAccessibleTo(VMClass caller){
        VMClass D = caller;

        if ((modifiers & Const.PUBLIC) != 0) return true;
        if ((modifiers & Const.PROTECT) != 0){
            /**
             * Furthermore, if R is not static, then the symbolic reference to R must
             * contain a symbolic reference to a class T, such that T is either a subclass of D, a
             * superclass of D, or D itself.
             * // TODO here we cannot get 'T'!
             */
            return true;
        }

        if ((modifiers & Const.PROTECT) != 0 || isDefaultAccess()){
            if (definingClass.packageName.equals(D.packageName)) return true;
        }

        // NOT STRICT.
        if ((modifiers & Const.PRIVATE) != 0 && D.getDeclaredField(name) != null)
            return true;
        return false;
    }

    public boolean isDefaultAccess() {
        return (modifiers & (Const.PUBLIC | Const.PROTECT |Const.PRIVATE)) == 0;
    }
}
