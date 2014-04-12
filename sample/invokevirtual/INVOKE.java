
public class INVOKE{
    public static void main(String[] args) {
        A3 a3 = new A3();
        a3.print();
    }
}

interface I{
    public void print();
}

class A1 implements I{
    public void print() {
        System.out.println("A1 print()");
    }

    public void print2() {
        System.out.println("A1 print2()");
    }
}

class A2 extends A1{
    public void print() {
        System.out.println("A2 print()");
        ((A2)this).print2();
        super.print2();
    }

    public void print2() {
        System.out.println("A2 print2()");
    }
}

class A3 extends A2{
    public void print2() {
        System.out.println("A3 print2()");
    }
}