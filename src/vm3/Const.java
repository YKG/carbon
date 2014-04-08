package vm3;

/**
 * Created by hong_ on 14-3-15.
 */
public class Const {
    /*
     * access_flags
     */
    public static int PUBLIC = 0x1;
    public static int PRIVATE = 0x2;
    public static int PROTECT = 0x4;
    public static int STATIC = 0x8;
    public static int FINAL = 0x10;
    public static int SYNCHRONIZED = 0x20;
    public static int VOLATILE = 0x40;
    public static int BRIDGE = 0x40;
    public static int TRANSIENT = 0x80;
    public static int VARARGS = 0x80;
    public static int NATIVE = 0x100;
    public static int INTERFACE = 0x200;
    public static int ABSTRACT = 0x400;
    public static int STRICT = 0x800;
    public static int SYNTHETIC = 0x1000;
    public static int ANNOTATION = 0x2000;
    public static int ENUM = 0x4000;
    public static int CONSTRUCTOR = 0x10000;
    public static int DECLARED_SYNCHRONIZED = 0x20000;
}
