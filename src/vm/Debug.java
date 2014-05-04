package vm;

public class Debug {
    public static void panic(String msg){
        Exception e = new Exception();
        e.printStackTrace();
        System.err.println(">>>> PANIC <<<< : " + msg);
        System.exit(-1);
    }
    public static void info(String msg){
        System.err.println("[   INFO]: " + msg);
    }
    public static void warning(String msg){
        System.err.println("[WARNING]: " + msg);
    }
}
