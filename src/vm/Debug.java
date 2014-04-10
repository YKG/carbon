package vm;

/**
 * Created by YKG on 14-4-9.
 */
public class Debug {
    public static void panic(String msg){
        System.err.println(">>>> PANIC <<<< : " + msg);
    }
}
