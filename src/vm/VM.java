package vm;

import java.util.*;

public final class VM {
    BootstrapClassLoader bootstrapClassLoader;
    Set<VMClassLoader> methodArea;
    List<VMThread> threads;

    String initialClassName;

    public VM(BootstrapClassLoader bootstrapClassLoader, String initialClassName){
        this.bootstrapClassLoader = bootstrapClassLoader;
        this.initialClassName = initialClassName;
        this.methodArea = new HashSet<>();
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

        VMMethod main = Klass.getStaticMethod("main([java.lang.String)V");
        new VMThread(this, main).start();
    }

    public void linkClass(VMClass klass){
        // 1. verify
        // 2. prepare (set static field default value)
        // TODO
    }

    public synchronized void initClass(VMClass klass){
        // BE CAREFUL!!! sync
        // TODO
    }
}
