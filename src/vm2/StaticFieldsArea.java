package vm2;

import ast.classs.Class;
import ast.classs.FieldItem;

import java.util.HashMap;
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
        this.staticFields = new HashMap<String,Object>();
    }


    public Object getStaticField(FieldItem fieldItem){
        String originClazzName = getFieldLocation(fieldItem);
        if(originClazzName == null) {
            Util.printErr("cant not find static field : " + fieldItem.toString());
            return null;
        } else {
           return  staticFields.get(fieldItem.toString(originClazzName));
        }
    }

    public void setStaticField (FieldItem fieldItem, Object value) {
        String originClazzName = getFieldLocation(fieldItem);
        if(originClazzName == null) {
            Util.printErr("cant not find static field : " + fieldItem.toString());
        } else {
            staticFields.put(fieldItem.toString(originClazzName), value);
        }
    }

    //TODO didn't consider interface that class implements
    private String getFieldLocation(FieldItem fieldItem) {
        String currentClazzName = fieldItem.classType;
        vm.loadClazz(currentClazzName);
        while(currentClazzName != null) {
            if(staticFields.containsKey(fieldItem.toString(currentClazzName))) {
                return currentClazzName;
            }
            currentClazzName =  vm.clazzArea.getSuperClazz(currentClazzName);
        }
        return null;
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
