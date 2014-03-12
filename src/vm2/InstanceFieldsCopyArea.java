package vm2;

import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

public class InstanceFieldsCopyArea {
    /**
     *  key:    clazzName
     *  value:  instanceFieldsMap
     *            key:    fieldName
     *            value:  field
     */
    public Map<String, Map<String, Object>> instanceFieldsCopy;


    public InstanceFieldsCopyArea() {
        instanceFieldsCopy = new HashMap<String, Map<String, Object>>();
    }

    public Map<String, Object> getInstanceFieldsCopy(String clazzName){
        return this.instanceFieldsCopy.get(clazzName);
    }

    public void setInstanceFieldsCopy(String clazzName, Map<String, Object> instanceFieldsMap){
        this.instanceFieldsCopy.put(clazzName, instanceFieldsMap);
    }
}
