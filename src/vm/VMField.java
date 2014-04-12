package vm;

import java.util.HashSet;

public class VMField {
    String name;
    String descriptor;
    Object value;
    HashSet<MODIFIER> modifiers;

    enum MODIFIER{
        STATIC;
    };

    public boolean isAccessibleTo(VMClass caller){
        return false;
    }
}
