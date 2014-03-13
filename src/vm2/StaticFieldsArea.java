package vm2;

import java.util.Map;
import ast.classs.Class.Field;

public class StaticFieldsArea {
    VM vm;

    /**
     * key:    fullQualifiedStaticFieldName
     * value:  field
     */
    public Map<String, Object> staticFields;


    public Object getStaticField(String fieldName){
        // TODO didn't complete Authorization check
        return null;
    }

    public void setStaticField(String fieldName, Object field){
    	 // TODO didn't complete Authorization check
        this.staticFields.put(fieldName, field);
    }
}
