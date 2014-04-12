package opt;

import java.util.Hashtable;

public class Instruction {
    // 0x00
    public static class Nop extends T {
        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class Move extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MoveFrom16 extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class Move16 extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MoveWide extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MoveWideFrom16 extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MoveWide16 extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MoveObject extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MoveObjectFrom16 extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MoveObject16 extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MoveResult extends T {
        public int dest;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MoveResultWide extends T {
        public int dest;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MoveResultObject extends T {
        public int dest;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MoveException extends T {
        public int dest;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ReturnVoid extends T {
        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class Return extends T {
        public int ret;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0x10
    public static class ReturnWide extends T {
        public int ret;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ReturnObject extends T {
        public int ret;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class Const4 extends T {
        public int dest, value;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class Const16 extends T {
        public int dest, value;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class Const extends T {
        public int dest, value;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ConstHigh16 extends T {
        public int dest, value;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ConstWide16 extends T {
        public int dest;
        public long value;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ConstWide32 extends T {
        public int dest;
        public long value;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ConstWide extends T {
        public int dest;
        public long value;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ConstWideHigh16 extends T {
        public int dest;
        public long value;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ConstString extends T {
        public int dest, str;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ConstStringJumbo extends T {
        public int dest, str;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ConstClass extends T {
        public int dest;
        public String className;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MonitorEnter extends T {
        public int obj;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MonitorExit extends T {
        public int obj;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class CheckCast extends T {
        public int obj;
        public String className;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0x20
    public static class InstanceOf extends T {
        public int dest, obj;
        public String className;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class arrayLength extends T {
        public int dest, arr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class NewInstance extends T {
        public int dest;
        public String className;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class NewArray extends T {
        public int dest, size;
        public String type;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class FilledNewArray extends T {
        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class FilledNewArrayRange extends T {
        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class FillArrayData extends T {
        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class Throw extends T {
        public int exception;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class Goto extends T {
        public int addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class Goto16 extends T {
        public int addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class Goto32 extends T {
        public int addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0x2b
    public static class PackedSwitch extends T {
        public Hashtable<Integer, Integer> table;
        public int test;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SparseSwitch extends T {
        public Hashtable<Integer, Integer> table;
        public int test;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0x2d
    public static class CmplFloat extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class CmpgFloat extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class CmplDouble extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class CmpgDouble extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class CmpLong extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0x32
    public static class IfEq extends T {
        public int first, second, addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IfNe extends T {
        public int first, second, addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IfLt extends T {
        public int first, second, addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IfGe extends T {
        public int first, second, addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IfGt extends T {
        public int first, second, addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IfLe extends T {
        public int first, second, addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0x38
    public static class IfEqz extends T {
        public int test, addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IfNez extends T {
        public int test, addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IfLtz extends T {
        public int test, addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IfGez extends T {
        public int test, addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IfGtz extends T {
        public int test, addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IfLez extends T {
        public int test, addr;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    // 0x44
    public static class Aget extends T {
        public int dest, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AgetWide extends T {
        public int dest, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AgetObject extends T {
        public int dest, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AgetBoolean extends T {
        public int dest, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AgetByte extends T {
        public int dest, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AgetChar extends T {
        public int dest, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AgetShort extends T {
        public int dest, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class Aput extends T {
        public int src, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AputWide extends T {
        public int src, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AputObject extends T {
        public int src, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AputBoolean extends T {
        public int src, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AputByte extends T {
        public int src, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AputChar extends T {
        public int src, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AputShort extends T {
        public int src, arr, index;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0x52
    public static class Iget extends T {
        public int dest, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IgetWide extends T {
        public int dest, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IgetOjbect extends T {
        public int dest, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IgetBoolean extends T {
        public int dest, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IgetByte extends T {
        public int dest, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IgetChar extends T {
        public int dest, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IgetShort extends T {
        public int dest, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class Iput extends T {
        public int src, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IputWide extends T {
        public int src, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IputObject extends T {
        public int src, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IputBoolean extends T {
        public int src, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IputByte extends T {
        public int src, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IputChar extends T {
        public int src, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IputShort extends T {
        public int src, obj;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0x60
    public static class Sget extends T {
        public int dest;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SgetWide extends T {
        public int dest;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SgetObject extends T {
        public int dest;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SgetBoolean extends T {
        public int dest;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SgetByte extends T {
        public int dest;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SgetChar extends T {
        public int dest;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SgetShort extends T {
        public int dest;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class Sput extends T {
        public int src;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SputWide extends T {
        public int src;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SputObject extends T {
        public int src;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SputBoolean extends T {
        public int src;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SputByte extends T {
        public int src;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SputChar extends T {
        public int src;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SputShort extends T {
        public int src;
        public String className, fieldName, descriptor;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0x6e
    public static class InvokeVirtual extends T {
        public String className, methodSign;
        public int[] args;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class InvokeSuper extends T {
        public String className, methodSign;
        public int[] args;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class InvokeDirect extends T {
        public String className, methodSign;
        public int[] args;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class InvokeStatic extends T {
        public String className, methodSign;
        public int[] args;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class InvokeInterface extends T {
        public String className, methodSign;
        public int[] args;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0x74
    public static class InvokeVirtualRange extends T {
        public String className, methodSign;
        public int[] args;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class InvokeSuperRange extends T {
        public String className, methodSign;
        public int[] args;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class InvokeDirectRange extends T {
        public String className, methodSign;
        public int[] args;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class InvokeStaticRange extends T {
        public String className, methodSign;
        public int[] args;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class InvokeInterfaceRange extends T {
        public String className, methodSign;
        public int[] args;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0x7b
    public static class NegInt extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class NotInt extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class NegLong extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class NotLong extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class NegFloat extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class NegDouble extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IntToLong extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IntToFloat extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IntToDouble extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class LongToInt extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class LongToFloat extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class LongToDouble extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class FloatToInt extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class FloatToLong extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class FloatToDouble extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class DoubleToInt extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class DoubleToLong extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class DoubleToFloat extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IntToByte extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IntToChar extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class IntToShort extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0x90
    public static class AddInt extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SubInt extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MulInt extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class DivInt extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class RemInt extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AndInt extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class OrInt extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class XorInt extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ShlInt extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ShrInt extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class UshrInt extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AddLong extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SubLong extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MulLong extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class DivLong extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class RemLong extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AndLong extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class OrLong extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class XorLong extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ShlLong extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ShrLong extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class UshrLong extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AddFloat extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SubFloat extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MulFloat extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class DivFloat extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class RemFloat extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AddDouble extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SubDouble extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MulDouble extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class DivDouble extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class RemDouble extends T {
        public int dest, first, second;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0xb0
    public static class AddInt2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SubInt2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MulInt2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class DivInt2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class RemInt2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AndInt2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class OrInt2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class XorInt2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ShlInt2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ShrInt2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class UshrInt2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AddLong2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SubLong2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MulLong2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class DivLong2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class RemLong2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AndLong2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class OrLong2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class XorLong2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ShlLong2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ShrLong2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class UshrLong2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AddFloat2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SubFloat2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MulFloat2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class DivFloat2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class RemFloat2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AddDouble2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class SubDouble2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MulDouble2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class DivDouble2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class RemDouble2Addr extends T {
        public int dest, src;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0xd0
    public static class AddIntLit16 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class RsubInt extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MulIntLit16 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class DivIntLit16 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class RemIntLit16 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AndIntLit16 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class OrIntLit16 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class XorIntLit16 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    //0xd8
    public static class AddIntLit8 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class RsubIntLit8 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class MulIntLit8 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class DivIntLit8 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class RemIntLit8 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class AndIntLit8 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class OrIntLit8 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class XorIntLit8 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ShlIntLit8 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class ShrIntLit8 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public static class UshrIntLit8 extends T {
        public int dest, src, lit;

        @Override
        public void accept(Visitor v) {
            v.visit(this);
        }
    }

    public abstract static class T implements Acceptable {
        public String op;
        public String source; // source code, for debug.
    }
}
