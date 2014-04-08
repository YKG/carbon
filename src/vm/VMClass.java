package vm;

import java.util.Map;

/**
 * Created by YKG on 14-4-8.
 */
public class VMClass {
    VMClassLoader definingLoader;
    VMClassLoader initialLoader;
    String className;
    Map<String, VMField> fields;
    Map<String, VMMethod> methods;

    public VMClass(VMClassLoader definingLoader, VMClassLoader initialLoader,
                   String className, Map<String, VMField> fields, Map<String, VMMethod> methods){
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

    public VMMethod getMethod(String methodName){
        // TODO
        return null;
    }

}
