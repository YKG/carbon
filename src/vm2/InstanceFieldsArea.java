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
    private Map<String,List<Field>> privateFields;

    public InstanceFieldsArea(VM vm) {
    	this.vm = vm;
    	extendFields = new HashMap<String, List<Field>>();
        privateFields = new HashMap<String, List<Field>>();
        extendFields.put("Ljava/lang/Object;",new ArrayList<Field>());
        privateFields.put("Ljava/lang/Object;",new ArrayList<Field>());
    }

    /*
     * return a new copy rather than the old copy
     * shouldn't extends superclass's private fields
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
    		boolean isExtend = true;
    		for(String str : field.accessList) {
    			if(str.equals("private")) {
    				pFields.add(field);
    				isExtend = false;
    				break;
    			}
    		}
    		if(isExtend == true)
    			eFields.add(field);
    	}
    	extendFields.put(clazzName, eFields);
    	privateFields.put(clazzName, pFields);
    }
}
