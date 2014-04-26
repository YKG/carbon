package vm;

import opt.Instruction;

import java.util.Hashtable;

public class VMMethod {
    opt.Instruction.T code[];
    VMClass definingClass;
    String methodSign;
    ExceptionTable exceptionTable;
    int modifiers;
    public VMClass getDefiningClass(){
        return definingClass;
    }

    public VMMethod(Instruction.T[] code, String methodSign, ExceptionTable exceptionTable, int modifiers) {
        this.code = code;
        this.methodSign = methodSign;
        this.exceptionTable = exceptionTable;
        this.modifiers = modifiers;
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

    public boolean isAccessibleTo(VMClass caller){
        return false;
    }

    public boolean isAbstract() {
        //TODO the function must exchange to access flag;
        return false;
    }

    public boolean isSigPoly() {
        return false;
    }
}
