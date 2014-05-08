package ast;

import ast.annotation.Annotation;
import ast.annotation.Annotation.ElementLiteral;
import ast.annotation.Annotation.SubAnnotation;
import ast.classs.Class;
import ast.classs.Class.Field;
import ast.classs.FieldItem;
import ast.classs.MethodItem;
import ast.method.Method;
import ast.method.Method.MethodPrototype;
import ast.program.Program;
import ast.stm.Instruction;
import ast.stm.Instruction.*;

import java.util.*;

public class Optimizer extends VisitorAdapter {

	/*
	 * what we have done
	 * 1. change the inst's register to an String that represent an precise index at method.statmes
	 * 2. optimize PackedSwitchDirective and SparseSwitchDirective
	 *    init it's switchMap according to it's case area
	 * 3. add "v" int field for ever instruction's register field
	 * 4. add accessFlag in ast.classs.Class, ast.classs.Class.Field, ast.method.Method
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

    public int getAccessFlag(List<String> accessList) {
        int accessFlag = 0;
        for(String str : accessList) {
            switch(str) {
                case "public" : accessFlag |= Const.PUBLIC; break;
                case "private" : accessFlag |= Const.PRIVATE; break;
                case "protected" : accessFlag |= Const.PROTECT; break;
                case "static" : accessFlag |= Const.STATIC; break;
                case "final" : accessFlag |= Const.FINAL; break;
                case "interface": accessFlag |= Const.INTERFACE; break;
                case "abstract" : accessFlag |= Const.ABSTRACT; break;
                case "constructor": accessFlag |= Const.CONSTRUCTOR; break;
                case "native": accessFlag |= Const.NATIVE; break;
                default : break;
            }
        }
        return accessFlag;
    }
    @Override
    public void visit(Class clazz) {
        clazz.accessFlag =  getAccessFlag(clazz.accessList);
        for(Field field : clazz.fieldList) {
           field.accessFlag =  getAccessFlag(field.accessList);
        }
        for(Method method : clazz.methods) {
//            System.out.println("Debug: " + method.getMethodSign());
            method.accessFlag =  getAccessFlag(method.accessList);
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
        if((method.accessFlag & Const.NATIVE) != 0)
            return ;
        if((method.accessFlag & Const.ABSTRACT) != 0)
            return ;
        initLabelMap(method);
        method.regCount = Integer.parseInt(method.registers_directive_count);
		this.pStart = method.regCount - 1;
		this.pStart -= method.prototype.argsType.size();
		for (int i = 0; i < method.accessList.size(); i++) {
			if (method.accessList.get(i).equals("static")) {
				this.pStart++; // no 'this'
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
        inst.val = Util.hex2int(inst.value);
	}

	@Override
	public void visit(Const16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.val = Util.hex2int(inst.value);
	}

	@Override
	public void visit(ast.stm.Instruction.Const inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.val = Util.hex2int(inst.value);
	}

	@Override
	public void visit(ConstHigh16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.val = Util.hex2int(inst.value);
	}

	@Override
	public void visit(ConstWide16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.val = Util.hex2int(inst.value);
	}

	@Override
	public void visit(ConstWide32 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.val = Util.hex2int(inst.value);
	}

	@Override
	public void visit(ConstWide inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.val = Util.hex2long(inst.value);
	}

	@Override
	public void visit(ConstWideHigh16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.val = Util.hex2int(inst.value);
	}

	@Override
	public void visit(ConstString inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.str =  inst.str.substring(1, inst.str.length() - 1);
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
        handleInvokeRange(inst.argvs, inst.start, inst.end);
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
        inst.vindex = simplifiedReg(inst.index);
    }

    @Override
    public void visit(AgetWide inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = simplifiedReg(inst.index);
    }

    @Override
    public void visit(AgetObject inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = simplifiedReg(inst.index);
    }

    @Override
    public void visit(AgetBoolean inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = simplifiedReg(inst.index);
    }

    @Override
    public void visit(AgetByte inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = simplifiedReg(inst.index);
    }

    @Override
    public void visit(AgetChar inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = simplifiedReg(inst.index);
    }

    @Override
    public void visit(AgetShort inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = simplifiedReg(inst.index);
    }

    @Override
    public void visit(Aput inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = simplifiedReg(inst.index);
    }

    @Override
    public void visit(AputWide inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = simplifiedReg(inst.index);
    }

    @Override
    public void visit(AputObject inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = simplifiedReg(inst.index);
    }

    @Override
    public void visit(AputBoolean inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = simplifiedReg(inst.index);
    }

    @Override
    public void visit(AputByte inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = simplifiedReg(inst.index);
    }

    @Override
    public void visit(AputChar inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = simplifiedReg(inst.index);
    }

    @Override
    public void visit(AputShort inst) {
        inst.vsrc = simplifiedReg(inst.src);
        inst.varray = simplifiedReg(inst.array);
        inst.vindex = simplifiedReg(inst.index);
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

    public void handleInvokeRange(int[] argvs, String startReg, String endReg) {
        int start = simplifiedReg(startReg);
        int end = simplifiedReg(endReg);
        int size = end - start +1;
        argvs =  new int[size];
        for(int i = 0; i < size; i++) {
            argvs[i] = start + i;
        }
    }
	@Override
	public void visit(InvokeVirtualRange inst) {
        handleInvokeRange(inst.argvs, inst.start, inst.end);
	}

	@Override
	public void visit(InvokeSuperRange inst) {
        handleInvokeRange(inst.argvs, inst.start, inst.end);
    }

	@Override
	public void visit(InvokeDirectRange inst) {
        handleInvokeRange(inst.argvs, inst.start, inst.end);
    }

	@Override
	public void visit(InvokeStaticRange inst) {
        handleInvokeRange(inst.argvs, inst.start, inst.end);
    }

	@Override
	public void visit(InvokeInterfaceRange inst) {
        handleInvokeRange(inst.argvs, inst.start, inst.end);
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
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(RsubInt inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(MulIntLit16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(DivIntLit16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(RemIntLit16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(AndIntLit16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(OrIntLit16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(XorIntLit16 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(AddIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(RsubIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(MulIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(DivIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(RemIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(AndIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(OrIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(XorIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(ShlIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(ShrIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(UshrIntLit8 inst) {
        inst.vdest = simplifiedReg(inst.dest);
        inst.vsrc = simplifiedReg(inst.src);
        inst.lit = Util.hex2int(inst.value);
	}

	@Override
	public void visit(PackedSwitchDirective inst) {
		Hashtable<Integer, Integer> switchMap = new Hashtable<>();
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
        Hashtable<Integer, Integer> switchMap = new Hashtable<>();
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
