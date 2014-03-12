package vm2;

import java.util.HashMap;
import java.util.Map;

public class ClazzArea {

    /**
     * key:    clazzName
     * value:  superClazzName
     */
    public Map<String, String> clazzz;

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
        this.clazzz.put(clazzName,superClazzName);
    }
}
