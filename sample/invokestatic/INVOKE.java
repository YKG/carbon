
public class INVOKE{
    public static void main(String[] args) {
        A3 a3 = new A3();
        a3.print();
    }
}

class A1{
    public static void print() {
        System.out.println("A1 print()");
    }

    public static void print2() {
        System.out.println("A1 print2()");
    }
}

class A2 extends A1{
    public static void print() {
        System.out.println("A2 print()");
        print2();
    }

    public static void print2() {
        System.out.println("A2 print2()");
    }
}

class A3 extends A2{
    public static void print2() {
        System.out.println("A3 print2()");
    }
}