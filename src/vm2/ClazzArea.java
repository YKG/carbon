package vm2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ClazzArea {
    private VM vm;
    /**
     * key:    clazzName
     * value:  superClazzName
     *         List[1] is the real superClazz
     *         others are the implemented interface
     */
    private Map<String, List<String>> clazzz;


    public ClazzArea(VM vm) {
        this.vm = vm;
        this.clazzz = new HashMap<String, List<String>>();
        this.clazzz.put("Ljava/lang/Object;", null);
    }

    public boolean isLoaded(String clazzName){
        return this.clazzz.containsKey(clazzName);
    }

    public String getSuperClazz(String clazzName){
        List<String> superClazzList = clazzz.get(clazzName);
        if(superClazzList == null) // Ljava/lang/Object;
            return null;
        return superClazzList.get(0);
    }


    public void setSuperClazz(String clazzName, List<String> superClazzList){
        assert !clazzz.containsKey(clazzName);
        this.clazzz.put(clazzName,superClazzList);
    }

    /**
     * instace-of
     */
    public boolean isA(String subClazz, String testClazz){
        if (subClazz.equals(testClazz))
            return true;

        List<String> superClazz = clazzz.get(subClazz);
        if(superClazz != null){
            for (String subClazzName:superClazz)
            {
                if (isA(subClazzName, testClazz))
                    return true;
            }
        }
        return false;
    }
}
