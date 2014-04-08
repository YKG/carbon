package vm3;

public class Array {
    VM vm;
    Object[] value;

    public Array(VM vm, String type, int size){
//            value[i] = new XXX();// TODO, here may OUTOFMEMORY
        value = new Object[size];
        this.vm = vm;
        Debug.info("---> Array type: " + type);

        switch (type) {
            case "[Z": value = new Boolean[size]; break;
            case "[B": value = new Byte[size]; break;
            case "[S": value = new Short[size]; break;
            case "[C": value = new Character[size]; break;
            case "[I": value = new Integer[size]; break;
            case "[J": value = new Long[size]; break;
            case "[F": value = new Float[size]; break;
            case "[D": value = new Double[size]; break;

            default:
                if (type.startsWith("[L")){
                    for(int i = 0; i < size; i++){
                        value[i] = new Instance(vm, type.substring(1));
                    }
                }else{
                    assert type.startsWith("[[");
                    // TODO
                    new VMException(vm).printStackTrace();
                }
                break;
        }
    }

    public int getLength(){
        return value.length;
    }

    public Object aget(int i){
        return value[i];
    }

    public void aput(int i, Object v){
        value[i] = v;
    }

    public void fillArrayData(Object[] arr){
        value = arr;
    }

    public static void arraycopy(Array src, int sbegin, Array dest, int dbegin, int len){
        System.arraycopy(src.value, sbegin, dest.value, dbegin, len);
    }
}
