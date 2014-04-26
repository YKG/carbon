package vm;

import opt.Instruction;
import opt.Visitor;

import java.util.Stack;

public class Interpreter implements Visitor {
    VMThread vmt;
    Object[] reg;
    Stack<VMThread.Frame> stack;
    VMClass currentClass;
    VMMethod.ExceptionTable exceptionTable;

    public Interpreter(VMThread vmthread) {
        this.vmt = vmthread;
    }

    private void updateExecEnv(VMThread.Frame frame){
        reg = frame.reg;
        stack = vmt.stack;
        currentClass = frame.method.getDefiningClass();
        exceptionTable = frame.exceptionTable;
    }
    void handleException(){
        // TODO
    }

    //////////////////////////////////////////////////////////////////////////
    @Override
    public void visit(Instruction.Nop I) {
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.Move I) {
        reg[I.dest] = reg[I.src];
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.MoveFrom16 I) {
        reg[I.dest] = reg[I.src];
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.Move16 I) {
        reg[I.dest] = reg[I.src];
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.MoveWide I) {
        reg[I.dest] = reg[I.src];
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.MoveWideFrom16 I) {
        reg[I.dest] = reg[I.src];
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.MoveWide16 I) {
        reg[I.dest] = reg[I.src];
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.MoveObject I) {
        reg[I.dest] = reg[I.src];
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.MoveObjectFrom16 I) {
        reg[I.dest] = reg[I.src];
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.MoveObject16 I) {
        reg[I.dest] = reg[I.src];
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.MoveResult I) {
        reg[I.dest] = vmt.returnValue;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.MoveResultWide I) {
        reg[I.dest] = vmt.returnValue;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.MoveResultObject I) {
        reg[I.dest] = vmt.returnValue;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.MoveException I) {
        reg[I.dest] = vmt.exception;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.ReturnVoid I) {
        stack.pop();
        updateExecEnv(stack.peek());
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.Return I) {
        vmt.returnValue = reg[I.ret];
        stack.pop();
        updateExecEnv(stack.peek());
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.ReturnWide I) {
        vmt.returnValue = reg[I.ret];
        stack.pop();
        updateExecEnv(stack.peek());
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.ReturnObject I) {
        vmt.returnValue = reg[I.ret];
        stack.pop();
        updateExecEnv(stack.peek());
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.Const4 I) {
        reg[I.dest] = I.value;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.Const16 I) {
        reg[I.dest] = I.value;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.Const I) {
        reg[I.dest] = I.value;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.ConstHigh16 I) {
        reg[I.dest] = I.value << 16;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.ConstWide16 I) {
        reg[I.dest] = I.value;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.ConstWide32 I) {
        reg[I.dest] = I.value;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.ConstWide I) {
        reg[I.dest] = I.value;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.ConstWideHigh16 I) {
        reg[I.dest] = I.value << 48;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.ConstString I) {
        reg[I.dest] = I.str;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.ConstStringJumbo I) {
        reg[I.dest] = I.str;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.ConstClass I) {
        reg[I.dest] = currentClass.definingLoader.loadClass(I.className);
        vmt.pc++;
    }

    /**
     * Remember to check exception. monitor*
     */
    @Override
    public void visit(Instruction.MonitorEnter I) {
        Object obj = reg[I.obj];
        assert obj instanceof LockbleObject;
        ((LockbleObject)obj).lock.lock();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.MonitorExit I) {
        Object obj = reg[I.obj];
        assert obj instanceof LockbleObject;
        ((LockbleObject)obj).lock.unlock();
        vmt.pc++;
    }

    /**
     * check-cast vAA, type@BBBB
     *      A: reference-bearing register (8 bits)
     *      B: type index (16 bits)
     *
     * Throw a ClassCastException if the reference in the given register cannot be cast to the indicated type.
     * Note: Since A must always be a reference (and not a primitive value), this will necessarily fail at
     *       runtime (that is, it will throw an exception) if B refers to a primitive type.
     */
    @Override
    public void visit(Instruction.CheckCast I) {
        Object obj = reg[I.obj];
        assert obj instanceof VMInstance; // VMClass ?
        VMClass klass = currentClass.definingLoader.loadClass(I.className);
        if(((VMInstance)obj).type.isInherit(klass)){
            vmt.pc++;
        }else{
            vmt.exception = new VMException("ClassCastException");
        }
    }

    @Override
    public void visit(Instruction.InstanceOf I) {
        Object obj = reg[I.obj];
        assert obj instanceof VMInstance; // VMClass ?
        VMClass klass = currentClass.definingLoader.loadClass(I.className);
        reg[I.dest] = ((VMInstance)obj).type.isInherit(klass) ? 1 : 0;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.arrayLength I) {
        assert reg[I.arr] instanceof VMArray;
        reg[I.dest] = ((VMArray)reg[I.arr]).length();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.NewInstance I) {
        VMClass klass = currentClass.definingLoader.loadClass(I.className);
        reg[I.dest] = new VMInstance(klass);
        vmt.pc++;
    }

    /**
     * Warning: Take care for auto-boxing.
     */
    @Override
    public void visit(Instruction.NewArray I) {
        System.out.println("Instruction.NewArray: type: " + I.type);
        String type = I.type.substring(1); // delete '['
        VMClass klass = currentClass.definingLoader.loadClass(type);
        reg[I.dest] = new VMArray(klass, I.size);
        vmt.pc++;
    }

    //TODO
    @Override
    public void visit(Instruction.FilledNewArray I) {
//        assert inst.type.equals("[I");
//        int dimensions[] = new int[inst.argvs.length];
//        for(int i = 0; i < dimensions.length; i++){
//            dimensions[i] = (Integer) vm.reg[inst.argvs[i]];
//        }
//        vm.returnValue = dimensions;
//        vm.pc++;
    }

    @Override
    public void visit(Instruction.FilledNewArrayRange I) {
//        assert inst.type.equals("[I");
//        vm.returnValue = vm.getObjectsFromRegs(inst.argvs);
//        vm.pc++;
    }

    @Override
    public void visit(Instruction.FillArrayData I) {
//        ((Array) vm.reg[inst.vdest]).fillArrayData(vm.getArrayPayload(inst.addr));
//        vm.pc++;
    }

    @Override
    public void visit(Instruction.Throw I) {
        vmt.exception = reg[I.exception];
    }

    @Override
    public void visit(Instruction.Goto I) {
        vmt.pc = I.addr;
    }

    @Override
    public void visit(Instruction.Goto16 I) {
        vmt.pc = I.addr;
    }

    @Override
    public void visit(Instruction.Goto32 I) {
        vmt.pc = I.addr;
    }

    @Override
    public void visit(Instruction.PackedSwitch I) {
        int test = (Integer)reg[I.test];
        Integer addr = I.table.get(test);
        vmt.pc = addr == null ? vmt.pc + 1 : addr;
    }

    @Override
    public void visit(Instruction.SparseSwitch I) {
        int test = (Integer)reg[I.test];
        Integer addr = I.table.get(test);
        vmt.pc = addr == null ? vmt.pc + 1 : addr;
    }

    @Override
    public void visit(Instruction.CmplFloat I) {
        Float val1 = (Float) reg[I.first];
        Float val2 = (Float) reg[I.second];
        if (val1.isNaN() || val2.isNaN()) {
            reg[I.dest] = -1;
        } else {
            int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
            reg[I.dest] = result;
        }
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.CmpgFloat I) {
        Float val1 = (Float) reg[I.first];
        Float val2 = (Float) reg[I.second];
        if (val1.isNaN() || val2.isNaN()) {
            reg[I.dest] = 1;
        } else {
            int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
            reg[I.dest] = result;
        }
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.CmplDouble I) {
        Double val1 = (Double) reg[I.first];
        Double val2 = (Double) reg[I.second];
        if (val1.isNaN() || val2.isNaN()) {
            reg[I.dest] = -1;
        } else {
            int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
            reg[I.dest] = result;
        }
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.CmpgDouble I) {
        Double val1 = (Double) reg[I.first];
        Double val2 = (Double) reg[I.second];
        if (val1.isNaN() || val2.isNaN()) {
            reg[I.dest] = 1;
        } else {
            int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
            reg[I.dest] = result;
        }
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.CmpLong I) {
        Long val1 = (Long) reg[I.first];
        Long val2 = (Long) reg[I.second];
        int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
        reg[I.dest] = result;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.IfEq I) {
        vmt.pc = reg[I.first] == reg[I.second] ? I.addr : vmt.pc + 1;
    }

    @Override
    public void visit(Instruction.IfNe I) {
        vmt.pc = reg[I.first] != reg[I.second] ? I.addr : vmt.pc + 1;
    }

    @Override
    public void visit(Instruction.IfLt I) {
        vmt.pc = (Integer)reg[I.first] < (Integer)reg[I.second] ? I.addr : vmt.pc + 1;
    }

    @Override
    public void visit(Instruction.IfGe I) {
        vmt.pc = (Integer)reg[I.first] >= (Integer)reg[I.second] ? I.addr : vmt.pc + 1;
    }

    @Override
    public void visit(Instruction.IfGt I) {
        vmt.pc = (Integer)reg[I.first] > (Integer)reg[I.second] ? I.addr : vmt.pc + 1;
    }

    @Override
    public void visit(Instruction.IfLe I) {
        vmt.pc = (Integer)reg[I.first] <= (Integer)reg[I.second] ? I.addr : vmt.pc + 1;
    }

    @Override
    public void visit(Instruction.IfEqz I) {
        vmt.pc = (Integer)reg[I.test] == 0 ? I.addr : vmt.pc + 1;
    }

    @Override
    public void visit(Instruction.IfNez I) {
        vmt.pc = (Integer)reg[I.test] != 0 ? I.addr : vmt.pc + 1;
    }

    @Override
    public void visit(Instruction.IfLtz I) {
        vmt.pc = (Integer)reg[I.test] < 0 ? I.addr : vmt.pc + 1;
    }

    @Override
    public void visit(Instruction.IfGez I) {
        vmt.pc = (Integer)reg[I.test] >= 0 ? I.addr : vmt.pc + 1;
    }

    @Override
    public void visit(Instruction.IfGtz I) {
        vmt.pc = (Integer)reg[I.test] > 0 ? I.addr : vmt.pc + 1;
    }

    @Override
    public void visit(Instruction.IfLez I) {
        vmt.pc = (Integer)reg[I.test] <= 0 ? I.addr : vmt.pc + 1;
    }

    @Override
    public void visit(Instruction.Aget I) {
        aget(I.dest, I.arr, I.index);
    }

    @Override
    public void visit(Instruction.AgetWide I) {
        aget(I.dest, I.arr, I.index);
    }

    @Override
    public void visit(Instruction.AgetObject I) {
        aget(I.dest, I.arr, I.index);
    }

    @Override
    public void visit(Instruction.AgetBoolean I) {
        aget(I.dest, I.arr, I.index);
    }

    @Override
    public void visit(Instruction.AgetByte I) {
        aget(I.dest, I.arr, I.index);
    }

    @Override
    public void visit(Instruction.AgetChar I) {
        aget(I.dest, I.arr, I.index);
    }

    @Override
    public void visit(Instruction.AgetShort I) {
        aget(I.dest, I.arr, I.index);
    }

    @Override
    public void visit(Instruction.Aput I) {
        aput(I.arr, I.index, I.src);
    }

    @Override
    public void visit(Instruction.AputWide I) {
        aput(I.arr, I.index, I.src);
    }

    @Override
    public void visit(Instruction.AputObject I) {
        aput(I.arr, I.index, I.src);
    }

    @Override
    public void visit(Instruction.AputBoolean I) {
        aput(I.arr, I.index, I.src);
    }

    @Override
    public void visit(Instruction.AputByte I) {
        aput(I.arr, I.index, I.src);
    }

    @Override
    public void visit(Instruction.AputChar I) {
        aput(I.arr, I.index, I.src);
    }

    @Override
    public void visit(Instruction.AputShort I) {
        aput(I.arr, I.index, I.src);
    }
    
    @Override
    public void visit(Instruction.Iget I) {
        iget(I.dest, I.obj, I.className, I.fieldName, I.descriptor);
    }

    @Override
    public void visit(Instruction.IgetWide I) {
        iget(I.dest, I.obj, I.className, I.fieldName, I.descriptor);
    }

    @Override
    public void visit(Instruction.IgetOjbect I) {
        iget(I.dest, I.obj, I.className, I.fieldName, I.descriptor);
    }

    @Override
    public void visit(Instruction.IgetBoolean I) {
        iget(I.dest, I.obj, I.className, I.fieldName, I.descriptor);
    }

    @Override
    public void visit(Instruction.IgetByte I) {
        iget(I.dest, I.obj, I.className, I.fieldName, I.descriptor);
    }

    @Override
    public void visit(Instruction.IgetChar I) {
        iget(I.dest, I.obj, I.className, I.fieldName, I.descriptor);
    }

    @Override
    public void visit(Instruction.IgetShort I) {
        iget(I.dest, I.obj, I.className, I.fieldName, I.descriptor);
    }
    
    @Override
    public void visit(Instruction.Iput I) {
        iput(I.obj, I.className, I.fieldName, I.descriptor, I.src);
    }

    @Override
    public void visit(Instruction.IputWide I) {
        iput(I.obj, I.className, I.fieldName, I.descriptor, I.src);
    }

    @Override
    public void visit(Instruction.IputObject I) {
        iput(I.obj, I.className, I.fieldName, I.descriptor, I.src);
    }

    @Override
    public void visit(Instruction.IputBoolean I) {
        iput(I.obj, I.className, I.fieldName, I.descriptor, I.src);
    }

    @Override
    public void visit(Instruction.IputByte I) {
        iput(I.obj, I.className, I.fieldName, I.descriptor, I.src);
    }

    @Override
    public void visit(Instruction.IputChar I) {
        iput(I.obj, I.className, I.fieldName, I.descriptor, I.src);
    }

    @Override
    public void visit(Instruction.IputShort I) {
        iput(I.obj, I.className, I.fieldName, I.descriptor, I.src);
    }
    
    @Override
    public void visit(Instruction.Sget I) {
        sget(I.dest, I.className, I.fieldName, I.descriptor);
    }

    @Override
    public void visit(Instruction.SgetWide I) {
        sget(I.dest, I.className, I.fieldName, I.descriptor);
    }

    @Override
    public void visit(Instruction.SgetObject I) {
        sget(I.dest, I.className, I.fieldName, I.descriptor);
    }

    @Override
    public void visit(Instruction.SgetBoolean I) {
        sget(I.dest, I.className, I.fieldName, I.descriptor);
    }

    @Override
    public void visit(Instruction.SgetByte I) {
        sget(I.dest, I.className, I.fieldName, I.descriptor);
    }

    @Override
    public void visit(Instruction.SgetChar I) {
        sget(I.dest, I.className, I.fieldName, I.descriptor);
    }

    @Override
    public void visit(Instruction.SgetShort I) {
        sget(I.dest, I.className, I.fieldName, I.descriptor);
    }

    @Override
    public void visit(Instruction.Sput I) {
        sput(I.className, I.fieldName, I.descriptor, I.src);
    }

    @Override
    public void visit(Instruction.SputWide I) {
        sput(I.className, I.fieldName, I.descriptor, I.src);
    }

    @Override
    public void visit(Instruction.SputObject I) {
        sput(I.className, I.fieldName, I.descriptor, I.src);
    }

    @Override
    public void visit(Instruction.SputBoolean I) {
        sput(I.className, I.fieldName, I.descriptor, I.src);
    }

    @Override
    public void visit(Instruction.SputByte I) {
        sput(I.className, I.fieldName, I.descriptor, I.src);
    }

    @Override
    public void visit(Instruction.SputChar I) {
        sput(I.className, I.fieldName, I.descriptor, I.src);
    }

    @Override
    public void visit(Instruction.SputShort I) {
        sput(I.className, I.fieldName, I.descriptor, I.src);
    }

    /**
     * Remember to consider the 'synchronized' method.
     * TODO
     */
    @Override
    public void visit(Instruction.InvokeVirtual I) {
        Object object = reg[I.args[0]];
        assert object instanceof VMInstance;
        VMInstance obj = (VMInstance)object;
        VMClass C = obj.type;

        VMMethod method = VM.resolveMethod(currentClass, I.className, I.methodSign);
        method = C.lookupVirtualMethod(method);
        vmt.setExecuteEnv(method, I.args);
    }

    @Override
    public void visit(Instruction.InvokeSuper I) {
        Object object = reg[I.args[0]];
        assert object instanceof VMInstance;
        VMInstance obj = (VMInstance)object;
        VMClass SC = obj.type.superClass;

        VMMethod method = VM.resolveMethod(currentClass, I.className, I.methodSign);
        method = SC.lookupVirtualMethod(method);
        vmt.setExecuteEnv(method, I.args);
    }

    @Override
    public void visit(Instruction.InvokeDirect I) {
        Object object = reg[I.args[0]];
        assert object instanceof VMInstance;
        VMInstance obj = (VMInstance)object;
        VMClass C = obj.type.superClass;

        VMMethod method = VM.resolveMethod(currentClass, I.className, I.methodSign);
        assert C.getDeclaredMethod(I.methodSign).equals(method);
        vmt.setExecuteEnv(method, I.args);
    }

    @Override
    public void visit(Instruction.InvokeStatic I) {
        VM.resolveMethod(currentClass, I.className, I.methodSign);
        VMClass C = VM.resolveClassOrInterface(currentClass, I.className);
        VMMethod method = C.lookupStaticMethod(I.methodSign);
        vmt.setExecuteEnv(method, I.args);
    }

    @Override
    public void visit(Instruction.InvokeInterface I) {
        Object object = reg[I.args[0]];
        assert object instanceof VMInstance;
        VMInstance obj = (VMInstance)object;
        VMClass C = obj.type;

        VM.resolveInterfaceMethod(currentClass, I.className, I.methodSign);
        VMMethod method = C.lookupInterfaceMethod(I.methodSign);
        vmt.setExecuteEnv(method, I.args);
    }

    @Override
    public void visit(Instruction.InvokeVirtualRange I) {
    }

    @Override
    public void visit(Instruction.InvokeSuperRange I) {
 }

    @Override
    public void visit(Instruction.InvokeDirectRange I) {
    }

    @Override
    public void visit(Instruction.InvokeStaticRange I) {
    }

    @Override
    public void visit(Instruction.InvokeInterfaceRange I) {
    }

    @Override
    public void visit(Instruction.NegInt I) {
        Object src = reg[I.src];
        reg[I.dest] = -(Integer) src;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.NotInt I) {
        Object src = reg[I.src];
        reg[I.dest] = ~(Integer) src;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.NegLong I) {
        Object src = reg[I.src];
        reg[I.dest] = -(Long) src;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.NotLong I) {
        Object src = reg[I.src];
        reg[I.dest] = ~(Long) src;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.NegFloat I) {
        Object src = reg[I.src];
        reg[I.dest] = -(Float) src;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.NegDouble I) {
        Object src = reg[I.src];
        reg[I.dest] = -(Double) src;
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.IntToLong I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Integer) src).longValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.IntToFloat I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Integer) src).floatValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.IntToDouble I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Integer) src).doubleValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.LongToInt I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Long) src).intValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.LongToFloat I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Long) src).floatValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.LongToDouble I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Long) src).doubleValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.FloatToInt I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Float) src).intValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.FloatToLong I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Float) src).longValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.FloatToDouble I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Float) src).doubleValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.DoubleToInt I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Double) src).intValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.DoubleToLong I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Double) src).longValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.DoubleToFloat I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Double) src).floatValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.IntToByte I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Integer) src).byteValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.IntToChar I) {
        Object src = reg[I.src];
        reg[I.dest] = (char) ((Integer) src).intValue(); // Right?
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.IntToShort I) {
        Object src = reg[I.src];
        reg[I.dest] = ((Integer) src).shortValue();
        vmt.pc++;
    }

    @Override
    public void visit(Instruction.AddInt I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.SubInt I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.MulInt I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.DivInt I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.RemInt I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.AndInt I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.OrInt I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.XorInt I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.ShlInt I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.ShrInt I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.UshrInt I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.AddLong I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.SubLong I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.MulLong I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.DivLong I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.RemLong I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.AndLong I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.OrLong I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.XorLong I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.ShlLong I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.ShrLong I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.UshrLong I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.AddFloat I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.SubFloat I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.MulFloat I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.DivFloat I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.RemFloat I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.AddDouble I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.SubDouble I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.MulDouble I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.DivDouble I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.RemDouble I) {
        biop(I.dest, I.first, I.second, I.op);
    }

    @Override
    public void visit(Instruction.AddInt2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.SubInt2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.MulInt2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.DivInt2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.RemInt2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.AndInt2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.OrInt2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.XorInt2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.ShlInt2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.ShrInt2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.UshrInt2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.AddLong2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.SubLong2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.MulLong2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.DivLong2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.RemLong2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.AndLong2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.OrLong2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.XorLong2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.ShlLong2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.ShrLong2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.UshrLong2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.AddFloat2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.SubFloat2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.MulFloat2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.DivFloat2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.RemFloat2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.AddDouble2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.SubDouble2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.MulDouble2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.DivDouble2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.RemDouble2Addr I) {
        biop2addr(I.dest, I.src, I.op);
    }

    @Override
    public void visit(Instruction.AddIntLit16 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.RsubInt I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.MulIntLit16 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }


    @Override
    public void visit(Instruction.DivIntLit16 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.RemIntLit16 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }


    @Override
    public void visit(Instruction.AndIntLit16 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.OrIntLit16 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.XorIntLit16 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.AddIntLit8 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.RsubIntLit8 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.MulIntLit8 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.DivIntLit8 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.RemIntLit8 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }


    @Override
    public void visit(Instruction.AndIntLit8 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.OrIntLit8 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.XorIntLit8 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.ShlIntLit8 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.ShrIntLit8 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }

    @Override
    public void visit(Instruction.UshrIntLit8 I) {
        biopLit(I.dest, I.src, I.lit, I.op);
    }


    ///////////////////////////////////////////////////////////////////////////////////
    // Helper functions
    ///////////////////////////////////////////////////////////////////////////////////
    private void aput(int arr, int index, int src){
        Object obj = reg[arr];
        assert obj instanceof VMArray;
        ((VMArray) obj).set(index, reg[src]);
        vmt.pc++;
    }
    private void aget(int dest, int arr, int index){
        Object obj = reg[arr];
        assert obj instanceof VMArray;
        reg[dest] = ((VMArray) obj).get(index);
        vmt.pc++;
    }

    private void iput(int object, String className, String fieldName, String descriptor, int src){
        Object obj = reg[object];
        assert obj instanceof VMInstance;
        VMField fieldKey = VM.resolveField(currentClass, className, fieldName, descriptor);
        VMField field = ((VMInstance)obj).getInstanceField(fieldKey);
        field.value = reg[src];
        vmt.pc++;
    }
    private void iget(int dest, int object, String className, String fieldName, String descriptor){
        Object obj = reg[object];
        assert obj instanceof VMInstance;
        VMField fieldKey = VM.resolveField(currentClass, className, fieldName, descriptor);
        VMField field = ((VMInstance)obj).getInstanceField(fieldKey);
        reg[dest] = field.value;
        vmt.pc++;
    }
    private void sget(int dest, String className, String fieldName, String descriptor){
        VMClass klass = VM.resolveClassOrInterface(currentClass, className);
        VMField fieldKey = VM.resolveField(currentClass, className, fieldName, descriptor);
        VMField field = klass.getStaticField(fieldKey);
        reg[dest] = field.value;
        vmt.pc++;
    }
    private void sput(String className, String fieldName, String descriptor, int src){
        VMClass klass = VM.resolveClassOrInterface(currentClass, className);
        VMField fieldKey = VM.resolveField(currentClass, className, fieldName, descriptor);
        VMField field = klass.getStaticField(fieldKey);
        field.value = reg[src];
        vmt.pc++;
    }


    private void biopLit(int dstReg, int srcReg, int literal, String op) {
        Object result = null;
        Integer src = (Integer) reg[srcReg];
        Integer lit = literal;

        int indexEnd = op.indexOf("/");
        if (indexEnd == -1)
            indexEnd = op.length();
        switch (op.substring(0, indexEnd)) {
            case "add-int":
                result = src + lit;
                break;
            case "rsub-int":
                result = lit - src;
                break;
            case "mul-int":
                result = src * lit;
                break;
            case "div-int":
                result = src / lit;
                break;
            case "rem-int":
                result = src % lit;
                break;
            case "and-int":
                result = src & lit;
                break;
            case "or-int":
                result = src | lit;
                break;
            case "xor-int":
                result = src ^ lit;
                break;
            case "shl-int":
                result = src << lit;
                break;
            case "shr-int":
                result = src >> lit;
                break;
            case "ushr-int":
                result = src >>> lit;
                break;
            default:
                Debug.panic("biopLit..swith..op.sub: unkown");
                break;
        }
        reg[dstReg] = result;
        vmt.pc++;
    }

    private void biop2addr(int firstReg, int secondReg, String op) {
        biop(firstReg, firstReg, secondReg, op.substring(0, op.indexOf("/")));
    }

    private void biop(int dstReg, int firstReg, int secondReg, String op) {
        Object result = null;

        switch (op.substring(op.indexOf("-") + 1)) {
            case "int":
                Integer int1 = (Integer) reg[firstReg];
                Integer int2 = (Integer) reg[secondReg];
                switch (op) {
                    case "add-int":
                        result = int1 + int2;
                        break;
                    case "sub-int":
                        result = int1 - int2;
                        break;
                    case "mul-int":
                        result = int1 * int2;
                        break;
                    case "div-int":
                        result = int1 / int2;
                        break;
                    case "rem-int":
                        result = int1 % int2;
                        break;
                    case "and-int":
                        result = int1 & int2;
                        break;
                    case "or-int":
                        result = int1 | int2;
                        break;
                    case "xor-int":
                        result = int1 ^ int2;
                        break;
                    case "shl-int":
                        result = int1 << int2;
                        break;
                    case "shr-int":
                        result = int1 >> int2;
                        break;
                    case "ushr-int":
                        result = int1 >>> int2;
                        break;
                    default:
                        Debug.panic("biop..swith..int..op: unkown");
                        break;
                }
                break;
            case "long":
                Long long1 = (Long) reg[firstReg];
                Long long2 = (Long) reg[secondReg];
                switch (op) {
                    case "add-long":
                        result = long1 + long2;
                        break;
                    case "sub-long":
                        result = long1 - long2;
                        break;
                    case "mul-long":
                        result = long1 * long2;
                        break;
                    case "div-long":
                        result = long1 / long2;
                        break;
                    case "rem-long":
                        result = long1 % long2;
                        break;
                    case "and-long":
                        result = long1 & long2;
                        break;
                    case "or-long":
                        result = long1 | long2;
                        break;
                    case "xor-long":
                        result = long1 ^ long2;
                        break;
                    case "shl-long":
                        result = long1 << long2;
                        break;
                    case "shr-long":
                        result = long1 >> long2;
                        break;
                    case "ushr-long":
                        result = long1 >>> long2;
                        break;
                    default:
                        Debug.panic("biop..swith..long..op: unkown");
                        break;
                }
                break;
            case "float":
                Float float1 = (Float) reg[firstReg];
                Float float2 = (Float) reg[secondReg];
                switch (op) {
                    case "add-float":
                        result = float1 + float2;
                        break;
                    case "sub-float":
                        result = float1 - float2;
                        break;
                    case "mul-float":
                        result = float1 * float2;
                        break;
                    case "div-float":
                        result = float1 / float2;
                        break;
                    case "rem-float":
                        result = float1 % float2;
                        break;
                    default:
                        Debug.panic("biop..swith..float..op: unkown");
                        break;
                }
                break;
            case "double":
                Double double1 = (Double) reg[firstReg];
                Double double2 = (Double) reg[secondReg];
                switch (op) {
                    case "add-double":
                        result = double1 + double2;
                        break;
                    case "sub-double":
                        result = double1 - double2;
                        break;
                    case "mul-double":
                        result = double1 * double2;
                        break;
                    case "div-double":
                        result = double1 / double2;
                        break;
                    case "rem-double":
                        result = double1 % double2;
                        break;
                    default:
                        Debug.panic("biop..swith..double..op: unkown");
                        break;
                }
                break;
            default:
                Debug.panic("biop..swith..op's endwith: unkown");
                break;
        }
        reg[dstReg] = result;
        vmt.pc++;
    }

}
