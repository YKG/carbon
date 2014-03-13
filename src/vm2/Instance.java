package vm2;

import java.util.Map;

public class Instance {
    VM vm;

    String clazzName;

    /**
     * key:         fieldName
     * value:       field
     */
    Map<String, Object> fields;

    public Instance(String clazzName) {
        this.clazzName = clazzName;
        this.fields = vm.instanceFieldsCopyArea.getInstanceFieldsCopy(clazzName);
    }

    public Object iget(String fieldName){
        assert fields.containsKey(fieldName);
        return fields.get(fieldName);
    }

    public void iput(String fieldName, Object value){
        assert fields.containsKey(fieldName);
        fields.put(fieldName, value);
    }
}
