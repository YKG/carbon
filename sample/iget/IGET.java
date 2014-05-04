
public class IGET{
    public static void main(String[] args) {
        SI s = new SI();
        System.out.println(s.x);
        A3 a3 = new A3();
        System.out.println(a3.x);
        System.out.println(((A2)a3).x);
        System.out.println(((A1)a3).x);
        System.out.println("============");
        a3.superprint();
        System.out.println("============");
        foo(a3);
        System.out.println("============");
        bar(a3, a3);
    }

    public static void foo(I i) {
        System.out.println("foo I: ");
        i.print();
    }

    public static void foo(A1 a1) {
        System.out.println("foo A1: ");
        System.out.println(a1.x);
        a1.print();
    }

    public static void bar(I i, A1 a1){
        i.printX(a1);
    }
}

class SI {
    static int x;    
}


interface I{
    public void print();
    public void printX(A1 a1);
}

class A1 implements I{
    int x = 1;
    public void print() {
        System.out.println("A1.print");
        System.out.println(x);
    }

    public void printX(A1 a1){
        System.out.println("A1 printX:");
        System.out.println(x);
    }
}

class A2 extends A1{
//    int x = 2;
    public void print() {
        System.out.println("A2.print111222s");
        System.out.println(x);
    }

    // public void printX(A1 a1){
    //     System.out.println("A2 printX:");
    //     System.out.println(x);        
    // }
}

class A3 extends A2{
    int x = 3;

    public void superprint() {
        System.out.println("A3.print");
        System.out.println(super.x);
        super.print();
    }

    public void printX(A1 a1){
        System.out.println("A3 printX:");
        System.out.println(x);
    }
}