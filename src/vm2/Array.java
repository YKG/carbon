package vm2;

public class Array {
    Object[] value;

    public Array(String type, String sizeStr){
        int size = Integer.parseInt(sizeStr);
        value = new Object[size];

        for(int i = 0; i < size; i++){
//            value[i] = new XXX();// TODO, here may OUTOFMEMORY
        }
    }

    public int getLength(){
        return value.length;
    }

    public Object aget(String iStr){
        return value[Integer.parseInt(iStr)];
    }

    public void aput(String iStr, Object v){
        value[Integer.parseInt(iStr)] = v;
    }
}
