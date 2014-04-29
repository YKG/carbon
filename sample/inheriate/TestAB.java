class A{
    public int a;
    A(){
        a = 1;
    }
    public void print(){
        System.out.println(a);
    }
}

class B extends A{
    public int a;
    B(){
        a = 2;
    }
}
public class TestAB {
    public static void main(String[] args) {
        B b = new B();
        b.print();
        System.out.println(b.a);
        A a = b;
        System.out.println(a.a);
    }
}
