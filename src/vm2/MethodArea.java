package vm2;

import util.MultiThreadUtils;

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
    // hack for system call
    private Map<String, MultiThreadUtils.TranslateWorker> classMap;
    public MethodArea(VM vm, Map<String, MultiThreadUtils.TranslateWorker> classMap) {
        this.vm = vm;
        this.methods = new HashMap<>();
    }

    public boolean existsMethod(String clazzName, String methodSign){
        assert methods.get(clazzName) != null;
        return methods.get(clazzName).get(methodSign) != null;

    }

    public Method getMethod(String clazzName, String methodSign){
        //TODO ---------------------------------------------------------------------------------
        if(!classMap.containsKey(clazzName)) {
            return Util.getSystemMethod(clazzName, methodSign);
        }
        //TODO ---------------------------------------------------------------------------------

        //origin code
        if(!methods.containsKey(clazzName)){
            vm.loadClazz(clazzName);
            vm.clazzArea.initClazz(clazzName); // Here the invoke-static should be the ONLY allowed.
        }
        String clazz = clazzName;
        while(clazz != null){
            Map<String, Method> map = methods.get(clazz);
            assert map != null;
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
            Map<String, Method> map = new HashMap<>();
            methods.put(clazzName, map);
        }

        methods.get(clazzName).put(methodSign, method);
    }
}
