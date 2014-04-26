package vm;

public class Debug {
    public static void panic(String msg){
        System.err.println(">>>> PANIC <<<< : " + msg);
        System.exit(-1);
    }
    public static void info(String msg){
        System.err.println("[  INFO]: " + msg);
    }
}
