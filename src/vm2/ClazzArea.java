package vm2;

import java.util.HashMap;
import java.util.Map;

public class ClazzArea {

    /**
     * key:    clazzName
     * value:  superClazzName
     */
    public Map<String, String> clazzz;

    public boolean isLoaded(String clazzName){
        // TODO
        return false;
    }

    public ClazzArea() {
        this.clazzz = new HashMap<String, String>();
    }

    public String getSuperClazz(String clazzName){
        return this.clazzz.get(clazzName);
    }

    public void setSuperClazz(String clazzName, String superClazzName){
        this.clazzz.put(clazzName,superClazzName);
    }
}
