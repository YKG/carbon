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

    public Instance(String clazzName, Map<String, Object> fields) {
        this.clazzName = clazzName;
        this.fields = fields;
    }
}
