package vm2;

import ast.classs.Class.Field;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class InstanceFieldsArea {
	private VM vm;
    /**
     *  key:    clazzName
     *  value:  List<ast.classs.Class.Field>
     */
    private Map<String,List<Field>> extendFields;
    private Map<String,List<Field>> privateFields; // private_Field didn't contain private_static_field

    public InstanceFieldsArea(VM vm) {
    	this.vm = vm;
    	extendFields = new HashMap<String, List<Field>>();
        privateFields = new HashMap<String, List<Field>>();
        extendFields.put("Ljava/lang/Object;",new ArrayList<Field>());
        privateFields.put("Ljava/lang/Object;",new ArrayList<Field>());
    }

    /*
     * return a new copy rather than the old copy
     * note: the new instance field contain it's own non static field and parent's non private field
     *       and it's own static field store in staticFieldArea
     */
    public Map<String,Object> getInstanceFields(String clazzName){
    	Map<String,Object> fieldMap = new HashMap<String,Object>();
    	Util.updatefieldMap(fieldMap, extendFields.get(clazzName));
    	Util.updatefieldMap(fieldMap, privateFields.get(clazzName));
    	String currentClazzName = vm.clazzArea.getSuperClazz(clazzName);
    	while(currentClazzName != null){ // TODO is test null better?
    		Util.updatefieldMap(fieldMap, extendFields.get(currentClazzName));
    		currentClazzName = vm.clazzArea.getSuperClazz(currentClazzName);
    	}
    	return fieldMap;
    }

    /*
     * divide fieldList to extendfields and privatefields
     */
    public void setInstanceFields(String clazzName, List<Field> fieldList){
    	//TODO
    	List<Field> eFields = new  ArrayList<Field>();
    	List<Field> pFields = new  ArrayList<Field>();
    	for(Field field : fieldList ) {
            if((field.accessFlag & Const.STATIC) != 0) {
               continue;
            }
            if((field.accessFlag & Const.PRIVATE) != 0) {
                pFields.add(field);
            } else {
                eFields.add(field);
            }
    	}
    	privateFields.put(clazzName, pFields);
        extendFields.put(clazzName, eFields);
    }
}
