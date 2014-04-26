package vm;

import java.util.HashSet;

public class VMField {
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

    enum MODIFIER{
        STATIC;
    };

    public boolean isAccessibleTo(VMClass caller){
        return false;
    }
}
