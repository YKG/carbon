package vm2;

import java.util.HashMap;
import java.util.Map;

public class ClazzArea {

    /**
     * key:    clazzName
     * value:  superClazzName
     */
    private Map<String, String> clazzz;

    public ClazzArea() {
        this.clazzz = new HashMap<String, String>();
    }

    public boolean isLoaded(String clazzName){
        return this.clazzz.containsKey(clazzName);
    }

    public String getSuperClazz(String clazzName){
        return this.clazzz.get(clazzName);
    }

    public void setSuperClazz(String clazzName, String superClazzName){
        assert !clazzz.containsKey(clazzName);
        this.clazzz.put(clazzName,superClazzName);
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
