package vm;

import java.util.Hashtable;

public class VMMethod {
    opt.Instruction.T code[];
    VMClass definingClass;



    public VMClass getDefiningClass(){
        return definingClass;
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
}
