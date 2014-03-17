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

    //TODO ---------------------
    boolean isSystemInstance ;
    Object systemInstance;
    //TODO ---------------------

    public Instance(VM vm, String clazzName) {
<<<<<<< HEAD
        vm.loadClazz(clazzName);
        vm.clazzArea.initClazz(clazzName);
=======
        //TODO ---------------------
        if(!vm.classMap.containsKey(clazzName)) {
            this.vm = vm;
            this.clazzName = clazzName;
            this.isSystemInstance = true;
            return ;
        }
        this.isSystemInstance = false;
        //TODO ---------------------
>>>>>>> c69472b... add reflect


        vm.loadClazz(clazzName);
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
