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
    private Map<String, String> clazzz;
    /**
     * key:    clazzName
     * value:  implement interface name
     */
    private Map<String, List<String>> interfaces;


    public ClazzArea(VM vm) {
        this.vm = vm;
        this.clazzz = new HashMap<String, String>();
        this.clazzz.put("Ljava/lang/Object;", null);
        this.interfaces = new HashMap<String, List<String>>();
    }

    public boolean isLoaded(String clazzName){
        return this.clazzz.containsKey(clazzName);
    }

    public String getSuperClazz(String clazzName){
        return this.clazzz.get(clazzName);
    }

    public List<String> getImplementInterfaces(String clazzName){
        return this.interfaces.get(clazzName);
    }

    public void setSuperClazz(String clazzName, String superClazzName){
        assert !clazzz.containsKey(clazzName);
        this.clazzz.put(clazzName,superClazzName);
    }

    public void setImplementInterfaces(String clazzName, List<String> implementInterfaces){
        assert !clazzz.containsKey(clazzName);
        this.interfaces.put(clazzName, implementInterfaces);
    }

    /**
     * instace-of
     */
    public boolean isA(String subClazz, String testClazz){
        // TODO: handle interface
        if (subClazz.equals(testClazz))
            return true;

        String superClazz = clazzz.get(subClazz);
        while(superClazz != null){
            if(superClazz.equals(testClazz)){
                return true;
            }else{
                superClazz = clazzz.get(subClazz);
            }
        }
        return false;
    }
}
