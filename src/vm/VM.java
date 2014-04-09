package vm;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * Created by YKG on 14-4-8.
 */
public final class VM {
    BootstrapClassLoader bootstrapClassLoader;
    Map<VMClassLoader, Map<String, VMClass>> methodArea;
    List<VMThread> threads;

    String initialClassName;

    public VM(BootstrapClassLoader bootstrapClassLoader, String initialClassName){
        this.bootstrapClassLoader = bootstrapClassLoader;
        this.initialClassName = initialClassName;
        this.methodArea = new HashMap<>();
        this.threads = new LinkedList<>();
    }

    public void start(){
        // 1. loading initialClass (create)
        // 2. linking initialClass
        // 3. initial initialClass
        // 4. invoke main([java.lang.String)V

        VMClass Klass = bootstrapClassLoader.loadClass(initialClassName);
        linkClass(Klass);
        initClass(Klass);

        VMMethod main = Klass.getMethod("main([java.lang.String)V");
        new VMThread(this, main).start();
    }

    public void linkClass(VMClass klass){
        // 1. verify
        // 2. prepare
        // TODO
    }

    public void initClass(VMClass klass){
        // TODO
    }
}
