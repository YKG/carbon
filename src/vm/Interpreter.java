package vm;

import opt.Instruction;
import opt.Visitor;

import java.util.Map;

/**
 * Created by YKG on 14-4-8.
 */
public class Interpreter implements Visitor
{
  VMThread vmt;

  public Interpreter(VMThread vmthread)
  {
    this.vmt = vmthread;
  }

  @Override
  public void visit(Instruction.Nop inst)
  {
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.Move inst)
  {
    move(inst.dest, inst.src);
  }

  @Override
  public void visit(Instruction.MoveFrom16 inst)
  {
    move(inst.dest, inst.src);
  }

  @Override
  public void visit(Instruction.Move16 inst)
  {
    move(inst.dest, inst.src);
  }

  @Override
  public void visit(Instruction.MoveWide inst)
  {
    move(inst.dest, inst.src);
  }

  @Override
  public void visit(Instruction.MoveWideFrom16 inst)
  {
    move(inst.dest, inst.src);
  }

  @Override
  public void visit(Instruction.MoveWide16 inst)
  {
    move(inst.dest, inst.src);
  }

  @Override
  public void visit(Instruction.MoveObject inst)
  {
    move(inst.dest, inst.src);
  }

  @Override
  public void visit(Instruction.MoveObjectFrom16 inst)
  {
    move(inst.dest, inst.src);
  }

  @Override
  public void visit(Instruction.MoveObject16 inst)
  {
    move(inst.dest, inst.src);
  }

  @Override
  public void visit(Instruction.MoveResult inst)
  {
    moveResult(inst.dest);
  }

  @Override
  public void visit(Instruction.MoveResultWide inst)
  {
    moveResult(inst.dest);
  }

  @Override
  public void visit(Instruction.MoveResultObject inst)
  {
    moveResult(inst.dest);
  }

  @Override
  public void visit(Instruction.MoveException inst)
  {
    moveResult(inst.dest);
  }

  @Override
  public void visit(Instruction.ReturnVoid inst)
  {
    vmt.restoreThreadState();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.Return inst)
  {
    vmt.saveReturnValue(inst.ret);
    vmt.restoreThreadState();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.ReturnWide inst)
  {
    vmt.saveReturnValue(inst.ret);
    vmt.restoreThreadState();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.ReturnObject inst)
  {
    vmt.saveReturnValue(inst.ret);
    vmt.restoreThreadState();
    vmt.pc++;
  }

  private void _const(int dest, Object val)
  {
    vmt.currentFrame.reg[dest] = val;
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.Const4 inst)
  {
    _const(inst.dest, inst.value);
  }

  @Override
  public void visit(Instruction.Const16 inst)
  {
    _const(inst.dest, inst.value);
  }

  @Override
  public void visit(Instruction.Const inst)
  {
    _const(inst.dest, inst.value);
  }

  @Override
  public void visit(Instruction.ConstHigh16 inst)
  {
    _const(inst.dest, inst.value << 16);
  }

  @Override
  public void visit(Instruction.ConstWide16 inst)
  {
    _const(inst.dest, inst.value);
  }

  @Override
  public void visit(Instruction.ConstWide32 inst)
  {
    _const(inst.dest, inst.value);
  }

  @Override
  public void visit(Instruction.ConstWide inst)
  {
    _const(inst.dest, inst.value);
  }

  @Override
  public void visit(Instruction.ConstWideHigh16 inst)
  {
    _const(inst.dest, inst.value << 48);
  }

  @Override
  public void visit(Instruction.ConstString inst)
  {
    _const(inst.dest, inst.str);
  }

  @Override
  public void visit(Instruction.ConstStringJumbo inst)
  {
    _const(inst.dest, inst.str);
  }

  @Override
  public void visit(Instruction.ConstClass inst)
  {

  }

  @Override
  public void visit(Instruction.MonitorEnter inst)
  {

  }

  @Override
  public void visit(Instruction.MonitorExit inst)
  {

  }

  @Override
  public void visit(Instruction.CheckCast inst)
  {

  }

  @Override
  public void visit(Instruction.InstanceOf inst)
  {

  }

  @Override
  public void visit(Instruction.arrayLength inst)
  {

  }

  @Override
  public void visit(Instruction.NewInstance inst)
  {

  }

  @Override
  public void visit(Instruction.NewArray inst)
  {

  }

  @Override
  public void visit(Instruction.FilledNewArray inst)
  {

  }

  @Override
  public void visit(Instruction.FilledNewArrayRange inst)
  {

  }

  @Override
  public void visit(Instruction.FillArrayData inst)
  {

  }

  @Override
  public void visit(Instruction.Throw inst)
  {

  }

  @Override
  public void visit(Instruction.Goto inst)
  {
    vmt.pc = inst.addr;
  }

  @Override
  public void visit(Instruction.Goto16 inst)
  {
    vmt.pc = inst.addr;
  }

  @Override
  public void visit(Instruction.Goto32 inst)
  {
    vmt.pc = inst.addr;
  }

  @Override
  public void visit(Instruction.PackedSwitch inst)
  {
    Map<Integer, Integer> switchMap = vmt.getSwitchMap(inst.addr);
    Object test = vmt.currentFrame.reg[inst.test];
    Integer dest = switchMap.get((Integer) test);
    vmt.pc = dest == null ? vmt.pc + 1 : dest.intValue();
  }

  @Override
  public void visit(Instruction.SparseSwitch inst)
  {
    Map<Integer, Integer> switchMap = vmt.getSwitchMap(inst.addr);
    Object test = vmt.currentFrame.reg[inst.test];
    Integer dest = switchMap.get((Integer) test);
    vmt.pc = dest == null ? vmt.pc + 1 : dest.intValue();
  }

  @Override
  public void visit(Instruction.CmplFloat inst)
  {
    Float val1 = (Float) vmt.currentFrame.reg[inst.first];
    Float val2 = (Float) vmt.currentFrame.reg[inst.second];
    if (val1.isNaN() || val2.isNaN()) {
      vmt.currentFrame.reg[inst.dest] = -1;
    } else {
      int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
      vmt.currentFrame.reg[inst.dest] = result;
    }
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.CmpgFloat inst)
  {
    Float val1 = (Float) vmt.currentFrame.reg[inst.first];
    Float val2 = (Float) vmt.currentFrame.reg[inst.second];
    if (val1.isNaN() || val2.isNaN()) {
      vmt.currentFrame.reg[inst.dest] = 1;
    } else {
      int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
      vmt.currentFrame.reg[inst.dest] = result;
    }
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.CmplDouble inst)
  {
    Double val1 = (Double) vmt.currentFrame.reg[inst.first];
    Double val2 = (Double) vmt.currentFrame.reg[inst.second];
    if (val1.isNaN() || val2.isNaN()) {
      vmt.currentFrame.reg[inst.dest] = -1;
    } else {
      int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
      vmt.currentFrame.reg[inst.dest] = result;
    }
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.Cmpgdouble inst)
  {
    Double val1 = (Double) vmt.currentFrame.reg[inst.first];
    Double val2 = (Double) vmt.currentFrame.reg[inst.second];
    if (val1.isNaN() || val2.isNaN()) {
      vmt.currentFrame.reg[inst.dest] = 1;
    } else {
      int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
      vmt.currentFrame.reg[inst.dest] = result;
    }
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.CmpLong inst)
  {
    Long val1 = (Long) vmt.currentFrame.reg[inst.first];
    Long val2 = (Long) vmt.currentFrame.reg[inst.second];
    int result = val1.equals(val2) ? 0 : val1 > val2 ? 1 : -1;
    vmt.currentFrame.reg[inst.dest] = result;
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.IfEq inst)
  {
    iftest(inst.op, inst.first, inst.second, inst.addr);
  }

  @Override
  public void visit(Instruction.IfNe inst)
  {
    iftest(inst.op, inst.first, inst.second, inst.addr);
  }

  @Override
  public void visit(Instruction.IfLt inst)
  {
    iftest(inst.op, inst.first, inst.second, inst.addr);
  }

  @Override
  public void visit(Instruction.IfGe inst)
  {
    iftest(inst.op, inst.first, inst.second, inst.addr);
  }

  @Override
  public void visit(Instruction.IfGt inst)
  {
    iftest(inst.op, inst.first, inst.second, inst.addr);
  }

  @Override
  public void visit(Instruction.IfLe inst)
  {
    iftest(inst.op, inst.first, inst.second, inst.addr);
  }

  @Override
  public void visit(Instruction.IfEqz inst)
  {
    iftestz(inst.op, inst.test, inst.addr);
  }

  @Override
  public void visit(Instruction.IfNez inst)
  {
    iftestz(inst.op, inst.test, inst.addr);
  }

  @Override
  public void visit(Instruction.IfLtz inst)
  {
    iftestz(inst.op, inst.test, inst.addr);
  }

  @Override
  public void visit(Instruction.IfGez inst)
  {
    iftestz(inst.op, inst.test, inst.addr);
  }

  @Override
  public void visit(Instruction.IfGtz inst)
  {
    iftestz(inst.op, inst.test, inst.addr);
  }

  @Override
  public void visit(Instruction.IfLez inst)
  {
    iftestz(inst.op, inst.test, inst.addr);
  }

  @Override
  public void visit(Instruction.Aget inst)
  {
    aget(inst.dest, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.AgetWide inst)
  {
    aget(inst.dest, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.AgetObject inst)
  {
    aget(inst.dest, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.AgetBoolean inst)
  {
    aget(inst.dest, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.AgetByte inst)
  {
    aget(inst.dest, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.AgetChar inst)
  {
    aget(inst.dest, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.AgetShort inst)
  {
    aget(inst.dest, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.Aput inst)
  {
    aput(inst.src, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.AputWide inst)
  {
    aput(inst.src, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.AputObject inst)
  {
    aput(inst.src, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.AputBoolean inst)
  {
    aput(inst.src, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.AputByte inst)
  {
    aput(inst.src, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.AputChar inst)
  {
    aput(inst.src, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.AputShort inst)
  {
    aput(inst.src, inst.varray, inst.index);
  }

  @Override
  public void visit(Instruction.Iget inst)
  {
    iget(inst.dest, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.IgetWide inst)
  {
    iget(inst.dest, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.IgetOjbect inst)
  {
    iget(inst.dest, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.IgetBoolean inst)
  {
    iget(inst.dest, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.IgetByte inst)
  {
    iget(inst.dest, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.IgetChar inst)
  {
    iget(inst.dest, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.IgetShort inst)
  {
    iget(inst.dest, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.Iput inst)
  {
    iput(inst.src, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.IputWide inst)
  {
    iput(inst.src, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.IputObject inst)
  {
    iput(inst.src, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.IputBoolean inst)
  {
    iput(inst.src, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.IputByte inst)
  {
    iput(inst.src, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.IputChar inst)
  {
    iput(inst.src, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.IputShort inst)
  {
    iput(inst.src, inst.obj, inst.fieldName);
  }

  @Override
  public void visit(Instruction.Sget inst)
  {
    sget(inst.dest, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.SgetWide inst)
  {
    sget(inst.dest, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.SgetObject inst)
  {
    sget(inst.dest, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.SgetBoolean inst)
  {
    sget(inst.dest, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.SgetByte inst)
  {
    sget(inst.dest, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.SgetChar inst)
  {
    sget(inst.dest, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.SgetShort inst)
  {
    sget(inst.dest, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.Sput inst)
  {
    sput(inst.src, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.SputWide inst)
  {
    sput(inst.src, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.SputObject inst)
  {
    sput(inst.src, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.SputBoolean inst)
  {
    sput(inst.src, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.SputByte inst)
  {
    sput(inst.src, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.SputChar inst)
  {
    sput(inst.src, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.SputShort inst)
  {
    sput(inst.src, inst.longFieldName);
  }

  @Override
  public void visit(Instruction.InvokeVirtual inst)
  {

  }

  @Override
  public void visit(Instruction.InvokeSuper inst)
  {

  }

  @Override
  public void visit(Instruction.InvokeDirect inst)
  {

  }

  @Override
  public void visit(Instruction.InvokeStatic inst)
  {

  }

  @Override
  public void visit(Instruction.InvokeInterface inst)
  {
    vmt.saveThreadState();
    String objType = ((Instance) vmt.currentFrame.reg[inst.vargvs[0]]).clazzName;
    vmt.setExecuteEnv(objType,
        vmt.getMethod(objType, inst.type.getMethodSign()), inst.vargvs);
  }

  @Override
  public void visit(Instruction.InvokeVirtualRange inst)
  {
    vmt.saveThreadState();
    String objType = ((Instance) vmt.currentFrame.reg[inst.vargvs[0]]).clazzName;
    vmt.setExecuteEnv(objType,
        vmt.getMethod(objType, inst.type.getMethodSign()), inst.vargvs);
  }

  @Override
  public void visit(Instruction.InvokeSuperRange inst)
  {
    vmt.saveThreadState();
    String superType = ((Instance) vmt.currentFrame.reg[inst.vargvs[0]])
        .getSuperClazz();
    vmt.setExecuteEnv(superType,
        vmt.getMethod(superType, inst.type.getMethodSign()), inst.vargvs);
  }

  @Override
  public void visit(Instruction.InvokeDirectRange inst)
  {
    vmt.saveThreadState();
    String clazzName = inst.type.classType;
    vmt.setExecuteEnv(clazzName,
        vmt.getMethod(clazzName, inst.type.getMethodSign()), inst.vargvs);
  }

  @Override
  public void visit(Instruction.InvokeStaticRange inst)
  {
    vmt.saveThreadState();
    String clazzName = inst.type.classType;
    vmt.setExecuteEnv(clazzName,
        vmt.getMethod(clazzName, inst.type.getMethodSign()), inst.vargvs);
  }

  @Override
  public void visit(Instruction.InvokeInterfaceRange inst)
  {
    vmt.saveThreadState();
    String objType = ((Instance) vmt.currentFrame.reg[inst.vargvs[0]]).clazzName;
    vmt.setExecuteEnv(objType,
        vmt.getMethod(objType, inst.type.getMethodSign()), inst.vargvs);
  }

  @Override
  public void visit(Instruction.NegInt inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = -(Integer) src;
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.NotInt inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ~(Integer) src;
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.NegLong inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = -(Long) src;
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.NotLong inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ~(Long) src;
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.NegFloat inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = -(Float) src;
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.NegDouble inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = -(Double) src;
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.IntToLong inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Integer) src).longValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.IntToFloat inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Integer) src).floatValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.IntToDouble inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Integer) src).doubleValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.LongToInt inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Long) src).intValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.LongToFloat inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Long) src).floatValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.LongToDouble inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Long) src).doubleValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.FloatToInt inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Float) src).intValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.FloatToLong inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Float) src).longValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.FloatToDouble inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Float) src).doubleValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.DoubleToInt inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Double) src).intValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.DoubleToLong inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Double) src).longValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.DoubleToFloat inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Double) src).floatValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.IntToByte inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Integer) src).byteValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.IntToChar inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = (char) ((Integer) src).intValue(); // Right?
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.IntToShort inst)
  {
    Object src = vmt.currentFrame.reg[inst.src];
    vmt.currentFrame.reg[inst.dest] = ((Integer) src).shortValue();
    vmt.pc++;
  }

  @Override
  public void visit(Instruction.AddInt inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.SubInt inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.MulInt inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.DivInt inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.RemInt inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.AndInt inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.OrInt inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.XorInt inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.ShlInt inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.ShrInt inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.UshrInt inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.AddLong inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.SubLong inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.MulLong inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.DivLong inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.RemLong inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.AndLong inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.OrLong inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.XorLong inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.ShlLong inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.ShrLong inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.UshrLong inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.AddFloat inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.SubFloat inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.MulFloat inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.DivFloat inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.RemFloat inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.AddDouble inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.SubDouble inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.MulDouble inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.DivDouble inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.RemDouble inst)
  {
    biop(inst.dest, inst.first, inst.second, inst.op);
  }

  @Override
  public void visit(Instruction.AddInt2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.SubInt2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.MulInt2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.DivInt2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.RemInt2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.AndInt2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.OrInt2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.XorInt2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.ShlInt2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.ShrInt2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.UshrInt2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.AddLong2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.SubLong2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.MulLong2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.DivLong2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.RemLong2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.AndLong2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.OrLong2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.XorLong2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.ShlLong2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.ShrLong2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.UshrLong2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.AddFloat2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.SubFloat2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.MulFloat2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.DivFloat2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.RemFloat2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.AddDouble2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.SubDouble2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.MulDouble2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.DivDouble2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.RemDouble2Addr inst)
  {
    biop2addr(inst.dest, inst.src, inst.op);
  }

  @Override
  public void visit(Instruction.AddIntLit16 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.RsubInt inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.MulIntLit16 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.DivIntLit16 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.RemIntLit16 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.AndIntLit16 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.OrIntLit16 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.XorIntLit16 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.AddIntLit8 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.RsubIntLit8 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.MulIntLit8 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.DivIntLit8 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.RemIntLit8 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.AndIntLit8 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.OrIntLit8 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.XorIntLit8 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.ShlIntLit8 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.ShrIntLit8 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  @Override
  public void visit(Instruction.UshrIntLit8 inst)
  {
    biopLit(inst.dest, inst.src, inst.lit, inst.op);
  }

  private void biopLit(int dstReg, int srcReg, int literal, String op)
  {
    Object result = null;
    Integer src = (Integer) vmt.currentFrame.reg[srcReg];
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
      Util.printErr("biopLit..swith..op.sub: unkown");
      break;
    }
    vmt.currentFrame.reg[dstReg] = result;
    vmt.pc++;
  }

  private void biop2addr(int firstReg, int secondReg, String op)
  {
    biop(firstReg, firstReg, secondReg, op.substring(0, op.indexOf("/")));
  }

  private void biop(int dstReg, int firstReg, int secondReg, String op)
  {
    Object result = null;

    switch (op.substring(op.indexOf("-") + 1)) {
    case "int":
      Integer int1 = (Integer) vmt.currentFrame.reg[firstReg];
      Integer int2 = (Integer) vmt.currentFrame.reg[secondReg];
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
      Long long1 = (Long) vmt.currentFrame.reg[firstReg];
      Long long2 = (Long) vmt.currentFrame.reg[secondReg];
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
      Float float1 = (Float) vmt.currentFrame.reg[firstReg];
      Float float2 = (Float) vmt.currentFrame.reg[secondReg];
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
      Double double1 = (Double) vmt.currentFrame.reg[firstReg];
      Double double2 = (Double) vmt.currentFrame.reg[secondReg];
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
    vmt.currentFrame.reg[dstReg] = result;
    vmt.pc++;
  }

  private void move(int dest, int src)
  {
    vm.reg[dest] = vm.reg[src];
    vm.pc++;
  }

  private void moveResult(int dest)
  {
    vm.reg[dest] = vm.returnValue;
    vm.pc++;
  }

  /**
   * refer to:
   * androguard-060441150eba/specs/dalvik/opcodes/opcode-32-if-test.html
   */
  private void iftest(String opFull, int firstReg, int secondReg, int addr)
  {
    String op = opFull.substring(3, 5); // e.g. if-eq --> eq / if-ge --> ge
    Object val1 = vm.reg[firstReg];
    Object val2 = vm.reg[secondReg];
    vm.pc = intTest(val1, val2, op) ? addr : vm.pc + 1;
  }

  private void iftestz(String opFull, int testReg, int addr)
  {
    String op = opFull.substring(3, 5); // e.g. if-eqz --> eq / if-gez --> ge
    Object val1 = vm.reg[testReg];
    Object val2 = 0;
    vm.pc = intTest(val1, val2, op) ? addr : vm.pc + 1;
  }

  private void iget(int dstReg, int objReg, String fieldName)
  {
    vm.reg[dstReg] = ((Instance) vm.reg[objReg]).get(fieldName);
    vm.pc++;
  }

  private void iput(int srcReg, int objReg, String fieldName)
  {
    ((Instance) vm.reg[objReg]).set(fieldName, vm.reg[srcReg]);
    vm.pc++;
  }

  /**
   * I checked that the "Class" part of "Class->fieldName" must be the field's
   * defining class, that is say "Class" will not be the parent class of the
   * field's defining class.
   */
  private void sget(int dstReg, String longFieldName)
  {
    // TODO FIXME
  }

  private void sput(int srcReg, String fieldItem)
  {
    vm.staticFieldsArea.setStaticField(fieldItem, vm.reg[srcReg]);
    vm.pc++;
  }
}
