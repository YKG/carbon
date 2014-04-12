public class SGET{
    public static void main(String[] args) {
        A3 a3 = new A3();
        foo(a3);
        bar(a3);
        A5 a5 = new A5();
        System.out.println(a5.x);
    }

    public static void foo(A1 a1) {
        System.out.println("foo(A1 a1): ");
        System.out.println(a1.x);
    }

    public static void foo(A2 a2) {
        System.out.println("foo(A2 a2): ");
        System.out.println(a2.x);
    }

    public static void bar(A2 a2) {
        System.out.println("bar(A2 a2): ");
        System.out.println(a2.x);
    }
}

class A1{
    public static final int x = 1;
}

class A2 extends A1{
//    public static int x = 2;
}

class A3 extends A2{
    public static int x = 3;
}

class A4 extends A1{
    private static int x = 4;
}

class A5 extends A4{

}