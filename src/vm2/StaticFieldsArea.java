package vm2;

import ast.classs.Class;
import ast.classs.FieldItem;

import java.util.List;
import java.util.Map;

public class StaticFieldsArea {
    private VM vm;

    /**
     * key:    fullQualifiedStaticFieldName
     * value:  field object
     */
    private Map<String, Object> staticFields;

    public StaticFieldsArea(VM vm){
        this.vm = vm;
    }

    public Object getStaticField(FieldItem fieldItem){
        // TODO didn't complete Authorization check
    	String fullFieldName = fieldItem.toString();
    	if(!staticFields.containsKey(fullFieldName)){
    		vm.loadClazz(fieldItem.classType);
        }
    	return staticFields.get(fullFieldName);
    }

    public void setStaticField(String fieldName, Object value){
        staticFields.put(fieldName, value);
    }

    public void setStaticFields(String clazzName, List<Class.Field> fieldList){
    	// TODO didn't complete Authorization check
        for (Class.Field field : fieldList) {
            String fullFieldName = Util.getFullFieldName(clazzName, field);
            Object newObject = Util.getNewObject(field.type);
            staticFields.put(fullFieldName,newObject);
        }
    }
}
