package vm2;

/**
 * Created by YKG on 14-3-22.
 */
public class Debug {
    private static boolean info = true;
    private static boolean verbose = false;

    public static void info(Object msg){
        System.err.println("[   INFO]: " + msg);
    }

    public static void verbose(Object o){
        if (verbose){
            System.err.println("[VERBOSE]: " + o);
        }
    }
}
