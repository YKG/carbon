package vm2;

import ast.VisitorAdapter;
import ast.annotation.Annotation;
import ast.classs.FieldItem;
import ast.stm.Instruction;

import java.util.Map;

import static vm2.Util.hex2int;
import static vm2.Util.hex2long;

public class Interpreter extends VisitorAdapter {
	private VM vm;

    public Interpreter(VM vm){
        this.vm = vm;
    }

	@Override
	public void visit(Instruction.Nop inst) {
        vm.pc++;
	}

    private void move(int dest, int src){
        vm.reg[dest] = vm.reg[src];
        vm.pc++;
    }

	@Override
	public void visit(Instruction.Move inst) {
        move(inst.vdest, inst.vsrc);
	}

	@Override
	public void visit(Instruction.MoveFrom16 inst) {
        move(inst.vdest, inst.vsrc);
	}

	@Override
	public void visit(Instruction.Move16 inst) {
        move(inst.vdest, inst.vsrc);
	}

	@Override
	public void visit(Instruction.MoveWide inst) {
        // TODO:
        //      Be careful with 'wide' operation!
        //      Our 'wide' operation handler may introduce a bug.
        move(inst.vdest, inst.vsrc);
	}

	@Override
	public void visit(Instruction.MoveWideFrom16 inst) {
        move(inst.vdest, inst.vsrc);
	}

	@Override
	public void visit(Instruction.MoveWide16 inst) {
        move(inst.vdest, inst.vsrc);
	}

	@Override
	public void visit(Instruction.MoveObject inst) {
        move(inst.vdest, inst.vsrc);
	}

	@Override
	public void visit(Instruction.MoveObjectFrom16 inst) {
        move(inst.vdest, inst.vsrc);
	}

	@Override
	public void visit(Instruction.MoveObject16 inst) {
        move(inst.vdest, inst.vsrc);
	}

    private void moveResult(int dest){
        vm.reg[dest] = vm.returnValue;
        vm.pc++;
    }
	@Override
	public void visit(Instruction.MoveResult inst) {
        moveResult(inst.vdest);
	}

	@Override
	public void visit(Instruction.MoveResultWide inst) {
        moveResult(inst.vdest);
	}

	@Override
	public void visit(Instruction.MoveResultObject inst) {
        moveResult(inst.vdest);
	}

	@Override
	public void visit(Instruction.MoveException inst) {
        // TODO
        Util.printErr("Unimplement instruction: MoveException");
	}

    // return-*:
    //  1. set result
    //  2. pop frame to code/pc/reg
    //  3. pc++
	@Override
	public void visit(Instruction.ReturnVoid inst) {
		vm.restoreThreadState();
        vm.pc++;
	}

	@Override
	public void visit(Instruction.Return inst) {
        vm.returnValue = vm.reg[inst.vret];
		vm.restoreThreadState();
        vm.pc++;
	}

	@Override
	public void visit(Instruction.ReturnWide inst) {
        vm.returnValue = vm.reg[inst.vret];
		vm.restoreThreadState();
        vm.pc++;
	}

	@Override
	public void visit(Instruction.ReturnObject inst) {
        vm.returnValue = vm.reg[inst.vret];
		vm.restoreThreadState();
        vm.pc++;
	}

    private void _const(int dest, Object val){
        vm.reg[dest] = val;
        vm.pc++;
    }

    @Override
    public void visit(Instruction.Const4 inst) {
        _const(inst.vdest, hex2int(inst.value));
    }

    @Override
    public void visit(Instruction.Const16 inst) {
        _const(inst.vdest, hex2int(inst.value));
    }

    @Override
    public void visit(Instruction.Const inst) {
        _const(inst.vdest, hex2int(inst.value));
    }

    @Override
    public void visit(Instruction.ConstHigh16 inst) {
        _const(inst.vdest, hex2int(inst.value) << 16);
    }

    @Override
    public void visit(Instruction.ConstWide16 inst) {
        _const(inst.vdest, (long) hex2int(inst.value));
    }

    @Override
    public void visit(Instruction.ConstWide32 inst) {
        _const(inst.vdest, (long) hex2int(inst.value));
    }

    @Override
    public void visit(Instruction.ConstWide inst) {
        _const(inst.vdest, (long) hex2long(inst.value));
    }

    @Override
    public void visit(Instruction.ConstWideHigh16 inst) {
        _const(inst.vdest, hex2long(inst.value) << 48);
    }

    @Override
    public void visit(Instruction.ConstString inst) {
        _const(inst.vdest, inst.str);
    }

    @Override
    public void visit(Instruction.ConstStringJumbo inst) {
        _const(inst.vdest, inst.str);
    }

	@Override
	public void visit(Instruction.ConstClass inst) {
        // TODO
        /**
         * NOTE:
         *      maybe const-class is java.lang.reflect concern and multi thread concern.
         *      refer:
         *         https://android.googlesource.com/platform/dalvik/+/master/dx/tests/062-dex-synch-method/Blort.java
         *         https://android.googlesource.com/platform/dalvik/+/master/dx/tests/070-dex-multianewarray/Blort.java
         */
        Util.printErr("Unimplemented instruction: " + inst.op);
	}

	@Override
	public void visit(Instruction.MonitorEnter inst) {
        // TODO
        Util.printErr("Unimplemented instruction: " + inst.op);
	}

	@Override
	public void visit(Instruction.MonitorExit inst) {
        // TODO
        Util.printErr("Unimplemented instruction: " + inst.op);
	}

	@Override
	public void visit(Instruction.CheckCast inst) {
        // TODO
        Util.printErr("Unimplemented instruction: " + inst.op);
	}

	@Override
	public void visit(Instruction.InstanceOf inst) {
        vm.reg[inst.vdest] = ((Instance)vm.reg[inst.vref]).isA(inst.type);
        vm.pc++;
	}

	@Override
	public void visit(Instruction.arrayLength inst) {
        vm.reg[inst.vdest] = ((Array) vm.reg[inst.vsrc]).getLength();
		vm.pc++;
	}

	@Override
	public void visit(Instruction.NewInstance inst) {
        vm.reg[inst.vdest] = new Instance(vm, inst.type);
        vm.pc++;
	}

	@Override
	public void visit(Instruction.NewArray inst) {
        vm.reg[inst.vdest] = new Array(inst.type, inst.size);
		vm.pc++;
	}

    @Override
    public void visit(Instruction.FilledNewArray inst) {
        assert inst.type.equals("[I");
        int dimensions[] = new int[inst.argvs.length];
        for(int i = 0; i < dimensions.length; i++){
            dimensions[i] = (Integer) vm.reg[inst.argvs[i]];
        }
        vm.returnValue = dimensions;
        vm.pc++;
    }

    @Override
    public void visit(Instruction.FilledNewArrayRange inst) {
        assert inst.type.equals("[I");
        vm.returnValue = vm.getObjectsFromRegs(inst.argvs);
        vm.pc++;
    }

	@Override
	public void visit(Instruction.FillArrayData inst) {
		((Array) vm.reg[inst.vdest]).fillArrayData(vm.getArrayPayload(inst.addr));
		vm.pc++;
	}

	@Override
	public void visit(Instruction.Throw inst) {
        // TODO
        Util.printErr("Unimplemented instruction: " + inst.op);
	}

	@Override
	public void visit(Instruction.Goto inst) {
		vm.pc = inst.addr;
	}

	@Override
	public void visit(Instruction.Goto16 inst) {
		vm.pc = inst.addr;
	}

	@Override
	public void visit(Instruction.Goto32 inst) {
		vm.pc = inst.addr;
	}

	@Override
	public void visit(Instruction.PackedSwitch inst) {
		Map<Integer, Integer> switchMap = vm.getSwitchMap(inst.addr);
		Object test = vm.reg[inst.vtest];
		Integer dest = switchMap.get((Integer) test);
        vm.pc = dest == null ? vm.pc + 1 : dest.intValue();
	}

	@Override
	public void visit(Instruction.SparseSwitch inst) {
		Map<Integer, Integer> switchMap = vm.getSwitchMap(inst.addr);
		Object test = vm.reg[inst.vtest];
		Integer dest = switchMap.get((Integer) test);
        vm.pc = dest == null ? vm.pc + 1 : dest.intValue();
	}

    @Override
    public void visit(Instruction.CmplFloat inst) {
        Float val1 = (Float) vm.reg[inst.vfirst];
        Float val2 = (Float) vm.reg[inst.vsecond];
        if (val1.isNaN() || val2.isNaN()) {
            vm.reg[inst.vdest] = -1;
        } else {
            int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
            vm.reg[inst.vdest] = result;
        }
        vm.pc++;
    }

    @Override
    public void visit(Instruction.CmpgFloat inst) {
        Float val1 = (Float) vm.reg[inst.vfirst];
        Float val2 = (Float) vm.reg[inst.vsecond];
        if (val1.isNaN() || val2.isNaN()) {
            vm.reg[inst.vdest] = 1;
        } else {
            int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
            vm.reg[inst.vdest] = result;
        }
        vm.pc++;
    }

    @Override
    public void visit(Instruction.CmplDouble inst) {
        Double val1 = (Double) vm.reg[inst.vfirst];
        Double val2 = (Double) vm.reg[inst.vsecond];
        if (val1.isNaN() || val2.isNaN()) {
            vm.reg[inst.vdest] = -1;
        } else {
            int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
            vm.reg[inst.vdest] = result;
        }
        vm.pc++;
    }

    @Override
    public void visit(Instruction.Cmpgdouble inst) {
        Double val1 = (Double) vm.reg[inst.vfirst];
        Double val2 = (Double) vm.reg[inst.vsecond];
        if (val1.isNaN() || val2.isNaN()) {
            vm.reg[inst.vdest] = 1;
        } else {
            int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
            vm.reg[inst.vdest] = result;
        }
        vm.pc++;
    }

    @Override
    public void visit(Instruction.CmpLong inst) {
        Long val1 = (Long) vm.reg[inst.vfirst];
        Long val2 = (Long) vm.reg[inst.vsecond];
        int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
        vm.reg[inst.vdest] = result;
        vm.pc++;
    }


    private boolean intTest(Object obj1, Object obj2, String cmp){
        assert !(obj1 instanceof Float  || obj2 instanceof Float);
        assert !(obj1 instanceof Long   || obj2 instanceof Long);
        assert !(obj1 instanceof Double || obj2 instanceof Double);

        int val1 = (Integer) obj1;
        int val2 = (Integer) obj2;
        switch (cmp){
            case "eq": return val1 == val2;
            case "ne": return val1 != val2;
            case "lt": return val1  < val2;
            case "ge": return val1 >= val2;
            case "gt": return val1  > val2;
            case "le": return val1 <= val2;
            default:
                Util.printErr("Interpreter.inTest: invalid arg 'cmp'");
                break;
        }
        return false;
    }

    /**
     * refer to: androguard-060441150eba/specs/dalvik/opcodes/opcode-32-if-test.html
     */
    private void iftest(String opFull, int firstReg, int secondReg, int addr){
        String op = opFull.substring(3, 5); // e.g. if-eq --> eq / if-ge --> ge
        Object val1 = vm.reg[firstReg];
        Object val2 = vm.reg[secondReg];
        vm.pc = intTest(val1, val2, op) ? addr : vm.pc + 1;
    }

    private void iftestz(String opFull, int testReg, int addr){
        String op = opFull.substring(3, 5); // e.g. if-eqz --> eq / if-gez --> ge
        Object val1 = vm.reg[testReg];
        Object val2 = 0;
        vm.pc = intTest(val1, val2, op) ? addr : vm.pc + 1;
    }

	@Override
	public void visit(Instruction.IfEq inst) {
        iftest(inst.op, inst.vfirst, inst.vsecond, inst.addr);
	}

	@Override
	public void visit(Instruction.IfNe inst) {
        iftest(inst.op, inst.vfirst, inst.vsecond, inst.addr);
	}

	@Override
	public void visit(Instruction.IfLt inst) {
        iftest(inst.op, inst.vfirst, inst.vsecond, inst.addr);
	}

	@Override
	public void visit(Instruction.IfGe inst) {
        iftest(inst.op, inst.vfirst, inst.vsecond, inst.addr);
	}

	@Override
	public void visit(Instruction.IfGt inst) {
        iftest(inst.op, inst.vfirst, inst.vsecond, inst.addr);
	}

	@Override
	public void visit(Instruction.IfLe inst) {
        iftest(inst.op, inst.vfirst, inst.vsecond, inst.addr);
	}

	@Override
	public void visit(Instruction.IfEqz inst) {
        iftestz(inst.op, inst.vtest, inst.addr);
	}

	@Override
	public void visit(Instruction.IfNez inst) {
        iftestz(inst.op, inst.vtest, inst.addr);
	}

	@Override
	public void visit(Instruction.IfLtz inst) {
        iftestz(inst.op, inst.vtest, inst.addr);
	}

	@Override
	public void visit(Instruction.IfGez inst) {
        iftestz(inst.op, inst.vtest, inst.addr);
	}

	@Override
	public void visit(Instruction.IfGtz inst) {
        iftestz(inst.op, inst.vtest, inst.addr);
	}

	@Override
	public void visit(Instruction.IfLez inst) {
        iftestz(inst.op, inst.vtest, inst.addr);
	}

	private void aget(int dstReg, int arrReg, String index) {
		vm.reg[dstReg] = ((Array) vm.reg[arrReg]).aget(index);
		vm.pc++;
	}

	private void aput(int srcReg, int arrReg, String index) {
		((Array) vm.reg[arrReg]).aput(index, vm.reg[srcReg]);
		vm.pc++;
	}

	@Override
	public void visit(Instruction.Aget inst) {
		aget(inst.vdest, inst.varray, inst.index);
	}

	@Override
	public void visit(Instruction.AgetWide inst) {
		aget(inst.vdest, inst.varray, inst.index);
	}

	@Override
	public void visit(Instruction.AgetObject inst) {
		aget(inst.vdest, inst.varray, inst.index);
	}

	@Override
	public void visit(Instruction.AgetBoolean inst) {
		aget(inst.vdest, inst.varray, inst.index);
	}

	@Override
	public void visit(Instruction.AgetByte inst) {
		aget(inst.vdest, inst.varray, inst.index);
	}

	@Override
	public void visit(Instruction.AgetChar inst) {
		aget(inst.vdest, inst.varray, inst.index);
	}

	@Override
	public void visit(Instruction.AgetShort inst) {
		aget(inst.vdest, inst.varray, inst.index);
	}

	@Override
	public void visit(Instruction.Aput inst) {
		aput(inst.vsrc, inst.varray, inst.index);
	}

	@Override
	public void visit(Instruction.AputWide inst) {
		aput(inst.vsrc, inst.varray, inst.index);
	}

	@Override
	public void visit(Instruction.AputObject inst) {
		aput(inst.vsrc, inst.varray, inst.index);
	}

	@Override
	public void visit(Instruction.AputBoolean inst) {
		aput(inst.vsrc, inst.varray, inst.index);
	}

	@Override
	public void visit(Instruction.AputByte inst) {
		aput(inst.vsrc, inst.varray, inst.index);
	}

	@Override
	public void visit(Instruction.AputChar inst) {
		aput(inst.vsrc, inst.varray, inst.index);
	}

	@Override
	public void visit(Instruction.AputShort inst) {
		aput(inst.vsrc, inst.varray, inst.index);
	}

    private void iget(int dstReg, int objReg, String fieldName){
        vm.reg[dstReg] = ((Instance)vm.reg[objReg]).iget(fieldName);
        vm.pc++;
    }

    private void iput(int srcReg, int objReg, String fieldName){
        ((Instance)vm.reg[objReg]).iput(fieldName, vm.reg[srcReg]);
        vm.pc++;
    }

	@Override
	public void visit(Instruction.Iget inst) {
        iget(inst.vdest, inst.vfield, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IgetWide inst) {
        iget(inst.vdest, inst.vfield, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IgetOjbect inst) {
        iget(inst.vdest, inst.vfield, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IgetBoolean inst) {
        iget(inst.vdest, inst.vfield, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IgetByte inst) {
        iget(inst.vdest, inst.vfield, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IgetChar inst) {
        iget(inst.vdest, inst.vfield, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IgetShort inst) {
        iget(inst.vdest, inst.vfield, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.Iput inst) {
        iput(inst.vsrc, inst.vfield, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IputWide inst) {
        iput(inst.vsrc, inst.vfield, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IputObject inst) {
        iput(inst.vsrc, inst.vfield, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IputBoolean inst) {
        iput(inst.vsrc, inst.vfield, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IputByte inst) {
        iput(inst.vsrc, inst.vfield, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IputChar inst) {
        iput(inst.vsrc, inst.vfield, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IputShort inst) {
        iput(inst.vsrc, inst.vfield, inst.type.fieldName);
	}

    private void sget(int dstReg, FieldItem fieldItem){
    	//TODO FIXME
    	if(fieldItem.fieldName.equals("out")) {
    		vm.pc++;
    		return ;
    	}
    	
    	//ORIG VERSION
        vm.reg[dstReg] = vm.staticFieldsArea.getStaticField(fieldItem);
        vm.pc++;
    }

    private void sput(int srcReg, FieldItem fieldItem){
        vm.staticFieldsArea.setStaticField(fieldItem, vm.reg[srcReg]);
        vm.pc++;
    }

	@Override
	public void visit(Instruction.Sget inst) {
        sget(inst.vdest, inst.type);
	}

	@Override
	public void visit(Instruction.SgetWide inst) {
        sget(inst.vdest, inst.type);
	}

	@Override
	public void visit(Instruction.SgetObject inst) {
        sget(inst.vdest, inst.type);
	}

	@Override
	public void visit(Instruction.SgetBoolean inst) {
        sget(inst.vdest, inst.type);
	}

	@Override
	public void visit(Instruction.SgetByte inst) {
        sget(inst.vdest, inst.type);
	}

	@Override
	public void visit(Instruction.SgetChar inst) {
        sget(inst.vdest, inst.type);
	}

	@Override
	public void visit(Instruction.SgetShort inst) {
        sget(inst.vdest, inst.type);
	}

	@Override
	public void visit(Instruction.Sput inst) {
        sput(inst.vsrc, inst.type);
	}

	@Override
	public void visit(Instruction.SputWide inst) {
        sput(inst.vsrc, inst.type);
	}

	@Override
	public void visit(Instruction.SputObject inst) {
        sput(inst.vsrc, inst.type);
	}

	@Override
	public void visit(Instruction.SputBoolean inst) {
        sput(inst.vsrc, inst.type);
	}

	@Override
	public void visit(Instruction.SputByte inst) {
        sput(inst.vsrc, inst.type);
	}

	@Override
	public void visit(Instruction.SputChar inst) {
        sput(inst.vsrc, inst.type);
	}

	@Override
	public void visit(Instruction.SputShort inst) {
        sput(inst.vsrc, inst.type);
	}

    // invoke-*:
    //  1. save frame
    //  2. set code/pc/reg
	@Override
	public void visit(Instruction.InvokeVirtual inst) {
		//TODO FIXME
		if(inst.type.methodName.equals("println")) {
			vm.pc++;
			Object result = vm.reg[inst.argvs[0]];
			System.err.println(result);
			return ;
		}
		
		//TODO ORIG VERSION
        vm.saveThreadState();
        String objType = ((Instance)vm.reg[inst.argvs[0]]).clazzName;
        vm.setExecuteEnv(vm.getMethod(objType, inst.type.getMethodSign()), inst.argvs);
	}

	@Override
	public void visit(Instruction.InvokeSuper inst) {
<<<<<<< HEAD
        vm.saveThreadState();
        String superType = ((Instance)vm.reg[inst.argvs[0]]).getSuperClazz();
        vm.setExecuteEnv(vm.getMethod(superType, inst.type.getMethodSign()), inst.argvs);
	}

	@Override
	public void visit(Instruction.InvokeDirect inst) {
        vm.saveThreadState();
        vm.setExecuteEnv(vm.getMethod(inst.type.classType, inst.type.getMethodSign()), inst.argvs);
	}

	@Override
	public void visit(Instruction.InvokeStatic inst) {
        vm.saveThreadState();
        vm.setExecuteEnv(vm.getMethod(inst.type.classType, inst.type.getMethodSign()), inst.argvs);
	}

	@Override
	public void visit(Instruction.InvokeInterface inst) {
        vm.saveThreadState();
        String objType = ((Instance)vm.reg[inst.argvs[0]]).clazzName;
        vm.setExecuteEnv(vm.getMethod(objType, inst.type.getMethodSign()), inst.argvs);
	}

	@Override
	public void visit(Instruction.InvokeVirtualRange inst) {
        vm.saveThreadState();
        String objType = ((Instance)vm.reg[inst.argvs[0]]).clazzName;
        vm.setExecuteEnv(vm.getMethod(objType, inst.type.getMethodSign()), inst.argvs);
	}

	@Override
	public void visit(Instruction.InvokeSuperRange inst) {
        vm.saveThreadState();
        String superType = ((Instance)vm.reg[inst.argvs[0]]).getSuperClazz();
        vm.setExecuteEnv(vm.getMethod(superType, inst.type.getMethodSign()), inst.argvs);
	}

	@Override
	public void visit(Instruction.InvokeDirectRange inst) {
        vm.saveThreadState();
        vm.setExecuteEnv(vm.getMethod(inst.type.classType, inst.type.getMethodSign()), inst.argvs);
	}

	@Override
	public void visit(Instruction.InvokeStaticRange inst) {
        vm.saveThreadState();
        vm.setExecuteEnv(vm.getMethod(inst.type.classType, inst.type.getMethodSign()), inst.argvs);
	}

	@Override
	public void visit(Instruction.InvokeInterfaceRange inst) {
        vm.saveThreadState();
        String objType = ((Instance)vm.reg[inst.argvs[0]]).clazzName;
        vm.setExecuteEnv(vm.getMethod(objType, inst.type.getMethodSign()), inst.argvs);
	}

    @Override
    public void visit(Instruction.NegInt inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = -(Integer) src;
        vm.pc++;
    }

    @Override
    public void visit(Instruction.NotInt inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ~(Integer) src;
        vm.pc++;
    }

    @Override
    public void visit(Instruction.NegLong inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = -(Long) src;
        vm.pc++;
    }

    @Override
    public void visit(Instruction.NotLong inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ~(Long) src;
        vm.pc++;
    }

    @Override
    public void visit(Instruction.NegFloat inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = -(Float) src;
        vm.pc++;
    }

    @Override
    public void visit(Instruction.NegDouble inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = -(Double) src;
        vm.pc++;
    }

    @Override
    public void visit(Instruction.IntToLong inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Integer) src).longValue();
        vm.pc++;
    }

    @Override
    public void visit(Instruction.IntToFloat inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Integer) src).floatValue();
        vm.pc++;
    }

    @Override
    public void visit(Instruction.IntToDouble inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Integer) src).doubleValue();
        vm.pc++;
    }

    @Override
    public void visit(Instruction.LongToInt inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Long) src).intValue();
        vm.pc++;
    }

    @Override
    public void visit(Instruction.LongToFloat inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Long) src).floatValue();
        vm.pc++;
    }

    @Override
    public void visit(Instruction.LongToDouble inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Long) src).doubleValue();
        vm.pc++;
    }

    @Override
    public void visit(Instruction.FloatToInt inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Float) src).intValue();
        vm.pc++;
    }

    @Override
    public void visit(Instruction.FloatToLong inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Float) src).longValue();
        vm.pc++;
    }

    @Override
    public void visit(Instruction.FloatToDouble inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Float) src).doubleValue();
        vm.pc++;
    }

    @Override
    public void visit(Instruction.DoubleToInt inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Double) src).intValue();
        vm.pc++;
    }

    @Override
    public void visit(Instruction.DoubleToLong inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Double) src).longValue();
        vm.pc++;
    }

    @Override
    public void visit(Instruction.DoubleToFloat inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Double) src).floatValue();
        vm.pc++;
    }

    @Override
    public void visit(Instruction.IntToByte inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Integer) src).byteValue();
        vm.pc++;
    }

    @Override
    public void visit(Instruction.IntToChar inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = (char) ((Integer) src).intValue(); // Right?
        vm.pc++;
    }

    @Override
    public void visit(Instruction.IntToShort inst) {
        Object src = vm.reg[inst.vsrc];
        vm.reg[inst.vdest] = ((Integer) src).shortValue();
        vm.pc++;
    }

    private void biopLit(int dstReg, int srcReg, String literal, String op) {
        Object result = null;
        Integer src = (Integer) vm.reg[srcReg];
        Integer lit = new Integer(literal);

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
                Util.printErr("biopLit..swith..op.sub: unkown");
                break;
        }
        vm.reg[dstReg] = result;
        vm.pc++;
    }

    private void biop2addr(int firstReg, int secondReg, String op) {
        biop(firstReg, firstReg, secondReg, op.substring(0, op.indexOf("/")));
    }

    private void biop(int dstReg, int firstReg, int secondReg, String op) {
        Object result = null;

        switch (op.substring(op.indexOf("-") + 1)) {
            case "int":
                Integer int1 = (Integer) vm.reg[firstReg];
                Integer int2 = (Integer) vm.reg[secondReg];
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
                        Util.printErr("biop..swith..int..op: unkown");
                        break;
                }
                break;
            case "long":
                Long long1 = (Long) vm.reg[firstReg];
                Long long2 = (Long) vm.reg[secondReg];
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
                        Util.printErr("biop..swith..long..op: unkown");
                        break;
                }
                break;
            case "float":
                Float float1 = (Float) vm.reg[firstReg];
                Float float2 = (Float) vm.reg[secondReg];
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
                        Util.printErr("biop..swith..float..op: unkown");
                        break;
                }
                break;
            case "double":
                Double double1 = (Double) vm.reg[firstReg];
                Double double2 = (Double) vm.reg[secondReg];
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
                        Util.printErr("biop..swith..double..op: unkown");
                        break;
                }
                break;
            default:
                Util.printErr("biop..swith..op's endwith: unkown");
                break;
        }
        vm.reg[dstReg] = result;
        vm.pc++;
    }

    @Override
    public void visit(Instruction.AddInt inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.SubInt inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.MulInt inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.DivInt inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.RemInt inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.AndInt inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.OrInt inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.XorInt inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.ShlInt inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.ShrInt inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.UshrInt inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.AddLong inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.SubLong inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.MulLong inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.DivLong inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.RemLong inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.AndLong inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.OrLong inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.XorLong inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.ShlLong inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.ShrLong inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.UshrLong inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.AddFloat inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.SubFloat inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.MulFloat inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.DivFloat inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.RemFloat inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.AddDouble inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.SubDouble inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.MulDouble inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.DivDouble inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.RemDouble inst) {
        biop(inst.vdest, inst.vfirst, inst.vsecond, inst.op);
    }

    @Override
    public void visit(Instruction.AddInt2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.SubInt2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.MulInt2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.DivInt2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.RemInt2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.AndInt2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.OrInt2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.XorInt2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.ShlInt2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.ShrInt2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.UshrInt2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.AddLong2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.SubLong2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.MulLong2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.DivLong2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.RemLong2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.AndLong2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.OrLong2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.XorLong2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.ShlLong2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.ShrLong2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.UshrLong2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.AddFloat2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.SubFloat2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.MulFloat2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.DivFloat2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.RemFloat2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.AddDouble2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.SubDouble2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.MulDouble2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.DivDouble2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

    @Override
    public void visit(Instruction.RemDouble2Addr inst) {
        biop2addr(inst.vdest, inst.vsrc, inst.op);
    }

	@Override
	public void visit(Instruction.AddIntLit16 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.RsubInt inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.MulIntLit16 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.DivIntLit16 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.RemIntLit16 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.AndIntLit16 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.OrIntLit16 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.XorIntLit16 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.AddIntLit8 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.RsubIntLit8 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.MulIntLit8 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.DivIntLit8 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.RemIntLit8 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.AndIntLit8 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.OrIntLit8 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.XorIntLit8 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.ShlIntLit8 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.ShrIntLit8 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.UshrIntLit8 inst) {
        biopLit(inst.vdest, inst.vsrc, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.PackedSwitchDirective packedSwitchDirective) {
		Util.printErr("Interpreter Instruction.PackedSwitchDirective ");
	}

	@Override
	public void visit(Instruction.SparseSwitchDirective sparseSwitchDirective) {
		Util.printErr("Interpreter Instruction.sparseSwitchDirective ");
	}

	@Override
	public void visit(Instruction.ArrayDataDirective arrayDataDirective) {
		Util.printErr("Interpreter Instruction.arrayDataDirective ");
	}

	@Override
	public void visit(Annotation annotation) {

	}

	@Override
	public void visit(Annotation.SubAnnotation subAnnotation) {

	}

	@Override
	public void visit(Annotation.ElementLiteral elementLiteral) {

	}

}
