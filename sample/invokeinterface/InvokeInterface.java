public class InvokeInterface implements Inter{
	public final void f1() {
		System.out.println("InvokeInterface : implements Interf.f1");
	}
	public static void main(String[] args) {
		Inter inter = new InvokeInterface();
		inter.f1();
		InvokeInterface inter1 = new InvokeInterface();
		inter1.f1();
		Inter.f2();
	}
}

class InvokeInterface_1 implements Inter {
		public final void f1() {
		System.out.println("InvokeInterface_ 1: implements Interf.f1");
	}
}
interface Inter {
	public static void f2() { 
		System.out.println("Inter: f2");
	};
	public void f1();
}
