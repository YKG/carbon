package vm2;

import java.util.HashMap;
import java.util.Map;

public class MethodArea {
    private VM vm;
    /**
     * key:    clazzName
     * value:  Map
     *          key:    MethodSign
     *          value:  vm2.Method
     */
    private Map<String, Map<String, Method>> methods;

    public MethodArea(VM vm) {
        this.vm = vm;
        this.methods = new HashMap<String, Map<String, Method>>();
    }

    public Method getMethod(String clazzName, String methodSign){
        if(!methods.containsKey(clazzName)){
            vm.loadClazz(clazzName);
        }

        String clazz = clazzName;
        while(clazz != null){
            Map<String, Method> map = methods.get(clazz);
            if(map.containsKey(methodSign)){
                return map.get(methodSign);
            }else{
                clazz = vm.clazzArea.getSuperClazz(clazzName);
            }
        }
        Util.printErr("MethodArea.getMethod: Never reach.");
        return null;
    }

    public void setMethod(String clazzName, String methodSign, Method method){
        if (!methods.containsKey(clazzName)){
            Map<String, Method> map = new HashMap<String, Method>();
            methods.put(clazzName, map);
        }

        methods.get(clazzName).put(methodSign, method);
    }
}
