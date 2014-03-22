package vm2;

import java.util.Map;

public class Instance {
    private VM vm;

    String clazzName;

    /**
     * key:         fieldName
     * value:       field
     */
    Map<String, Object> fields;

    public Instance(VM vm, String clazzName) {
        vm.loadClazz(clazzName);
        vm.clazzArea.initClazz(clazzName);

        this.vm = vm;
        this.clazzName = clazzName;
        this.fields = vm.instanceFieldsArea.getInstanceFields(clazzName);
    }

    public String getSuperClazz(){
        return vm.clazzArea.getSuperClazz(clazzName);
    }

    public Object iget(String fieldName){
        assert fields.containsKey(fieldName);
        return fields.get(fieldName);
    }

    public void iput(String fieldName, Object value){
        assert fields.containsKey(fieldName);
        fields.put(fieldName, value);
    }

    /**
     * instance-of
     */
    public int isA(String type){
        // TODO: remember primitive type
        return vm.clazzArea.isA(clazzName, type) ? 1 : 0;
    }
}
