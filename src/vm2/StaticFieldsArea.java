package vm2;

import ast.classs.FieldItem;

import java.util.Map;

public class StaticFieldsArea {
    VM vm;

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
    	String fullFieldName = Util.getFullFieldName(fieldItem);
    	if( !this.staticFields.containsKey(fullFieldName))
    		vm.loadClazz(fieldItem.classType);
    	return this.staticFields.get(fullFieldName);
    }

    public void setStaticField(String fullFieldName, Object newObject){
    	 // TODO didn't complete Authorization check
        this.staticFields.put(fullFieldName,newObject);
    }
}
