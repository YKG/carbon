package vm2;

import ast.VisitorAdapter;
import ast.annotation.Annotation;
import ast.stm.Instruction;

import java.util.List;
import java.util.Map;

import static vm2.Util.hex2int;
import static vm2.Util.hex2long;

public class Interpreter extends VisitorAdapter {
	VM vm;

	// invoke-*:
	//  1. pc++
	//  2. save frame
	//  3. set code/pc/reg

	// return-*:
	//  1. set result
	//  2. pop frame to code/pc/reg

    public Interpreter(VM vm){
        this.vm = vm;
    }

	@Override
	public void visit(Instruction.Nop inst) {
        vm.pc++;
	}

    private void move(String dstReg, String srcReg){
        vm.setObjectToReg(dstReg, vm.getObjectByReg(srcReg));
        vm.pc++;
    }

	@Override
	public void visit(Instruction.Move inst) {
        move(inst.dest, inst.src);
	}

	@Override
	public void visit(Instruction.MoveFrom16 inst) {
        move(inst.dest, inst.src);
	}

	@Override
	public void visit(Instruction.Move16 inst) {
        move(inst.dest, inst.src);
	}

	@Override
	public void visit(Instruction.MoveWide inst) {
        // TODO:
        //      Be careful with 'wide' operation!
        //      Our 'wide' operation handler may introduce a bug.
        move(inst.dest, inst.src);
	}

	@Override
	public void visit(Instruction.MoveWideFrom16 inst) {
        move(inst.dest, inst.src);
	}

	@Override
	public void visit(Instruction.MoveWide16 inst) {
        move(inst.dest, inst.src);
	}

	@Override
	public void visit(Instruction.MoveObject inst) {
        move(inst.dest, inst.src);
	}

	@Override
	public void visit(Instruction.MoveObjectFrom16 inst) {
        move(inst.dest, inst.src);
	}

	@Override
	public void visit(Instruction.MoveObject16 inst) {
        move(inst.dest, inst.src);
	}

	@Override
	public void visit(Instruction.MoveResult inst) {
		vm.setObjectToReg(inst.dest, vm.returnValue);
		vm.pc++;
	}

	@Override
	public void visit(Instruction.MoveResultWide inst) {
		vm.setObjectToReg(inst.dest, vm.returnValue);
		vm.pc++;
	}

	@Override
	public void visit(Instruction.MoveResultObject inst) {
		vm.setObjectToReg(inst.dest, vm.returnValue);
		vm.pc++;
	}

	@Override
	public void visit(Instruction.MoveException inst) {
        // TODO
        Util.printErr("Unimplement instruction: MoveException");
	}

	@Override
	public void visit(Instruction.ReturnVoid inst) {
		vm.popFrame();
	}

	@Override
	public void visit(Instruction.Return inst) {
		vm.setReturnValue(inst.ret);
		vm.popFrame();
	}

	@Override
	public void visit(Instruction.ReturnWide inst) {
		vm.setReturnValue(inst.ret);
		vm.popFrame();
	}

	@Override
	public void visit(Instruction.ReturnObject inst) {
		vm.setReturnValue(inst.ret);
		vm.popFrame();
	}

    @Override
    public void visit(Instruction.Const4 inst) {
        vm.setObjectToReg(inst.dest, hex2int(inst.value));
        vm.pc++;
    }

    @Override
    public void visit(Instruction.Const16 inst) {
        vm.setObjectToReg(inst.dest, hex2int(inst.value));
        vm.pc++;
    }

    @Override
    public void visit(Instruction.Const inst) {
        vm.setObjectToReg(inst.dest, hex2int(inst.value));
        vm.pc++;
    }

    @Override
    public void visit(Instruction.ConstHigh16 inst) {
        vm.setObjectToReg(inst.dest, hex2int(inst.value) << 16);
        vm.pc++;
    }

    @Override
    public void visit(Instruction.ConstWide16 inst) {
        vm.setObjectToReg(inst.dest, (long) hex2int(inst.value));
        vm.pc++;
    }

    @Override
    public void visit(Instruction.ConstWide32 inst) {
        vm.setObjectToReg(inst.dest, (long) hex2int(inst.value));
        vm.pc++;
    }

    @Override
    public void visit(Instruction.ConstWide inst) {
        vm.setObjectToReg(inst.dest, hex2long(inst.value));
        vm.pc++;
    }

    @Override
    public void visit(Instruction.ConstWideHigh16 inst) {
        vm.setObjectToReg(inst.dest, hex2long(inst.value) << 48);
        vm.pc++;
    }

    @Override
    public void visit(Instruction.ConstString inst) {
        vm.setObjectToReg(inst.dest, inst.str.substring(1, inst.str.length() - 1));
        vm.pc++;
    }

    @Override
    public void visit(Instruction.ConstStringJumbo inst) {
        vm.setObjectToReg(inst.dest, inst.str.substring(1, inst.str.length() - 1));
        vm.pc++;
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
        vm.setObjectToReg(inst.dest, ((Instance)vm.getObjectByReg(inst.ref)).isA(inst.type));
        vm.pc++;
	}

	@Override
	public void visit(Instruction.arrayLength inst) {
		vm.setObjectToReg(inst.dest, ((Array) vm.getObjectByReg(inst.src)).getLength());
		vm.pc++;
	}

	@Override
	public void visit(Instruction.NewInstance inst) {
        vm.setObjectToReg(inst.dest, new Instance(inst.type));
        vm.pc++;
	}

	@Override
	public void visit(Instruction.NewArray inst) {
		vm.setObjectToReg(inst.dest, new Array(inst.type, inst.size));
		vm.pc++;
	}

    @Override
    public void visit(Instruction.FilledNewArray inst) {
        assert inst.type.equals("[I");
        int dimensions[] = new int[inst.argList.size()];
        for(int i = 0; i < dimensions.length; i++){
            dimensions[i] = (Integer) vm.getObjectByReg(inst.argList.get(i));
        }
        vm.returnValue = dimensions;
        vm.pc++;
    }

    @Override
    public void visit(Instruction.FilledNewArrayRange inst) {
        assert inst.type.equals("[I");
        vm.returnValue = vm.getObjectsByRegRange(inst.start, inst.end);
        vm.pc++;
    }

	@Override
	public void visit(Instruction.FillArrayData inst) {
		((Array) vm.getObjectByReg(inst.dest)).fillArrayData(vm.getArrayPayload(inst.addr));
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
		Object test = vm.getObjectByReg(inst.test);
		Integer dest = switchMap.get((Integer) test);
		if (dest == null)
			Util.printErr("Can not find the switchMap");
		vm.pc = dest;
	}

	@Override
	public void visit(Instruction.SparseSwitch inst) {
		Map<Integer, Integer> switchMap = vm.getSwitchMap(inst.addr);
		Object test = vm.getObjectByReg(inst.test);
		Integer dest = switchMap.get((Integer) test);
		if (dest == null)
			Util.printErr("Can not find the switchMap");
		vm.pc = dest;
	}

    @Override
    public void visit(Instruction.CmplFloat inst) {
        Float val1 = (Float) vm.getObjectByReg(inst.first);
        Float val2 = (Float) vm.getObjectByReg(inst.second);
        if (val1.isNaN() || val2.isNaN()) {
            vm.setObjectToReg(inst.dest, -1);
        } else {
            int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
            vm.setObjectToReg(inst.dest, result);
        }
        vm.pc++;
    }

    @Override
    public void visit(Instruction.CmpgFloat inst) {
        Float val1 = (Float) vm.getObjectByReg(inst.first);
        Float val2 = (Float) vm.getObjectByReg(inst.second);
        if (val1.isNaN() || val2.isNaN()) {
            vm.setObjectToReg(inst.dest, 1);
        } else {
            int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
            vm.setObjectToReg(inst.dest, result);
        }
        vm.pc++;
    }

    @Override
    public void visit(Instruction.CmplDouble inst) {
        Double val1 = (Double) vm.getObjectByReg(inst.first);
        Double val2 = (Double) vm.getObjectByReg(inst.second);
        if (val1.isNaN() || val2.isNaN()) {
            vm.setObjectToReg(inst.dest, -1);
        } else {
            int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
            vm.setObjectToReg(inst.dest, result);
        }
        vm.pc++;
    }

    @Override
    public void visit(Instruction.Cmpgdouble inst) {
        Double val1 = (Double) vm.getObjectByReg(inst.first);
        Double val2 = (Double) vm.getObjectByReg(inst.second);
        if (val1.isNaN() || val2.isNaN()) {
            vm.setObjectToReg(inst.dest, 1);
        } else {
            int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
            vm.setObjectToReg(inst.dest, result);
        }
        vm.pc++;
    }

    @Override
    public void visit(Instruction.CmpLong inst) {
        Long val1 = (Long) vm.getObjectByReg(inst.first);
        Long val2 = (Long) vm.getObjectByReg(inst.second);
        int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
        vm.setObjectToReg(inst.dest, result);
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
    private void iftest(String op, String firstReg, String secondReg, int addr){
        Object val1 = vm.getObjectByReg(firstReg);
        Object val2 = vm.getObjectByReg(secondReg);
        vm.pc = intTest(val1, val2, op.substring(3, 5)) ? addr : vm.pc + 1;
    }

    private void iftestz(String op, String testReg, int addr){
        Object val1 = vm.getObjectByReg(testReg);
        Object val2 = 0;
        vm.pc = intTest(val1, val2, op.substring(3, 5)) ? addr : vm.pc + 1;
    }

	@Override
	public void visit(Instruction.IfEq inst) {
        iftest(inst.op, inst.first, inst.second, inst.addr);
	}

	@Override
	public void visit(Instruction.IfNe inst) {
        iftest(inst.op, inst.first, inst.second, inst.addr);
	}

	@Override
	public void visit(Instruction.IfLt inst) {
        iftest(inst.op, inst.first, inst.second, inst.addr);
	}

	@Override
	public void visit(Instruction.IfGe inst) {
        iftest(inst.op, inst.first, inst.second, inst.addr);
	}

	@Override
	public void visit(Instruction.IfGt inst) {
        iftest(inst.op, inst.first, inst.second, inst.addr);
	}

	@Override
	public void visit(Instruction.IfLe inst) {
        iftest(inst.op, inst.first, inst.second, inst.addr);
	}

	@Override
	public void visit(Instruction.IfEqz inst) {
        iftestz(inst.op, inst.test, inst.addr);
	}

	@Override
	public void visit(Instruction.IfNez inst) {
        iftestz(inst.op, inst.test, inst.addr);
	}

	@Override
	public void visit(Instruction.IfLtz inst) {
        iftestz(inst.op, inst.test, inst.addr);
	}

	@Override
	public void visit(Instruction.IfGez inst) {
        iftestz(inst.op, inst.test, inst.addr);
	}

	@Override
	public void visit(Instruction.IfGtz inst) {
        iftestz(inst.op, inst.test, inst.addr);
	}

	@Override
	public void visit(Instruction.IfLez inst) {
        iftestz(inst.op, inst.test, inst.addr);
	}

	private void aget(String dstReg, String arrReg, String index) {
		vm.setObjectToReg(dstReg, ((Array) vm.getObjectByReg(arrReg)).aget(index));
		vm.pc++;
	}

	private void aput(String srcReg, String arrReg, String index) {
		((Array) vm.getObjectByReg(arrReg)).aput(index, vm.getObjectByReg(srcReg));
		vm.pc++;
	}

	@Override
	public void visit(Instruction.Aget inst) {
		aget(inst.dest, inst.array, inst.index);
	}

	@Override
	public void visit(Instruction.AgetWide inst) {
		aget(inst.dest, inst.array, inst.index);
	}

	@Override
	public void visit(Instruction.AgetObject inst) {
		aget(inst.dest, inst.array, inst.index);
	}

	@Override
	public void visit(Instruction.AgetBoolean inst) {
		aget(inst.dest, inst.array, inst.index);
	}

	@Override
	public void visit(Instruction.AgetByte inst) {
		aget(inst.dest, inst.array, inst.index);
	}

	@Override
	public void visit(Instruction.AgetChar inst) {
		aget(inst.dest, inst.array, inst.index);
	}

	@Override
	public void visit(Instruction.AgetShort inst) {
		aget(inst.dest, inst.array, inst.index);
	}

	@Override
	public void visit(Instruction.Aput inst) {
		aput(inst.src, inst.array, inst.index);
	}

	@Override
	public void visit(Instruction.AputWide inst) {
		aput(inst.src, inst.array, inst.index);
	}

	@Override
	public void visit(Instruction.AputObject inst) {
		aput(inst.src, inst.array, inst.index);
	}

	@Override
	public void visit(Instruction.AputBoolean inst) {
		aput(inst.src, inst.array, inst.index);
	}

	@Override
	public void visit(Instruction.AputByte inst) {
		aput(inst.src, inst.array, inst.index);
	}

	@Override
	public void visit(Instruction.AputChar inst) {
		aput(inst.src, inst.array, inst.index);
	}

	@Override
	public void visit(Instruction.AputShort inst) {
		aput(inst.src, inst.array, inst.index);
	}

    private void iget(String dstReg, String objReg, String fieldName){
        vm.setObjectToReg(dstReg, ((Instance)vm.getObjectByReg(objReg)).iget(fieldName));
        vm.pc++;
    }

    private void iput(String srcReg, String objReg, String fieldName){
        ((Instance)vm.getObjectByReg(objReg)).iput(fieldName, vm.getObjectByReg(srcReg));
        vm.pc++;
    }

	@Override
	public void visit(Instruction.Iget inst) {
        iget(inst.dest, inst.field, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IgetWide inst) {
        iget(inst.dest, inst.field, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IgetOjbect inst) {
        iget(inst.dest, inst.field, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IgetBoolean inst) {
        iget(inst.dest, inst.field, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IgetByte inst) {
        iget(inst.dest, inst.field, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IgetChar inst) {
        iget(inst.dest, inst.field, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IgetShort inst) {
        iget(inst.dest, inst.field, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.Iput inst) {
        iput(inst.src, inst.field, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IputWide inst) {
        iput(inst.src, inst.field, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IputObject inst) {
        iput(inst.src, inst.field, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IputBoolean inst) {
        iput(inst.src, inst.field, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IputByte inst) {
        iput(inst.src, inst.field, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IputChar inst) {
        iput(inst.src, inst.field, inst.type.fieldName);
	}

	@Override
	public void visit(Instruction.IputShort inst) {
        iput(inst.src, inst.field, inst.type.fieldName);
	}

    private void sget(String dstReg, String fieldName){
        vm.setObjectToReg(dstReg, vm.staticFieldsArea.getStaticField(fieldName));
        vm.pc++;
    }

    private void sput(String srcReg, String fieldName){
        vm.staticFieldsArea.setStaticField(fieldName, vm.getObjectByReg(srcReg));
        vm.pc++;
    }

	@Override
	public void visit(Instruction.Sget inst) {
        sget(inst.dest, inst.type.toString());
	}

	@Override
	public void visit(Instruction.SgetWide inst) {
        sget(inst.dest, inst.type.toString());
	}

	@Override
	public void visit(Instruction.SgetObject inst) {
        sget(inst.dest, inst.type.toString());
	}

	@Override
	public void visit(Instruction.SgetBoolean inst) {
        sget(inst.dest, inst.type.toString());
	}

	@Override
	public void visit(Instruction.SgetByte inst) {
        sget(inst.dest, inst.type.toString());
	}

	@Override
	public void visit(Instruction.SgetChar inst) {
        sget(inst.dest, inst.type.toString());
	}

	@Override
	public void visit(Instruction.SgetShort inst) {
        sget(inst.dest, inst.type.toString());
	}

	@Override
	public void visit(Instruction.Sput inst) {
        sput(inst.src, inst.type.toString());
	}

	@Override
	public void visit(Instruction.SputWide inst) {
        sput(inst.src, inst.type.toString());
	}

	@Override
	public void visit(Instruction.SputObject inst) {
        sput(inst.src, inst.type.toString());
	}

	@Override
	public void visit(Instruction.SputBoolean inst) {
        sput(inst.src, inst.type.toString());
	}

	@Override
	public void visit(Instruction.SputByte inst) {
        sput(inst.src, inst.type.toString());
	}

	@Override
	public void visit(Instruction.SputChar inst) {
        sput(inst.src, inst.type.toString());
	}

	@Override
	public void visit(Instruction.SputShort inst) {
        sput(inst.src, inst.type.toString());
	}

	public Frame newFrame(ast.classs.MethodItem methodItem, List<String> argList) {
		Frame frame = new Frame();
		vm2.Method method = vm.methodArea.getMethod(methodItem);
		Object[] parameters = vm.getParameters(argList);
		frame.regs = new Object[method.registerCount];
		int pstart = method.registerCount - parameters.length;
        System.arraycopy(parameters, 0, frame.regs, pstart, parameters.length);
		return frame;
	}

	@Override
	public void visit(Instruction.InvokeVirtual inst) {
		vm.pushFrame(newFrame(inst.type, inst.argList));
	}

	@Override
	public void visit(Instruction.InvokeSuper inst) {
		//TODO
	}

	@Override
	public void visit(Instruction.InvokeDirect inst) {
		vm.pushFrame(newFrame(inst.type, inst.argList));
	}

	@Override
	public void visit(Instruction.InvokeStatic inst) {
        vm.pc++;
        vm.saveFrame(); // TODO FIX MY NAME
        vm.setExecuteEnv(vm.getMethod(inst.type.classType, inst.type.getMethodSign()), inst.argList);
	}

	@Override
	public void visit(Instruction.InvokeInterface inst) {
		//TODO
	}

	@Override
	public void visit(Instruction.InvokeVirtualRange inst) {
		vm.pushFrame(newFrame(inst.type, Util.getRegList(inst.start, inst.end)));
	}

	@Override
	public void visit(Instruction.InvokeSuperRange inst) {
		//TODO
	}

	@Override
	public void visit(Instruction.InvokeDirectRange inst) {
		vm.pushFrame(newFrame(inst.type, Util.getRegList(inst.start, inst.end)));
	}

	@Override
	public void visit(Instruction.InvokeStaticRange inst) {
		vm.pushFrame(newFrame(inst.type, Util.getRegList(inst.start, inst.end)));
	}

	@Override
	public void visit(Instruction.InvokeInterfaceRange inst) {
		//TODO
	}

    @Override
    public void visit(Instruction.NegInt inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, -(Integer) src);
        vm.pc++;
    }

    @Override
    public void visit(Instruction.NotInt inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ~(Integer) src);
        vm.pc++;
    }

    @Override
    public void visit(Instruction.NegLong inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, -(Long) src);
        vm.pc++;
    }

    @Override
    public void visit(Instruction.NotLong inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ~(Long) src);
        vm.pc++;
    }

    @Override
    public void visit(Instruction.NegFloat inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, -(Float) src);
        vm.pc++;
    }

    @Override
    public void visit(Instruction.NegDouble inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, -(Double) src);
        vm.pc++;
    }

    @Override
    public void visit(Instruction.IntToLong inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Integer) src).longValue());
        vm.pc++;
    }

    @Override
    public void visit(Instruction.IntToFloat inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Integer) src).floatValue());
        vm.pc++;
    }

    @Override
    public void visit(Instruction.IntToDouble inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Integer) src).doubleValue());
        vm.pc++;
    }

    @Override
    public void visit(Instruction.LongToInt inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Long) src).intValue());
        vm.pc++;
    }

    @Override
    public void visit(Instruction.LongToFloat inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Long) src).floatValue());
        vm.pc++;
    }

    @Override
    public void visit(Instruction.LongToDouble inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Long) src).doubleValue());
        vm.pc++;
    }

    @Override
    public void visit(Instruction.FloatToInt inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Float) src).intValue());
        vm.pc++;
    }

    @Override
    public void visit(Instruction.FloatToLong inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Float) src).longValue());
        vm.pc++;
    }

    @Override
    public void visit(Instruction.FloatToDouble inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Float) src).doubleValue());
        vm.pc++;
    }

    @Override
    public void visit(Instruction.DoubleToInt inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Double) src).intValue());
        vm.pc++;
    }

    @Override
    public void visit(Instruction.DoubleToLong inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Double) src).longValue());
        vm.pc++;
    }

    @Override
    public void visit(Instruction.DoubleToFloat inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Double) src).floatValue());
        vm.pc++;
    }

    @Override
    public void visit(Instruction.IntToByte inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Integer) src).byteValue());
        vm.pc++;
    }

    @Override
    public void visit(Instruction.IntToChar inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, (char) ((Integer) src).intValue()); // Right?
        vm.pc++;
    }

    @Override
    public void visit(Instruction.IntToShort inst) {
        Object src = vm.getObjectByReg(inst.src);
        vm.setObjectToReg(inst.dest, ((Integer) src).shortValue());
        vm.pc++;
    }

    private void biopLit(String dstReg, String srcReg, String literal, String op) {
        Object result = null;
        Integer src = (Integer) vm.getObjectByReg(srcReg);
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
        vm.setObjectToReg(dstReg, result);
        vm.pc++;
    }

    private void biop2addr(String firstReg, String secondReg, String op) {
        biop(firstReg, firstReg, secondReg, op.substring(0, op.indexOf("/")));
    }

    private void biop(String dstReg, String firstReg, String secondReg, String op) {
        Object result = null;

        switch (op.substring(op.indexOf("-") + 1)) {
            case "int":
                Integer int1 = (Integer) vm.getObjectByReg(firstReg);
                Integer int2 = (Integer) vm.getObjectByReg(secondReg);
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
                Long long1 = (Long) vm.getObjectByReg(firstReg);
                Long long2 = (Long) vm.getObjectByReg(secondReg);
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
                        result = long1 >> long2;
                        break;
                    default:
                        Util.printErr("biop..swith..long..op: unkown");
                        break;
                }
                break;
            case "float":
                Float float1 = (Float) vm.getObjectByReg(firstReg);
                Float float2 = (Float) vm.getObjectByReg(secondReg);
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
                Double double1 = (Double) vm.getObjectByReg(firstReg);
                Double double2 = (Double) vm.getObjectByReg(secondReg);
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
        vm.setObjectToReg(dstReg, result);
        vm.pc++;
    }

    @Override
    public void visit(Instruction.AddInt inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.SubInt inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.MulInt inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.DivInt inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.RemInt inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.AndInt inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.OrInt inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.XorInt inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.ShlInt inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.ShrInt inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.UshrInt inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.AddLong inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.SubLong inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.MulLong inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.DivLong inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.RemLong inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.AndLong inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.OrLong inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.XorLong inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.ShlLong inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.ShrLong inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.UshrLong inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.AddFloat inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.SubFloat inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.MulFloat inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.DivFloat inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.RemFloat inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.AddDouble inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.SubDouble inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.MulDouble inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.DivDouble inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.RemDouble inst) {
        biop(inst.dest, inst.first, inst.second, inst.op);
    }

    @Override
    public void visit(Instruction.AddInt2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.SubInt2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.MulInt2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.DivInt2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.RemInt2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.AndInt2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.OrInt2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.XorInt2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.ShlInt2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.ShrInt2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.UshrInt2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.AddLong2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.SubLong2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.MulLong2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.DivLong2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.RemLong2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.AndLong2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.OrLong2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.XorLong2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.ShlLong2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.ShrLong2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.UshrLong2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.AddFloat2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.SubFloat2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.MulFloat2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.DivFloat2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.RemFloat2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.AddDouble2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.SubDouble2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.MulDouble2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.DivDouble2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

    @Override
    public void visit(Instruction.RemDouble2Addr inst) {
        biop2addr(inst.dest, inst.src, inst.op);
    }

	@Override
	public void visit(Instruction.AddIntLit16 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.RsubInt inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.MulIntLit16 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.DivIntLit16 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.RemIntLit16 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.AndIntLit16 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.OrIntLit16 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.XorIntLit16 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.AddIntLit8 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.RsubIntLit8 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.MulIntLit8 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.DivIntLit8 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.RemIntLit8 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.AndIntLit8 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.OrIntLit8 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.XorIntLit8 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.ShlIntLit8 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.ShrIntLit8 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
	}

	@Override
	public void visit(Instruction.UshrIntLit8 inst) {
        biopLit(inst.dest, inst.src, inst.value, inst.op);
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
