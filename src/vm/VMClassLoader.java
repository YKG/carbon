package vm;

import java.util.Map;

public abstract class VMClassLoader {
    Map<String, VMClass> classes;

    public abstract VMClass loadClass(String className);
}
