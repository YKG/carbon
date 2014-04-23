package vm;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

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
        if (!C.isAccessibleTo(D)){
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
        VMClass klass = VM.resolveClassOrInterface(D, N);

        /**
         * 1. Method resolution checks whether C is a class or an interface.
         *  If C is an interface, method resolution throws an IncompatibleClassChangeError.
         */

        if(klass.isInterface() == true) {
            throw new IncompatibleClassChangeError();
        }

        /**
         * 2. Method resolution attempts to look up the referenced method in C and its superclasses:
         */
        /**
         * If method lookup fails, method resolution throws a NoSuchMethodError.
         */
        VMMethod method = VM.lookupMethod(klass, methodSign);
        if(method == null) {
            throw new NoSuchMethodError();
        }

        /**
         * Otherwise, if method lookup succeeds and the method is abstract,
         * but C is not abstract, method resolution throws an AbstractMethodError.
         */
        if((method.isAbstract()) && (!klass.isAbstract())) {
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
        if(C == null)
            return null;

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
        VMMethod method = C.methods.get(methodSign);
        if(method != null) {
            return method;
        }

        /**
         * Otherwise, if C has a superclass,
         * step 2 of method lookup is recursively invoked on the direct superclass of C.
         */

        method = VM.lookupMethod(C.superClass, methodSign);
        if(method != null) {
            return method;
        }

        /**
         * Otherwise, method lookup attempts to locate the referenced method
         * in any of the superinterfaces of the specified class C.
         * If any superinterface of C declares a method with the name
         * and descriptor specified by the method reference, method lookup succeeds.
         * Otherwise, method lookup fails.
         */
        for(VMClass supC : C.superinterfaces) {
            method = VM.lookupMethod(supC, methodSign);
            if(method != null)
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
