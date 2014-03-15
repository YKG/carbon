package vm2;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import ast.annotation.Annotation;
import ast.annotation.Annotation.ElementLiteral;
import ast.annotation.Annotation.SubAnnotation;
import ast.classs.Class;
import ast.classs.FieldItem;
import ast.classs.MethodItem;
import ast.method.Method;
import ast.method.Method.MethodPrototype;
import ast.program.Program;
import ast.stm.*;
import ast.stm.Instruction.AddDouble;
import ast.stm.Instruction.AddDouble2Addr;
import ast.stm.Instruction.AddFloat;
import ast.stm.Instruction.AddFloat2Addr;
import ast.stm.Instruction.AddInt;
import ast.stm.Instruction.AddInt2Addr;
import ast.stm.Instruction.AddIntLit16;
import ast.stm.Instruction.AddIntLit8;
import ast.stm.Instruction.AddLong;
import ast.stm.Instruction.AddLong2Addr;
import ast.stm.Instruction.Aget;
import ast.stm.Instruction.AgetBoolean;
import ast.stm.Instruction.AgetByte;
import ast.stm.Instruction.AgetChar;
import ast.stm.Instruction.AgetObject;
import ast.stm.Instruction.AgetShort;
import ast.stm.Instruction.AgetWide;
import ast.stm.Instruction.AndInt;
import ast.stm.Instruction.AndInt2Addr;
import ast.stm.Instruction.AndIntLit16;
import ast.stm.Instruction.AndIntLit8;
import ast.stm.Instruction.AndLong;
import ast.stm.Instruction.AndLong2Addr;
import ast.stm.Instruction.Aput;
import ast.stm.Instruction.AputBoolean;
import ast.stm.Instruction.AputByte;
import ast.stm.Instruction.AputChar;
import ast.stm.Instruction.AputObject;
import ast.stm.Instruction.AputShort;
import ast.stm.Instruction.AputWide;
import ast.stm.Instruction.ArrayDataDirective;
import ast.stm.Instruction.CheckCast;
import ast.stm.Instruction.CmpLong;
import ast.stm.Instruction.CmpgFloat;
import ast.stm.Instruction.Cmpgdouble;
import ast.stm.Instruction.CmplDouble;
import ast.stm.Instruction.CmplFloat;
import ast.stm.Instruction.Const;
import ast.stm.Instruction.Const16;
import ast.stm.Instruction.Const4;
import ast.stm.Instruction.ConstClass;
import ast.stm.Instruction.ConstHigh16;
import ast.stm.Instruction.ConstString;
import ast.stm.Instruction.ConstStringJumbo;
import ast.stm.Instruction.ConstWide;
import ast.stm.Instruction.ConstWide16;
import ast.stm.Instruction.ConstWide32;
import ast.stm.Instruction.ConstWideHigh16;
import ast.stm.Instruction.DivDouble;
import ast.stm.Instruction.DivDouble2Addr;
import ast.stm.Instruction.DivFloat;
import ast.stm.Instruction.DivFloat2Addr;
import ast.stm.Instruction.DivInt;
import ast.stm.Instruction.DivInt2Addr;
import ast.stm.Instruction.DivIntLit16;
import ast.stm.Instruction.DivIntLit8;
import ast.stm.Instruction.DivLong;
import ast.stm.Instruction.DivLong2Addr;
import ast.stm.Instruction.DoubleToFloat;
import ast.stm.Instruction.DoubleToInt;
import ast.stm.Instruction.DoubleToLong;
import ast.stm.Instruction.FillArrayData;
import ast.stm.Instruction.FilledNewArray;
import ast.stm.Instruction.FilledNewArrayRange;
import ast.stm.Instruction.FloatToDouble;
import ast.stm.Instruction.FloatToInt;
import ast.stm.Instruction.FloatToLong;
import ast.stm.Instruction.Goto;
import ast.stm.Instruction.Goto16;
import ast.stm.Instruction.Goto32;
import ast.stm.Instruction.IfEq;
import ast.stm.Instruction.IfEqz;
import ast.stm.Instruction.IfGe;
import ast.stm.Instruction.IfGez;
import ast.stm.Instruction.IfGt;
import ast.stm.Instruction.IfGtz;
import ast.stm.Instruction.IfLe;
import ast.stm.Instruction.IfLez;
import ast.stm.Instruction.IfLt;
import ast.stm.Instruction.IfLtz;
import ast.stm.Instruction.IfNe;
import ast.stm.Instruction.IfNez;
import ast.stm.Instruction.Iget;
import ast.stm.Instruction.IgetBoolean;
import ast.stm.Instruction.IgetByte;
import ast.stm.Instruction.IgetChar;
import ast.stm.Instruction.IgetOjbect;
import ast.stm.Instruction.IgetShort;
import ast.stm.Instruction.IgetWide;
import ast.stm.Instruction.InstanceOf;
import ast.stm.Instruction.IntToByte;
import ast.stm.Instruction.IntToChar;
import ast.stm.Instruction.IntToDouble;
import ast.stm.Instruction.IntToFloat;
import ast.stm.Instruction.IntToLong;
import ast.stm.Instruction.IntToShort;
import ast.stm.Instruction.InvokeDirect;
import ast.stm.Instruction.InvokeDirectRange;
import ast.stm.Instruction.InvokeInterface;
import ast.stm.Instruction.InvokeInterfaceRange;
import ast.stm.Instruction.InvokeStatic;
import ast.stm.Instruction.InvokeStaticRange;
import ast.stm.Instruction.InvokeSuper;
import ast.stm.Instruction.InvokeSuperRange;
import ast.stm.Instruction.InvokeVirtual;
import ast.stm.Instruction.InvokeVirtualRange;
import ast.stm.Instruction.Iput;
import ast.stm.Instruction.IputBoolean;
import ast.stm.Instruction.IputByte;
import ast.stm.Instruction.IputChar;
import ast.stm.Instruction.IputObject;
import ast.stm.Instruction.IputShort;
import ast.stm.Instruction.IputWide;
import ast.stm.Instruction.LongToDouble;
import ast.stm.Instruction.LongToFloat;
import ast.stm.Instruction.LongToInt;
import ast.stm.Instruction.MonitorEnter;
import ast.stm.Instruction.MonitorExit;
import ast.stm.Instruction.Move;
import ast.stm.Instruction.Move16;
import ast.stm.Instruction.MoveException;
import ast.stm.Instruction.MoveFrom16;
import ast.stm.Instruction.MoveObject;
import ast.stm.Instruction.MoveObject16;
import ast.stm.Instruction.MoveObjectFrom16;
import ast.stm.Instruction.MoveResult;
import ast.stm.Instruction.MoveResultObject;
import ast.stm.Instruction.MoveResultWide;
import ast.stm.Instruction.MoveWide;
import ast.stm.Instruction.MoveWide16;
import ast.stm.Instruction.MoveWideFrom16;
import ast.stm.Instruction.MulDouble;
import ast.stm.Instruction.MulDouble2Addr;
import ast.stm.Instruction.MulFloat;
import ast.stm.Instruction.MulFloat2Addr;
import ast.stm.Instruction.MulInt;
import ast.stm.Instruction.MulInt2Addr;
import ast.stm.Instruction.MulIntLit16;
import ast.stm.Instruction.MulIntLit8;
import ast.stm.Instruction.MulLong;
import ast.stm.Instruction.MulLong2Addr;
import ast.stm.Instruction.NegDouble;
import ast.stm.Instruction.NegFloat;
import ast.stm.Instruction.NegInt;
import ast.stm.Instruction.NegLong;
import ast.stm.Instruction.NewArray;
import ast.stm.Instruction.NewInstance;
import ast.stm.Instruction.Nop;
import ast.stm.Instruction.NotInt;
import ast.stm.Instruction.NotLong;
import ast.stm.Instruction.OrInt;
import ast.stm.Instruction.OrInt2Addr;
import ast.stm.Instruction.OrIntLit16;
import ast.stm.Instruction.OrIntLit8;
import ast.stm.Instruction.OrLong;
import ast.stm.Instruction.OrLong2Addr;
import ast.stm.Instruction.PackedSwitch;
import ast.stm.Instruction.PackedSwitchDirective;
import ast.stm.Instruction.RemDouble;
import ast.stm.Instruction.RemDouble2Addr;
import ast.stm.Instruction.RemFloat;
import ast.stm.Instruction.RemFloat2Addr;
import ast.stm.Instruction.RemInt;
import ast.stm.Instruction.RemInt2Addr;
import ast.stm.Instruction.RemIntLit16;
import ast.stm.Instruction.RemIntLit8;
import ast.stm.Instruction.RemLong;
import ast.stm.Instruction.RemLong2Addr;
import ast.stm.Instruction.Return;
import ast.stm.Instruction.ReturnObject;
import ast.stm.Instruction.ReturnVoid;
import ast.stm.Instruction.ReturnWide;
import ast.stm.Instruction.RsubInt;
import ast.stm.Instruction.RsubIntLit8;
import ast.stm.Instruction.Sget;
import ast.stm.Instruction.SgetBoolean;
import ast.stm.Instruction.SgetByte;
import ast.stm.Instruction.SgetChar;
import ast.stm.Instruction.SgetObject;
import ast.stm.Instruction.SgetShort;
import ast.stm.Instruction.SgetWide;
import ast.stm.Instruction.ShlInt;
import ast.stm.Instruction.ShlInt2Addr;
import ast.stm.Instruction.ShlIntLit8;
import ast.stm.Instruction.ShlLong;
import ast.stm.Instruction.ShlLong2Addr;
import ast.stm.Instruction.ShrInt;
import ast.stm.Instruction.ShrInt2Addr;
import ast.stm.Instruction.ShrIntLit8;
import ast.stm.Instruction.ShrLong;
import ast.stm.Instruction.ShrLong2Addr;
import ast.stm.Instruction.SparseSwitch;
import ast.stm.Instruction.SparseSwitchDirective;
import ast.stm.Instruction.Sput;
import ast.stm.Instruction.SputBoolean;
import ast.stm.Instruction.SputByte;
import ast.stm.Instruction.SputChar;
import ast.stm.Instruction.SputObject;
import ast.stm.Instruction.SputShort;
import ast.stm.Instruction.SputWide;
import ast.stm.Instruction.SubDouble;
import ast.stm.Instruction.SubDouble2Addr;
import ast.stm.Instruction.SubFloat;
import ast.stm.Instruction.SubFloat2Addr;
import ast.stm.Instruction.SubInt;
import ast.stm.Instruction.SubInt2Addr;
import ast.stm.Instruction.SubLong;
import ast.stm.Instruction.SubLong2Addr;
import ast.stm.Instruction.Throw;
import ast.stm.Instruction.UshrInt;
import ast.stm.Instruction.UshrInt2Addr;
import ast.stm.Instruction.UshrIntLit8;
import ast.stm.Instruction.UshrLong;
import ast.stm.Instruction.UshrLong2Addr;
import ast.stm.Instruction.XorInt;
import ast.stm.Instruction.XorInt2Addr;
import ast.stm.Instruction.XorIntLit16;
import ast.stm.Instruction.XorIntLit8;
import ast.stm.Instruction.XorLong;
import ast.stm.Instruction.XorLong2Addr;
import ast.stm.Instruction.arrayLength;

public class Optimize implements ast.Visitor {

	/*
	 * what we have done
	 * 1. change the inst's register to an String that represent an precise index at method.statmes
	 * 2. optimize PackedSwitchDirective and SparseSwitchDirective
	 *    init it's switchMap according to it's case area
	 * 3. add "v" int field for ever instruction's register field
	 */
	public Map<String, Integer> labelMap;
	public static Map<String, Integer> instLen = ast.PrettyPrintVisitor.instLen;
	public int pStart;
	public int ip;

    @Override
    public void visit(MethodPrototype prototype) {
        // TODO Auto-generated method stub

    }

    @Override
    public void visit(Program program) {
        // TODO Auto-generated method stub

    }

    @Override
    public void visit(Class clazz) {
        for(Method method : clazz.methods) {
            labelMap = new HashMap<String, Integer>();
            method.accept(this);
        }
    }

	@Override
	public void visit(MethodItem item) {
		// TODO Auto-generated method stub

	}

	@Override
	public void visit(FieldItem item) {
		// TODO Auto-generated method stub

	}

	@Override
	public void visit(Method method) {
		initLabelMap(method);
		this.pStart = Integer.parseInt(method.registers_directive_count);
		this.pStart -= method.prototype.argsType.size();
		for (int i = 0; i < method.accessList.size(); i++) {
			if (method.accessList.get(i).equals("static")) {
				this.pStart--;
				break;
			}
		}
		this.ip = 0;
		for (ast.stm.T stm : method.statements) {
			stm.accept(this);
			this.ip++;
		}
	}

	public void printErr(Object obj) {
		System.err.println(obj);
		System.exit(-1);
	}

	public void initLabelMap(Method method) {
		List<ast.method.Method.Label> labelList = method.labelList;
		if (labelList.size() == 0)
			return;
		Collections.sort(labelList);
		int labelIndex = 0;
		int stmIndex = 0;
		ast.method.Method.Label currentLabel = labelList.get(labelIndex);
		int targetAddr = Integer.parseInt(currentLabel.add);
		int currentAddr = 0;
		List<ast.stm.T> insts = method.statements;
		String opCode;
		for (stmIndex = 0; stmIndex < insts.size(); stmIndex++) {
			ast.stm.T stm = insts.get(stmIndex);
			if (stm instanceof PackedSwitchDirective
					|| stm instanceof SparseSwitchDirective
					|| stm instanceof ArrayDataDirective) {
				break;
			}
			while (targetAddr == currentAddr && labelIndex < labelList.size()) {
				this.labelMap.put(currentLabel.lab, stmIndex);
				labelIndex++;
				if (labelIndex < labelList.size()) {
					currentLabel = labelList.get(labelIndex);
					targetAddr = Integer.parseInt(currentLabel.add);
				}
			}
			try {
				opCode = (String) stm.getClass().getField("op").get(stm);
				currentAddr += instLen.get(opCode);
			} catch (IllegalArgumentException | IllegalAccessException
					| NoSuchFieldException | SecurityException e) {
				e.printStackTrace();
			}
		}
		for (; stmIndex < insts.size(); stmIndex++) {
			ast.stm.T stm = insts.get(stmIndex);
			if (!(stm instanceof ast.stm.Instruction.Nop)) {
				if (labelIndex >= labelList.size())
					printErr("label mismatch in Optimize");

				this.labelMap.put(currentLabel.lab, stmIndex);
				labelIndex++;
				if (labelIndex < labelList.size()) {
					currentLabel = labelList.get(labelIndex);
					targetAddr = Integer.parseInt(currentLabel.add);
				}
			}
		}
	}

	public int simplifiedReg(String reg) {
        int result = Integer.parseInt(reg.substring(1));
		if (reg.charAt(0) == 'v')
            return result;
		return result + this.pStart;
	}

	@Override
	public void visit(Instruction instruction) {
		// TODO Auto-generated method stub

	}

	@Override
	public void visit(Nop inst) {
		// TODO Auto-generated method stub

	}

	@Override
	public void visit(Move inst) {
		inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MoveFrom16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(Move16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MoveWide inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MoveWideFrom16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MoveWide16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MoveObject inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MoveObjectFrom16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MoveObject16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MoveResult inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(MoveResultWide inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(MoveResultObject inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(MoveException inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(ReturnVoid inst) {
		// TODO Auto-generated method stub

	}

	@Override
	public void visit(Return inst) {
        inst.vret = simplifiedReg(inst.ret);
	}

	@Override
	public void visit(ReturnWide inst) {
        inst.vret = simplifiedReg(inst.ret);
	}

	@Override
	public void visit(ReturnObject inst) {
        inst.vret = simplifiedReg(inst.ret);
	}

	@Override
	public void visit(Const4 inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(Const16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(Const inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(ConstHigh16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(ConstWide16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(ConstWide32 inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(ConstWide inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(ConstWideHigh16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(ConstString inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.str =  inst.str.substring(1,inst.str.length()-1);
	}

	@Override
	public void visit(ConstStringJumbo inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(ConstClass inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(MonitorEnter inst) {
        inst.vref = simplifiedReg(inst.ref);
    }

	@Override
	public void visit(MonitorExit inst) {
        inst.vref = simplifiedReg(inst.ref);
	}

	@Override
	public void visit(CheckCast inst) {
        inst.vref = simplifiedReg(inst.ref);
	}

	@Override
	public void visit(InstanceOf inst) {
        inst.vref = simplifiedReg(inst.ref);
	}

	@Override
	public void visit(arrayLength inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(NewInstance inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(NewArray inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsize = simplifiedReg(inst.size);
	}

	@Override
	public void visit(FilledNewArray inst) {
        inst.argvs = new int[inst.argList.size()];
        for(int i=0; i<inst.argList.size(); i++) {
            inst.argvs[i] = simplifiedReg(inst.argList.get(i));
        }
	}

	@Override
	public void visit(FilledNewArrayRange inst) {
        inst.vstart = simplifiedReg(inst.start);
        inst.vend = simplifiedReg(inst.end);
	}

	@Override
	public void visit(FillArrayData inst) {
        inst.vdest = simplifiedReg(inst.dest);
		inst.addr = this.labelMap.get(inst.src);
	}

	@Override
	public void visit(Throw inst) {
        inst.vkind = simplifiedReg(inst.kind);
	}

	@Override
	public void visit(Goto inst) {
		inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(Goto16 inst) {
		inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(Goto32 inst) {
		inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(PackedSwitch inst) {
		inst.vtest = simplifiedReg(inst.test);
		inst.addr = this.labelMap.get(inst.offset);
	}

	@Override
	public void visit(SparseSwitch inst) {
        inst.vtest = simplifiedReg(inst.test);
		inst.addr = this.labelMap.get(inst.offset);
	}

	@Override
	public void visit(CmplFloat inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
	}

	@Override
	public void visit(CmpgFloat inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
	}

	@Override
	public void visit(CmplDouble inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
	}

	@Override
	public void visit(Cmpgdouble inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
	}

	@Override
	public void visit(CmpLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
	}

	@Override
	public void visit(IfEq inst) {
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
        inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(IfNe inst) {
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
		inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(IfLt inst) {
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
		inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(IfGe inst) {
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
		inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(IfGt inst) {
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
		inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(IfLe inst) {
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
		inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(IfEqz inst) {
        inst.vtest = simplifiedReg(inst.test);
        inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(IfNez inst) {
        inst.vtest = simplifiedReg(inst.test);
		inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(IfLtz inst) {
        inst.vtest = simplifiedReg(inst.test);
		inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(IfGez inst) {
        inst.vtest = simplifiedReg(inst.test);
		inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(IfGtz inst) {
        inst.vtest = simplifiedReg(inst.test);
		inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(IfLez inst) {
        inst.vtest = simplifiedReg(inst.test);
		inst.addr = this.labelMap.get(inst.dest);
	}

	@Override
	public void visit(Aget inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
	}

	@Override
	public void visit(AgetWide inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
    }

	@Override
	public void visit(AgetObject inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
    }

	@Override
	public void visit(AgetBoolean inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
    }

	@Override
	public void visit(AgetByte inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
    }

	@Override
	public void visit(AgetChar inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
    }

	@Override
	public void visit(AgetShort inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
    }

	@Override
	public void visit(Aput inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
    }

	@Override
	public void visit(AputWide inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
    }

	@Override
	public void visit(AputObject inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
    }

	@Override
	public void visit(AputBoolean inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
    }

	@Override
	public void visit(AputByte inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
    }

	@Override
	public void visit(AputChar inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
    }

	@Override
	public void visit(AputShort inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = this.labelMap.get(inst.index);
    }

	@Override
	public void visit(Iget inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfield = simplifiedReg(inst.field);
	}

	@Override
	public void visit(IgetWide inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfield = simplifiedReg(inst.field);
    }

	@Override
	public void visit(IgetOjbect inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfield = simplifiedReg(inst.field);
    }

	@Override
	public void visit(IgetBoolean inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfield = simplifiedReg(inst.field);
    }

	@Override
	public void visit(IgetByte inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfield = simplifiedReg(inst.field);
    }

	@Override
	public void visit(IgetChar inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfield = simplifiedReg(inst.field);
    }

	@Override
	public void visit(IgetShort inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfield = simplifiedReg(inst.field);
    }

	@Override
	public void visit(Iput inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.vfield = simplifiedReg(inst.field);
    }

	@Override
	public void visit(IputWide inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.vfield = simplifiedReg(inst.field);
    }

	@Override
	public void visit(IputObject inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.vfield = simplifiedReg(inst.field);
    }

	@Override
	public void visit(IputBoolean inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.vfield = simplifiedReg(inst.field);
    }

	@Override
	public void visit(IputByte inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.vfield = simplifiedReg(inst.field);
    }

	@Override
	public void visit(IputChar inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.vfield = simplifiedReg(inst.field);
    }

	@Override
	public void visit(IputShort inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.vfield = simplifiedReg(inst.field);
    }

	@Override
	public void visit(Sget inst) {
		inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(SgetWide inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(SgetObject inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(SgetBoolean inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(SgetByte inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(SgetChar inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(SgetShort inst) {
        inst.vdest = simplifiedReg(inst.dest);
	}

	@Override
	public void visit(Sput inst) {
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(SputWide inst) {
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(SputObject inst) {
        inst.vsrc = simplifiedReg(inst.src);

	}

	@Override
	public void visit(SputBoolean inst) {
        inst.vsrc = simplifiedReg(inst.src);

	}

	@Override
	public void visit(SputByte inst) {
        inst.vsrc = simplifiedReg(inst.src);

	}

	@Override
	public void visit(SputChar inst) {
        inst.vsrc = simplifiedReg(inst.src);

	}

	@Override
	public void visit(SputShort inst) {
        inst.vsrc = simplifiedReg(inst.src);

	}

	@Override
	public void visit(InvokeVirtual inst) {
        inst.argvs = new int[inst.argList.size()];
        for(int i=0; i<inst.argList.size(); i++) {
            inst.argvs[i] = simplifiedReg(inst.argList.get(i));
        }
	}

	@Override
	public void visit(InvokeSuper inst) {
        inst.argvs = new int[inst.argList.size()];
        for(int i=0; i<inst.argList.size(); i++) {
            inst.argvs[i] = simplifiedReg(inst.argList.get(i));
        }
	}

	@Override
	public void visit(InvokeDirect inst) {
        inst.argvs = new int[inst.argList.size()];
        for(int i=0; i<inst.argList.size(); i++) {
            inst.argvs[i] = simplifiedReg(inst.argList.get(i));
        }
	}

	@Override
	public void visit(InvokeStatic inst) {
        inst.argvs = new int[inst.argList.size()];
        for(int i=0; i<inst.argList.size(); i++) {
            inst.argvs[i] = simplifiedReg(inst.argList.get(i));
        }
	}

	@Override
	public void visit(InvokeInterface inst) {
        inst.argvs = new int[inst.argList.size()];
        for(int i=0; i<inst.argList.size(); i++) {
            inst.argvs[i] = simplifiedReg(inst.argList.get(i));
        }
	}

	@Override
	public void visit(InvokeVirtualRange inst) {
        inst.vstart = simplifiedReg(inst.start);
        inst.vend = simplifiedReg(inst.end);
	}

	@Override
	public void visit(InvokeSuperRange inst) {
        inst.vstart = simplifiedReg(inst.start);
        inst.vend = simplifiedReg(inst.end);
    }

	@Override
	public void visit(InvokeDirectRange inst) {
        inst.vstart = simplifiedReg(inst.start);
        inst.vend = simplifiedReg(inst.end);
    }

	@Override
	public void visit(InvokeStaticRange inst) {
        inst.vstart = simplifiedReg(inst.start);
        inst.vend = simplifiedReg(inst.end);
    }

	@Override
	public void visit(InvokeInterfaceRange inst) {
        inst.vstart = simplifiedReg(inst.start);
        inst.vend = simplifiedReg(inst.end);
    }

	@Override
	public void visit(NegInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(NotInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(NegLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(NotLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(NegFloat inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(NegDouble inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(IntToLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(IntToFloat inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(IntToDouble inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(LongToInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(LongToFloat inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(LongToDouble inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(FloatToInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(FloatToLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(FloatToDouble inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(DoubleToInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(DoubleToLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(DoubleToFloat inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(IntToByte inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(IntToChar inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(IntToShort inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
    }

	@Override
	public void visit(AddInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
	}

	@Override
	public void visit(SubInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
    }

	@Override
	public void visit(MulInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
    }

	@Override
	public void visit(DivInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
    }

	@Override
	public void visit(RemInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
    }

	@Override
	public void visit(AndInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
    }

	@Override
	public void visit(OrInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
    }

	@Override
	public void visit(XorInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);
    }

	@Override
	public void visit(ShlInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(ShrInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(UshrInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(AddLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(SubLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(MulLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(DivLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(RemLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(AndLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(OrLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(XorLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(ShlLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(ShrLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(UshrLong inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(AddFloat inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(SubFloat inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(MulFloat inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(DivFloat inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(RemFloat inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(AddDouble inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(SubDouble inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(MulDouble inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(DivDouble inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(RemDouble inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vfirst = simplifiedReg(inst.first);
        inst.vsecond = simplifiedReg(inst.second);

    }

	@Override
	public void visit(AddInt2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(SubInt2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MulInt2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(DivInt2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(RemInt2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(AndInt2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(OrInt2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(XorInt2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(ShlInt2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(ShrInt2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(UshrInt2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(AddLong2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(SubLong2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MulLong2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(DivLong2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(RemLong2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(AndLong2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(OrLong2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(XorLong2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(ShlLong2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(ShrLong2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(UshrLong2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(AddFloat2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(SubFloat2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MulFloat2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(DivFloat2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(RemFloat2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(AddDouble2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(SubDouble2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MulDouble2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(DivDouble2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(RemDouble2Addr inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(AddIntLit16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(RsubInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MulIntLit16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(DivIntLit16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(RemIntLit16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(AndIntLit16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(OrIntLit16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(XorIntLit16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(AddIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(RsubIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(MulIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(DivIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(RemIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(AndIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(OrIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(XorIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(ShlIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(ShrIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(UshrIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
	}

	@Override
	public void visit(PackedSwitchDirective inst) {
		Map<Integer, Integer> switchMap = new HashMap<Integer, Integer>();
		int firstKey = Util.hex2int(inst.key);
		for (int i = 0; i < inst.labList.size(); i++) {
			Integer key = new Integer(i + firstKey);
			Integer value = labelMap.get(inst.labList.get(i));
			switchMap.put(key,value);
		}
		inst.switchMap = switchMap;
	}

	@Override
	public void visit(SparseSwitchDirective inst) {
		Map<Integer, Integer> switchMap = new HashMap<Integer, Integer>();
		int size = inst.labList.size();
		for (int i = 0; i < size; i++) {
			int key = Util.hex2int(inst.keyList.get(i));
			Integer value = labelMap.get(inst.labList.get(i));
			switchMap.put(new Integer(key), value);
		}
		inst.switchMap = switchMap;
	}

	@Override
	public void visit(ArrayDataDirective arrayDataDirective) {
		// TODO Auto-generated method stub

	}

	@Override
	public void visit(Annotation annotation) {
		// TODO Auto-generated method stub

	}

	@Override
	public void visit(SubAnnotation subAnnotation) {
		// TODO Auto-generated method stub

	}

	@Override
	public void visit(ElementLiteral elementLiteral) {
		// TODO Auto-generated method stub

	}

}
