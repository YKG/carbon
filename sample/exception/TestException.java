
public class TestException{
	static int a;
    public static void main(String[] args) {
        try{
        	a = 1;
        }catch(ArrayIndexOutOfBoundsException e){
        	a = 2;
        }catch(NullPointerException e){
        	a = 3;
        }catch(Exception e){
        	a = 4;
        }finally{
        	a = 5;
        }
    }
}
