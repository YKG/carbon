package ast;

import ast.classs.FieldItem;
import ast.classs.MethodItem;
import ast.method.Method;
import ast.program.Program;
import ast.stm.Instruction;

public class Translator extends VisitorAdapter{
    public Object result;

    @Override
    public void visit(MethodItem item) {

    }

    @Override
    public void visit(FieldItem item) {

    }

    @Override
    public void visit(Method method) {

    }

    @Override
    public void visit(Method.MethodPrototype prototype) {

    }

    @Override
    public void visit(Program program) {

    }

    @Override
    public void visit(ast.classs.Class clazz) {

    }

    @Override
    public void visit(Instruction instruction) {

    }

    @Override
    public void visit(Instruction.Nop inst) {

    }

    @Override
    public void visit(Instruction.Move inst) {

    }

    @Override
    public void visit(Instruction.MoveFrom16 inst) {

    }

    @Override
    public void visit(Instruction.Move16 inst) {

    }

    @Override
    public void visit(Instruction.MoveWide inst) {

    }

    @Override
    public void visit(Instruction.MoveWideFrom16 inst) {

    }

    @Override
    public void visit(Instruction.MoveWide16 inst) {

    }

    @Override
    public void visit(Instruction.MoveObject inst) {

    }

    @Override
    public void visit(Instruction.MoveObjectFrom16 inst) {

    }

    @Override
    public void visit(Instruction.MoveObject16 inst) {

    }

    @Override
    public void visit(Instruction.MoveResult inst) {

    }

    @Override
    public void visit(Instruction.MoveResultWide inst) {

    }

    @Override
    public void visit(Instruction.MoveResultObject inst) {

    }

    @Override
    public void visit(Instruction.MoveException inst) {

    }

    @Override
    public void visit(Instruction.ReturnVoid inst) {

    }

    @Override
    public void visit(Instruction.Return inst) {

    }

    @Override
    public void visit(Instruction.ReturnWide inst) {

    }

    @Override
    public void visit(Instruction.ReturnObject inst) {

    }

    @Override
    public void visit(Instruction.Const4 inst) {

    }

    @Override
    public void visit(Instruction.Const16 inst) {

    }

    @Override
    public void visit(Instruction.Const inst) {

    }

    @Override
    public void visit(Instruction.ConstHigh16 inst) {

    }

    @Override
    public void visit(Instruction.ConstWide16 inst) {

    }

    @Override
    public void visit(Instruction.ConstWide32 inst) {

    }

    @Override
    public void visit(Instruction.ConstWide inst) {

    }

    @Override
    public void visit(Instruction.ConstWideHigh16 inst) {

    }

    @Override
    public void visit(Instruction.ConstString inst) {

    }

    @Override
    public void visit(Instruction.ConstStringJumbo inst) {

    }

    @Override
    public void visit(Instruction.ConstClass inst) {

    }

    @Override
    public void visit(Instruction.MonitorEnter inst) {

    }

    @Override
    public void visit(Instruction.MonitorExit inst) {

    }

    @Override
    public void visit(Instruction.CheckCast inst) {

    }

    @Override
    public void visit(Instruction.InstanceOf inst) {

    }

    @Override
    public void visit(Instruction.arrayLength inst) {

    }

    @Override
    public void visit(Instruction.NewInstance inst) {

    }

    @Override
    public void visit(Instruction.NewArray inst) {

    }

    @Override
    public void visit(Instruction.FilledNewArray inst) {

    }

    @Override
    public void visit(Instruction.FilledNewArrayRange inst) {

    }

    @Override
    public void visit(Instruction.FillArrayData inst) {

    }

    @Override
    public void visit(Instruction.Throw inst) {

    }

    @Override
    public void visit(Instruction.Goto inst) {

    }

    @Override
    public void visit(Instruction.Goto16 inst) {

    }

    @Override
    public void visit(Instruction.Goto32 inst) {

    }

    @Override
    public void visit(Instruction.PackedSwitch inst) {

    }

    @Override
    public void visit(Instruction.SparseSwitch inst) {

    }

    @Override
    public void visit(Instruction.CmplFloat inst) {

    }

    @Override
    public void visit(Instruction.CmpgFloat inst) {

    }

    @Override
    public void visit(Instruction.CmplDouble inst) {

    }

    @Override
    public void visit(Instruction.Cmpgdouble inst) {

    }

    @Override
    public void visit(Instruction.CmpLong inst) {

    }

    @Override
    public void visit(Instruction.IfEq inst) {

    }

    @Override
    public void visit(Instruction.IfNe inst) {

    }

    @Override
    public void visit(Instruction.IfLt inst) {

    }

    @Override
    public void visit(Instruction.IfGe inst) {

    }

    @Override
    public void visit(Instruction.IfGt inst) {

    }

    @Override
    public void visit(Instruction.IfLe inst) {

    }

    @Override
    public void visit(Instruction.IfEqz inst) {

    }

    @Override
    public void visit(Instruction.IfNez inst) {

    }

    @Override
    public void visit(Instruction.IfLtz inst) {

    }

    @Override
    public void visit(Instruction.IfGez inst) {

    }

    @Override
    public void visit(Instruction.IfGtz inst) {

    }

    @Override
    public void visit(Instruction.IfLez inst) {

    }

    @Override
    public void visit(Instruction.Aget inst) {

    }

    @Override
    public void visit(Instruction.AgetWide inst) {

    }

    @Override
    public void visit(Instruction.AgetObject inst) {

    }

    @Override
    public void visit(Instruction.AgetBoolean inst) {

    }

    @Override
    public void visit(Instruction.AgetByte inst) {

    }

    @Override
    public void visit(Instruction.AgetChar inst) {

    }

    @Override
    public void visit(Instruction.AgetShort inst) {

    }

    @Override
    public void visit(Instruction.Aput inst) {

    }

    @Override
    public void visit(Instruction.AputWide inst) {

    }

    @Override
    public void visit(Instruction.AputObject inst) {

    }

    @Override
    public void visit(Instruction.AputBoolean inst) {

    }

    @Override
    public void visit(Instruction.AputByte inst) {

    }

    @Override
    public void visit(Instruction.AputChar inst) {

    }

    @Override
    public void visit(Instruction.AputShort inst) {

    }

    @Override
    public void visit(Instruction.Iget inst) {

    }

    @Override
    public void visit(Instruction.IgetWide inst) {

    }

    @Override
    public void visit(Instruction.IgetOjbect inst) {

    }

    @Override
    public void visit(Instruction.IgetBoolean inst) {

    }

    @Override
    public void visit(Instruction.IgetByte inst) {

    }

    @Override
    public void visit(Instruction.IgetChar inst) {

    }

    @Override
    public void visit(Instruction.IgetShort inst) {

    }

    @Override
    public void visit(Instruction.Iput inst) {

    }

    @Override
    public void visit(Instruction.IputWide inst) {

    }

    @Override
    public void visit(Instruction.IputObject inst) {

    }

    @Override
    public void visit(Instruction.IputBoolean inst) {

    }

    @Override
    public void visit(Instruction.IputByte inst) {

    }

    @Override
    public void visit(Instruction.IputChar inst) {

    }

    @Override
    public void visit(Instruction.IputShort inst) {

    }

    @Override
    public void visit(Instruction.Sget inst) {

    }

    @Override
    public void visit(Instruction.SgetWide inst) {

    }

    @Override
    public void visit(Instruction.SgetObject inst) {

    }

    @Override
    public void visit(Instruction.SgetBoolean inst) {

    }

    @Override
    public void visit(Instruction.SgetByte inst) {

    }

    @Override
    public void visit(Instruction.SgetChar inst) {

    }

    @Override
    public void visit(Instruction.SgetShort inst) {

    }

    @Override
    public void visit(Instruction.Sput inst) {

    }

    @Override
    public void visit(Instruction.SputWide inst) {

    }

    @Override
    public void visit(Instruction.SputObject inst) {

    }

    @Override
    public void visit(Instruction.SputBoolean inst) {

    }

    @Override
    public void visit(Instruction.SputByte inst) {

    }

    @Override
    public void visit(Instruction.SputChar inst) {

    }

    @Override
    public void visit(Instruction.SputShort inst) {

    }

    @Override
    public void visit(Instruction.InvokeVirtual inst) {

    }

    @Override
    public void visit(Instruction.InvokeSuper inst) {

    }

    @Override
    public void visit(Instruction.InvokeDirect inst) {

    }

    @Override
    public void visit(Instruction.InvokeStatic inst) {

    }

    @Override
    public void visit(Instruction.InvokeInterface inst) {

    }

    @Override
    public void visit(Instruction.InvokeVirtualRange inst) {

    }

    @Override
    public void visit(Instruction.InvokeSuperRange inst) {

    }

    @Override
    public void visit(Instruction.InvokeDirectRange inst) {

    }

    @Override
    public void visit(Instruction.InvokeStaticRange inst) {

    }

    @Override
    public void visit(Instruction.InvokeInterfaceRange inst) {

    }

    @Override
    public void visit(Instruction.NegInt inst) {
        result = new opt.Instruction.NegInt(inst.vdest, inst.vsrc);
    }

    @Override
    public void visit(Instruction.NotInt inst) {
        result = new opt.Instruction.NotInt(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.NegLong inst) {
        result = new opt.Instruction.NegLong(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.NotLong inst) {
        result = new opt.Instruction.NotLong(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.NegFloat inst) {
        result = new opt.Instruction.NegFloat(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.NegDouble inst) {
        result = new opt.Instruction.NegDouble(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.IntToLong inst) {
        result = new opt.Instruction.IntToLong(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.IntToFloat inst) {
        result = new opt.Instruction.IntToFloat(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.IntToDouble inst) {
        result = new opt.Instruction.IntToDouble(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.LongToInt inst) {
        result = new opt.Instruction.LongToInt(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.LongToFloat inst) {
        result = new opt.Instruction.LongToFloat(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.LongToDouble inst) {
        result = new opt.Instruction.LongToDouble(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.FloatToInt inst) {
        result = new opt.Instruction.FloatToInt(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.FloatToLong inst) {
        result = new opt.Instruction.FloatToLong(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.FloatToDouble inst) {
        result = new opt.Instruction.FloatToDouble(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.DoubleToInt inst) {
        result = new opt.Instruction.DoubleToInt(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.DoubleToLong inst) {
        result = new opt.Instruction.DoubleToLong(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.DoubleToFloat inst) {
        result = new opt.Instruction.DoubleToFloat(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.IntToByte inst) {
        result = new opt.Instruction.IntToByte(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.IntToChar inst) {
        result = new opt.Instruction.IntToChar(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.IntToShort inst) {
        result = new opt.Instruction.IntToShort(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.AddInt inst) {
        result = new opt.Instruction.AddInt(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.SubInt inst) {
        result = new opt.Instruction.SubInt(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.MulInt inst) {
        result = new opt.Instruction.MulInt(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.DivInt inst) {
        result = new opt.Instruction.DivInt(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.RemInt inst) {
        result = new opt.Instruction.RemInt(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.AndInt inst) {
        result = new opt.Instruction.AndInt(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.OrInt inst) {
        result = new opt.Instruction.OrInt(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.XorInt inst) {
        result = new opt.Instruction.XorInt(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.ShlInt inst) {
        result = new opt.Instruction.ShlInt(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.ShrInt inst) {
        result = new opt.Instruction.ShrInt(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.UshrInt inst) {
        result = new opt.Instruction.UshrInt(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.AddLong inst) {
        result = new opt.Instruction.AddLong(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.SubLong inst) {
        result = new opt.Instruction.SubLong(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.MulLong inst) {
        result = new opt.Instruction.MulLong(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.DivLong inst) {
        result = new opt.Instruction.DivLong(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.RemLong inst) {
        result = new opt.Instruction.RemLong(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.AndLong inst) {
        result = new opt.Instruction.AndLong(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.OrLong inst) {
        result = new opt.Instruction.OrLong(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.XorLong inst) {
        result = new opt.Instruction.XorLong(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.ShlLong inst) {
        result = new opt.Instruction.ShlLong(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.ShrLong inst) {
        result = new opt.Instruction.ShrLong(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.UshrLong inst) {
        result = new opt.Instruction.UshrLong(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.AddFloat inst) {
        result = new opt.Instruction.AddFloat(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.SubFloat inst) {
        result = new opt.Instruction.SubFloat(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.MulFloat inst) {
        result = new opt.Instruction.MulFloat(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.DivFloat inst) {
        result = new opt.Instruction.DivFloat(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.RemFloat inst) {
        result = new opt.Instruction.RemFloat(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.AddDouble inst) {
        result = new opt.Instruction.AddDouble(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.SubDouble inst) {
        result = new opt.Instruction.SubDouble(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.MulDouble inst) {
        result = new opt.Instruction.MulDouble(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.DivDouble inst) {
        result = new opt.Instruction.DivDouble(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.RemDouble inst) {
        result = new opt.Instruction.RemDouble(inst.vdest, inst.vfirst, inst.vsecond);

    }

    @Override
    public void visit(Instruction.AddInt2Addr inst) {
        result = new opt.Instruction.AddInt2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.SubInt2Addr inst) {
        result = new opt.Instruction.SubInt2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.MulInt2Addr inst) {
        result = new opt.Instruction.MulInt2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.DivInt2Addr inst) {
        result = new opt.Instruction.DivInt2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.RemInt2Addr inst) {
        result = new opt.Instruction.RemInt2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.AndInt2Addr inst) {
        result = new opt.Instruction.AndInt2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.OrInt2Addr inst) {
        result = new opt.Instruction.OrInt2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.XorInt2Addr inst) {
        result = new opt.Instruction.XorInt2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.ShlInt2Addr inst) {
        result = new opt.Instruction.ShlInt2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.ShrInt2Addr inst) {
        result = new opt.Instruction.ShrInt2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.UshrInt2Addr inst) {
        result = new opt.Instruction.UshrInt2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.AddLong2Addr inst) {
        result = new opt.Instruction.AddLong2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.SubLong2Addr inst) {
        result = new opt.Instruction.SubLong2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.MulLong2Addr inst) {
        result = new opt.Instruction.MulLong2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.DivLong2Addr inst) {
        result = new opt.Instruction.DivLong2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.RemLong2Addr inst) {
        result = new opt.Instruction.RemLong2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.AndLong2Addr inst) {
        result = new opt.Instruction.AndLong2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.OrLong2Addr inst) {
        result = new opt.Instruction.OrLong2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.XorLong2Addr inst) {
        result = new opt.Instruction.XorLong2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.ShlLong2Addr inst) {
        result = new opt.Instruction.ShlLong2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.ShrLong2Addr inst) {
        result = new opt.Instruction.ShrLong2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.UshrLong2Addr inst) {
        result = new opt.Instruction.UshrLong2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.AddFloat2Addr inst) {
        result = new opt.Instruction.AddFloat2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.SubFloat2Addr inst) {
        result = new opt.Instruction.SubFloat2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.MulFloat2Addr inst) {
        result = new opt.Instruction.MulFloat2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.DivFloat2Addr inst) {
        result = new opt.Instruction.DivFloat2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.RemFloat2Addr inst) {
        result = new opt.Instruction.RemFloat2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.AddDouble2Addr inst) {
        result = new opt.Instruction.AddDouble2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.SubDouble2Addr inst) {
        result = new opt.Instruction.SubDouble2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.MulDouble2Addr inst) {
        result = new opt.Instruction.MulDouble2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.DivDouble2Addr inst) {
        result = new opt.Instruction.DivDouble2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.RemDouble2Addr inst) {
        result = new opt.Instruction.RemDouble2Addr(inst.vdest, inst.vsrc);

    }

    @Override
    public void visit(Instruction.AddIntLit16 inst) {
        result = new opt.Instruction.AddIntLit16(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.RsubInt inst) {
        result = new opt.Instruction.RsubInt(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.MulIntLit16 inst) {
        result = new opt.Instruction.MulIntLit16(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.DivIntLit16 inst) {
        result = new opt.Instruction.DivIntLit16(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.RemIntLit16 inst) {
        result = new opt.Instruction.RemIntLit16(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.AndIntLit16 inst) {
        result = new opt.Instruction.AndIntLit16(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.OrIntLit16 inst) {
        result = new opt.Instruction.OrIntLit16(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.XorIntLit16 inst) {
        result = new opt.Instruction.XorIntLit16(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.AddIntLit8 inst) {
        result = new opt.Instruction.AddIntLit8(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.RsubIntLit8 inst) {
        result = new opt.Instruction.RsubIntLit8(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.MulIntLit8 inst) {
        result = new opt.Instruction.MulIntLit8(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.DivIntLit8 inst) {
        result = new opt.Instruction.DivIntLit8(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.RemIntLit8 inst) {
        result = new opt.Instruction.RemIntLit8(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.AndIntLit8 inst) {
        result = new opt.Instruction.AndIntLit8(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.OrIntLit8 inst) {
        result = new opt.Instruction.OrIntLit8(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.XorIntLit8 inst) {
        result = new opt.Instruction.XorIntLit8(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.ShlIntLit8 inst) {
        result = new opt.Instruction.ShlIntLit8(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.ShrIntLit8 inst) {
        result = new opt.Instruction.ShrIntLit8(inst.vdest, inst.vsrc, inst.lit);

    }

    @Override
    public void visit(Instruction.UshrIntLit8 inst) {
        result = new opt.Instruction.UshrIntLit8(inst.vdest, inst.vsrc, inst.lit);

    }
}
