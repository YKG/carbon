package vm2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ClazzArea {
    private VM vm;

    /**
     * key:    clazzName
     * value:  superClazzName
     */
    private Map<String, String> superClazzMap;

    /**
     * key:    clazzName
     * value:  implementsList
     */
    private Map<String, List<String>> implementsMap;

    /**
     * key:    clazzName
     * value:  0    uninvoked
     *         1    invoking
     *         2    invoked
     */
    private Map<String, Integer> clinitInvoked;
    private static final int UNINVOKED = 0;
    private static final int INVOKING = 1;
    private static final int INVOKED = 2;

    public ClazzArea(VM vm) {
        this.vm = vm;
        this.superClazzMap = new HashMap<>();
        this.implementsMap = new HashMap<>();
        this.clinitInvoked = new HashMap<>();
        this.superClazzMap.put("Ljava/lang/Object;", null);
        this.implementsMap.put("Ljava/lang/Object;", null);
    }

    public boolean isLoaded(String clazzName){
        return superClazzMap.containsKey(clazzName);
    }

    public String getSuperClazz(String clazzName){
        assert superClazzMap.containsKey(clazzName);
        return superClazzMap.get(clazzName);
    }

    public void setSuperClazzAndInterface(String clazzName, String superClazz, List<String> implementsList){
        assert !superClazzMap.containsKey(clazzName);
        superClazzMap.put(clazzName, superClazz);
        implementsMap.put(clazzName, implementsList);
    }


    public void setClinit(String clazzName){
        clinitInvoked.put(clazzName, UNINVOKED);
    }

    public void initClazz(String clazzName){
        if (clinitInvoked.containsKey(clazzName) && clinitInvoked.get(clazzName) != UNINVOKED){
            return;
        }

        String clazz = getSuperClazz(clazzName);
        if (clazz != null){
            initClazz(clazz);
        }

        // TODO synchronize
        if (clinitInvoked.containsKey(clazzName) && clinitInvoked.get(clazzName) == UNINVOKED){
            clinitInvoked.put(clazzName, INVOKING);
            vm.clinitHandle(vm.getMethod(clazzName, "<clinit>()V"));
            clinitInvoked.put(clazzName, UNINVOKED);
        }
    }


    /**
     * instace-of
     */
    public boolean isA(String clazzName, String testClazz){
        if (clazzName.equals(testClazz))
            return true;

        if (isA(superClazzMap.get(clazzName), testClazz))
            return true;

        List<String> implementsList = implementsMap.get(clazzName);
        for (String imp : implementsList){
            if (isA(imp, testClazz))
                return true;
        }

        return false;
    }
}
