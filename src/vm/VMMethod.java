package vm;

import ast.Const;
import opt.Instruction;

import java.util.Hashtable;

public class VMMethod {
    public VMClass definingClass;
    int regCount;
    opt.Instruction.T code[];
    String methodSign;
    ExceptionTable exceptionTable;
    int modifiers;

    public VMMethod(int regCount, Instruction.T[] code, String methodSign, ExceptionTable exceptionTable, int modifiers) {
        this.regCount = regCount;
        this.code = code;
        this.methodSign = methodSign;
        this.exceptionTable = exceptionTable;
        this.modifiers = modifiers;
    }

    public VMMethod(String special, String methodSign){
        if (special.equals("NATIVE")){
            modifiers &= Const.NATIVE;
        }
        if (special.equals("ABSTRACT")){
            modifiers &= Const.ABSTRACT;
        }
        this.methodSign = methodSign;
    }

    public static class ExceptionTable{
        Hashtable<Interval, Integer> table;

        /**
         * @param pc for position of the exception occurred.
         * @return Integer indicate the handle address,
         *         null for no handle found.
         */
        public Integer get(int pc){
            // TODO
            return null;
        }

        final class Interval{
            private int begin;
            private int end;

            Interval(int begin, int end) {
                this.begin = begin;
                this.end = end;
            }

            public boolean capture(int pos){
                return begin <= pos && pos < end;
            }
        }
    }

    public boolean isAccessibleTo(VMClass caller){ // caller is D
        VMClass D = caller;

        if ((modifiers & Const.PUBLIC) != 0) return true;
        if ((modifiers & Const.PROTECT) != 0){
            /**
             * Furthermore, if R is not static, then the symbolic reference to R must
             * contain a symbolic reference to a class T, such that T is either a subclass of D, a
             * superclass of D, or D itself.
             * // TODO here we cannot get 'T'!
             */
            return true;
        }

        if ((modifiers & Const.PROTECT) != 0 || isDefaultAccess()){
            if (definingClass.packageName.equals(D.packageName)) return true;
        }

        if ((modifiers & Const.PRIVATE) != 0 && D.getDeclaredMethod(methodSign).equals(this))
            return true;
        return false;
    }


    public boolean isNative() {
        return (modifiers & Const.NATIVE) != 0;
    }

    public boolean isAbstract() {
        return (modifiers & Const.ABSTRACT) != 0;
    }

    public boolean isDefaultAccess() {
        return (modifiers & (Const.PUBLIC | Const.PROTECT |Const.PRIVATE)) == 0;
    }

    public boolean isSigPoly() {
        return false;
    }
}
