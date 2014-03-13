package vm2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ast.classs.Class.Field;

public class InstanceFieldsArea {
    /**
     *  key:    clazzName
     *  value:  List<ast.classs.Class.Field>
     */
    private Map<String,List<Field>> instanceFields;


    public InstanceFieldsArea() {
        instanceFields = new HashMap<String, List<Field>>();
    }

    /*
     * return the new copy rather than  the old copy
     */
    public  Map<String,Object> getInstanceFields(String clazzName){
//        return this.instanceFields.get(clazzName);
    	return null;
    }

    public void setInstanceFields(String clazzName, List<Field> instanceFieldsMap){
        this.instanceFields.put(clazzName, instanceFieldsMap);
    }
}
