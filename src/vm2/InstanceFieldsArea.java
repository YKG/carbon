package vm2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ast.classs.Class.Field;

public class InstanceFieldsArea {
	VM vm;
    /**
     *  key:    clazzName
     *  value:  List<ast.classs.Class.Field>
     */
    private Map<String,List<Field>> instanceFields;

    public InstanceFieldsArea(VM vm) {
    	this.vm = vm;
        instanceFields = new HashMap<String, List<Field>>();
    }

    /*
     * return the new copy rather than  the old copy
     */
    public  Map<String,Object> getInstanceFields(String clazzName){
    	Map<String,Object> fieldMap = new HashMap<String,Object>();
    	if(!this.instanceFields.containsKey(clazzName)) {
    		vm.loadClazz(clazzName);
    	}
    	List<Field> fieldList = this.instanceFields.get(clazzName);
    	for(Field field : fieldList) {
    		Object newObject = Util.getNewObject(field.type);
    		fieldMap.put(field.name, newObject);
    	}
    	return fieldMap;
    }

    public void setInstanceFields(String clazzName, List<Field> instanceFieldsMap){
        this.instanceFields.put(clazzName, instanceFieldsMap);
    }
}
