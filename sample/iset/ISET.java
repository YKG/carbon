
public class ISET{
    public static void main(String[] args) {
        A3 a3 = new A3();
        a3.x += 10;
        ((A2)a3).x += 10;
        ((A1)a3).x += 10;

        System.out.println(a3.x);
        System.out.println(((A2)a3).x);
        System.out.println(((A1)a3).x);
        System.out.println("============");
        foo(a3);
        a3.superprint();
    }

    public static void foo(I i) {
        i.print();
    }
}

interface I{
    public void print();
}

class A1 implements I{
    int x = 1;
    public void print() {
        System.out.println(x);
    }
}

class A2 extends A1{
    int x = 2;
    public void print() {
        System.out.println(x);
    }
}

class A3 extends A2{
    int x = 3;

    public void superprint() {
//        System.out.print("superprint: ");
        super.x += 100;
        System.out.print(super.x);
        super.print();
    }

}