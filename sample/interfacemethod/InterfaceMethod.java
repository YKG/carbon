
public class InterfaceMethod{
    public static void main(String[] args) {
        D d = new Foo();
        d.a();
    }
}

class Foo implements D{
    public void a(){};
    public void b(){};
    public void c(){};
    public void d(){};
}

interface A{
    void a();
}

interface B extends A{
    void b();
}

interface C extends B{
    void c();
}

interface D extends C{
    void d();
}

