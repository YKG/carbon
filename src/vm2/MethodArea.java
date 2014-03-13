package vm2;

import java.util.HashMap;
import java.util.Map;

public class MethodArea {
    VM vm;
    /**
     * key:    clazzName
     * value:  Map
     *          key:    fullQualifiedMethodName
     *          value:  vm2.Method
     */
    public Map<String, Method> methods;


    public MethodArea() {
        this.methods = new HashMap<String,Method>();
    }

    public Method getMethod(ast.classs.MethodItem methodItem){
        return this.methods.get(Util.getFullMethodName(methodItem));
    }

    public void setMethod(String fullQualifiedMethodName, Method method){
        this.methods.put(fullQualifiedMethodName, method);
    }
}
