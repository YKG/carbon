
public class Switch{
    public static void main(String[] args) {
        
    }

    public int foo(int x){
        int ret = -1;
        switch(x){
            case 0x55:
                ret = 0x11;
                break;
            case 0xaa:
                ret = 0x22;
                break;
            default:
                ret = 0x33;
        }
        return ret;
    }

    public int bar(int x){
        int ret = -1;
        switch(x){
            case 0x5:
                ret = 0x11;
                break;
            case 0x6:
                ret = 0x22;
                break;
            default:
                ret = 0x33;
        }
        return ret;
    }

    public int foobar(int x){
        int ret = -1;
        switch(x){
            case 0x0:
                ret = 0x11;
                break;
            case 0x1:
                ret = 0x22;
                break;
            default:
                ret = 0x33;
        }
        return ret;
    }

    public int foobar2(int x){
        int ret = -1;
        switch(x){
            case 0x3:
                ret = 0x11;
                break;
            case 0x6:
                ret = 0x22;
                break;
            default:
                ret = 0x33;
        }
        return ret;
    }

    public int foobar3(int x){
        int ret = -1;
        switch(x){
            case 0x3:
                ret = 0x11;
                break;
            case 0x7:
                ret = 0x22;
                break;
            default:
                ret = 0x33;
        }
        return ret;
    }
}
