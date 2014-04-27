package vm;

import ast.Const;

import java.util.*;

public final class VM {
    BootstrapClassLoader bootstrapClassLoader;
    Set<VMClassLoader> methodArea;
    List<VMThread> threads;

    String initialClassName;

    public VM(BootstrapClassLoader bootstrapClassLoader, String initialClassName){
        this.bootstrapClassLoader = bootstrapClassLoader;
        bootstrapClassLoader.vm = this;
        this.initialClassName = initialClassName;
        this.methodArea = new HashSet<>();
        methodArea.add(bootstrapClassLoader);
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

        VMMethod main = Klass.getDeclaredMethod("main([java.lang.String)V");
        new VMThread(this, main).start();
    }

    public void linkClass(VMClass klass){
        // 1. verify
        // 2. prepare (set static field default value)
        Enumeration e = klass.fields.keys();
        while(e.hasMoreElements()) {
            VMField field = (VMField)e.nextElement();
            if((field.modifiers & Const.STATIC) != 0) {
                field = klass.fields.get(field);
                field.value = ast.Util.getNewObject(field.descriptor);
            }
        }
        // TODO
    }

    public synchronized void initClass(VMClass klass) throws Throwable {
        // BE CAREFUL!!! sync
        /**
         * 1. Synchronize on the initialization lock,  LC , for  C . This involves waiting until the
         *    current thread can acquire  LC .
         */
        klass.lock.lock();

        /**
         * 2. If the  Class object for  C indicates that initialization is in progress for  C by some
         *    other thread, then release  LC and block the current thread until informed that the
         *    in-progress initialization has completed, at which time repeat this procedure.
         */
        /**
         * 3. If the  Class object for  C indicates that initialization is in progress for  C by the
         *    current thread, then this must be a recursive request for initialization. Release
         *    LC and complete normally.
         */
        String status =  klass.initialStatus;
        if(status.startsWith("initializing")) {
            String hashCode = status.substring(status.lastIndexOf('@')+1);
            if(!hashCode.equals(Thread.currentThread().hashCode())) {
                klass.lock.unlock();
                initClass(klass);
            } else {
                klass.lock.unlock();
                return ;
            }
        }

        /**
         * 4. If the  Class object for  C indicates that  C has already been initialized, then no
         *    further action is required. Release  LC and complete normally.
         */
        if(klass.initialStatus.equals("initialized")) {
            klass.lock.unlock();
            return ;
        }

        /**
         * 5. If the  Class object for  C is in an erroneous state, then initialization is not
         *    possible. Release  LC and throw a  NoClassDefFoundError .
         */
        if(klass.initialStatus.equals("erroneous")) {
            klass.lock.unlock();
            throw new NoClassDefFoundError();
        }
        /**
         * 6. Otherwise, record the fact that initialization of the  Class object for  C is in
         *    progress by the current thread, and release  LC . Then, initialize each  final
         *    static field of  C with the constant value in its  ConstantValue attribute
         *    (§4.7.2), in the order the fields appear in the  ClassFile structure.
         */
        klass.initialStatus = "initializing@" + Thread.currentThread().hashCode();
        klass.lock.unlock();
        Enumeration e = klass.fields.keys();
        while(e.hasMoreElements()) {
            VMField field = (VMField)e.nextElement();
            if((field.modifiers & Const.STATIC) != 0 && (field.modifiers & Const.FINAL) != 0) {
                field = klass.fields.get(field);
                // TODO initialize each  final static field
            }
        }

        /**
         * 7. Next, if  C is a class rather than an interface, and its superclass  SC has not
         *    yet been initialized, then recursively perform this entire procedure for  SC . If
         *    necessary, verify and prepare  SC first.
         *    If the initialization of  SC completes abruptly because of a thrown exception,
         *    then acquire  LC , label the  Class object for  C as erroneous, notify all waiting
         *    threads, release  LC , and complete abruptly, throwing the same exception that
         *    resulted from initializing  SC .
         */
        if((klass.modifiers & Const.INTERFACE) == 0 && (klass.superClass != null)) {
            VMClass SC = klass.superClass;
            if(!SC.initialStatus.equals("initialized")) {
                try {
                    initClass(SC);
                } catch (Throwable ex) {
                    klass.lock.lock();
                    klass.initialStatus = "erroneous";
                    klass.lock.unlock();
                    throw ex;
                }
            }
        }
        /**
         * 8. Next, determine whether assertions are enabled for  C by querying its defining
         *    class loader.
         */
        //TODO
        try {
        /**
         * 9. Next, execute the class or interface initialization method of  C .
         */

        VMMethod clinit = klass.getDeclaredMethod("<clinit>()V");
        new VMThread(this, clinit).start();

        /**
         * 10. If the execution of the class or interface initialization method completes
         *     normally, then acquire  LC , label the  Class object for  C as fully initialized, notify
         *     all waiting threads, release  LC , and complete this procedure normally.
         */
        klass.lock.lock();
        klass.initialStatus = "initialized";
        klass.lock.unlock();
        } catch (Throwable ex) {
            Throwable E = ex;
        /**
         * 11. Otherwise, the class or interface initialization method must have completed
         *     abruptly by throwing some exception  E . If the class of  E is not  Error
         *     or one of its subclasses, then create a new instance of the class
         *     ExceptionInInitializerError with  E as the argument, and use this object
         *     in place of  E in the following step.
         *     If a new instance of  ExceptionInInitializerError cannot be created
         *     because an  OutOfMemoryError occurs, then use an  OutOfMemoryError object
         *     in place of  E in the following step.
         */
        if(!(ex instanceof java.lang.Error)) {
            try {
                E =new ExceptionInInitializerError(ex);
            } catch (OutOfMemoryError err) {
                E = err;
            }
        }

        /**
         * 12. Acquire  LC , label the  Class object for  C as erroneous, notify all waiting
         *     threads, release  LC , and complete this procedure abruptly with reason  E or its
         *     replacement as determined in the previous step.
         */
        klass.lock.lock();
        klass.initialStatus = "erroneous";
        klass.lock.unlock();
        throw E;
        }
    }


    public static VMClass resolveClassOrInterface(VMClass D, String N){
        /**
         * 1. The defining class loader of  D is used to create a class or interface denoted by
         *    N . This class or interface is  C . The details of the process are given in §5.3.
         */
        VMClassLoader loader = D.definingLoader;

        /**
         * 2. If  C is an array class and its element type is a  reference type, then the symbolic
         *    reference to the class or interface representing the element type is resolved by
         *    invoking the algorithm in §5.4.3.1 recursively.
         */
        if (N.startsWith("[")){
            N = N.substring(N.lastIndexOf('[') + 1);
        }
        VMClass C = loader.loadClass(N);

        /**
         * 3. Finally, access permissions to  C are checked:
         *      • If  C is not accessible (§5.4.4) to  D , class or interface resolution throws an
         *        IllegalAccessError
         */
        if (C.isAccessibleTo(D)){
            throw new IllegalAccessError();
        }

        return C;
    }


    private static VMField lookupField(VMClass C, String N, String fieldName, String descriptor){
        /**
         * 1. If  C declares a field with the name and descriptor specified by the field
         *    reference, field lookup succeeds. The declared field is the result of the field
         *    lookup.
         */
        VMField field = C.getDeclaredField(fieldName);
        if (field != null){
            if (field.descriptor.equals(descriptor)){
                return field;
            }else{
                Debug.panic("How to handle it?");
            }
        }

        /**
         * 2. Otherwise, field lookup is applied recursively to the direct superinterfaces of
         *    the specified class or interface  C.
         */
        assert field == null;
        for(VMClass interfacee : C.superinterfaces){
            field = lookupField(interfacee, N, fieldName, descriptor);
            if (field != null)
                return field;
        }

        /**
         * 3. Otherwise, if  C has a superclass  S , field lookup is applied recursively to S.
         */
        assert field == null;
        if (C.superClass != null){
            return lookupField(C.superClass, N, fieldName, descriptor);
        }

        /**
         * 4. Otherwise, field lookup fails.
         */
        return null;
    }

    public static VMField resolveField(VMClass D, String N, String fieldName, String descriptor){
        VMClass C = resolveClassOrInterface(D, N);
        VMField field = lookupField(C, N, fieldName, descriptor);

        /**
         * If field lookup fails, field resolution throws a  NoSuchFieldError
         */
        if (field == null){
            throw new NoSuchFieldError();
        }

        /**
         * Otherwise, if field lookup succeeds but the referenced field is not accessible
         * (§5.4.4) to  D , field resolution throws an  IllegalAccessError
         */
        if (!field.isAccessibleTo(D)){
            throw new IllegalAccessError();
        }

        /**
         * The Java Virtual Machine must impose the loading constraint that  T L 1 =  T L 2
         */
        // This have been ensured by the first step of lookupField().
        // I think here may be reconsidered.
        // TODO: check()

        return field;
    }

    public static VMMethod resolveMethod(VMClass D, String N,String methodSign) {
        /**
         * To resolve an unresolved symbolic reference from D to a method in a class C,
         * the symbolic reference to C given by the method reference is first resolved
         */
        VMClass C = VM.resolveClassOrInterface(D, N);

        /**
         * 1. Method resolution checks whether C is a class or an interface.
         *  If C is an interface, method resolution throws an IncompatibleClassChangeError.
         */

        if(C.isInterface() == true) {
            throw new IncompatibleClassChangeError();
        }

        /**
         * 2. Method resolution attempts to look up the referenced method in C and its superclasses:
         */
        VMMethod method = lookupMethod(C, methodSign);

        /**
         * 3. Otherwise, method lookup attempts to locate the referenced method in any of
         *    the superinterfaces of the specified class C.
         */
        for(VMClass interfacee : C.superinterfaces) {
            method = lookupMethod(interfacee, methodSign); // TODO: resolve interface method
            if(method != null)
                return method;
        }


        // lookup failed
        if (method == null){
            throw new NoSuchMethodError();
        }

        /**
         * Otherwise, if method lookup succeeds and the method is abstract,
         * but C is not abstract, method resolution throws an AbstractMethodError.
         */
        if((method.isAbstract()) && (!C.isAbstract())) {
            throw new AbstractMethodError();
        }

        /**
         * Otherwise, if method lookup succeeds but the referenced method is not accessible (§5.4.4) to D,
         * method resolution throws an IllegalAccessError.
         */
        if(!method.isAccessibleTo(D)) {
            throw new IllegalAccessError();
        }

        /**
         * TODO: check TiL1 = TiL2 for i = 0 to n (§5.3.4).
         */
        return method;
    }

    public static VMMethod lookupMethod(VMClass C, String methodSign) {
        /**
         * If C declares exactly one method with the name specified by the method reference,
         * and the declaration is a signature polymorphic method (§2.9), then method lookup succeeds.
         * All the class names mentioned in the descriptor are resolved (§5.4.3.1).
         *
         * The resolved method is the signature polymorphic method declaration.
         * It is not necessary for C to declare a method with the descriptor specified by the method reference.
         */
        //TODO

        /**
         * Otherwise, if C declares a method with the name and descriptor specified by the method reference,
         * method lookup succeeds.
         */
        VMMethod method = C.getDeclaredMethod(methodSign);
        if(method != null) {
            return method;
        }

        /**
         * Otherwise, if C has a superclass,
         * step 2 of method lookup is recursively invoked on the direct superclass of C.
         */
        method = lookupMethod(C.superClass, methodSign);
        if(method != null) {
            return method;
        }

        return null;
    }

    public static VMMethod resolveInterfaceMethod(VMClass D, String N, String methodSign) {
        /**
         * To resolve an unresolved symbolic reference from D to an interface method in an interface C,
         * the symbolic reference to C given by the interface method reference is first resolved (§5.4.3.1).
         */
        VMClass klass = VM.resolveClassOrInterface(D, N);

        /**
         * If C is not an interface, interface method resolution throws an IncompatibleClassChangeError.
         */
        if(klass.isInterface() == false) {
            throw new IncompatibleClassChangeError();
        }

        /**
         * Otherwise, if the referenced method does not have the same name and descriptor as a method in C
         * or in one of the superinterfaces of C, or in class Object,
         * interface method resolution throws a NoSuchMethodError.
         */
        VMClass current = klass;
        VMMethod method = null;
        while((current != null) && (method == null)) {
            method = current.methods.get(methodSign);
            if(method != null)
                break;
            current = current.superClass;
        }
        if(method == null) {
            throw new NoSuchMethodError();
        }

        /**
         * TODO: check TiL1 = TiL2 for i = 0 to n (§5.3.4).
         */

        return method;
    }
}
