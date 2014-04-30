package ast;

import ast.method.Method;
import ast.stm.Instruction;
import vm.VMClass;
import vm.VMField;
import vm.VMMethod;

import java.util.Hashtable;

public class Translator extends VisitorAdapter {
    public Object result;

    @Override
    public void visit(Method method) {
        opt.Instruction.T[] code = new opt.Instruction.T[method.statements.size()];
        for(int i = 0; i < method.statements.size(); i++) {
            ast.stm.T inst = method.statements.get(i);
            inst.accept(this);
            opt.Instruction.T newInst = (opt.Instruction.T)result;
            newInst.source = inst.source;
            code[i] = newInst;
        }
        //TODO : exception table = null
        result = new VMMethod(method.regCount, code, method.getMethodSign(), null, method.accessFlag);
    }

    @Override
    public void visit(ast.classs.Class clazz) {
        Hashtable<VMField, VMField> fields = new Hashtable<>();
        for(ast.classs.Class.Field field : clazz.fieldList) {
            String descriptor  = field.type;
            VMField vmField = new VMField(field.name, descriptor, null, field.accessFlag);
            fields.put(vmField, vmField);
        }

        Hashtable<VMMethod, VMMethod> methods = new Hashtable<>();
        for(ast.method.Method method : clazz.methods) {
            method.accept(this);
            methods.put((VMMethod)result,(VMMethod)result);
        }
        result = new VMClass(clazz.FullyQualifiedName, clazz.getPackageName(), fields, methods, clazz.accessFlag);
    }

    @Override
    public void visit(Instruction.Nop inst) {
        result = new opt.Instruction.Nop();
    }

    @Override
    public void visit(Instruction.Move inst) {
        result = new opt.Instruction.Move(inst.vdest, inst.vsrc);
    }

    @Override
    public void visit(Instruction.MoveFrom16 inst) {
        result = new opt.Instruction.MoveFrom16(inst.vdest, inst.vsrc);
    }

    @Override
    public void visit(Instruction.Move16 inst) {
        result = new opt.Instruction.Move16(inst.vdest, inst.vsrc);
    }

    @Override
    public void visit(Instruction.MoveWide inst) {
        result = new opt.Instruction.MoveWide(inst.vdest, inst.vsrc);
    }

    @Override
    public void visit(Instruction.MoveWideFrom16 inst) {
        result = new opt.Instruction.MoveWideFrom16(inst.vdest, inst.vsrc);
    }

    @Override
    public void visit(Instruction.MoveWide16 inst) {
        result = new opt.Instruction.MoveWide16(inst.vdest, inst.vsrc);
    }

    @Override
    public void visit(Instruction.MoveObject inst) {
        result = new opt.Instruction.MoveObject(inst.vdest, inst.vsrc);
    }

    @Override
    public void visit(Instruction.MoveObjectFrom16 inst) {
        result = new opt.Instruction.MoveObjectFrom16(inst.vdest, inst.vsrc);
    }

    @Override
    public void visit(Instruction.MoveObject16 inst) {
        result = new opt.Instruction.MoveObject16(inst.vdest, inst.vsrc);
    }

    @Override
    public void visit(Instruction.MoveResult inst) {
        result = new opt.Instruction.MoveResult(inst.vdest);
    }

    @Override
    public void visit(Instruction.MoveResultWide inst) {
        result = new opt.Instruction.MoveResultWide(inst.vdest);
    }

    @Override
    public void visit(Instruction.MoveResultObject inst) {
        result = new opt.Instruction.MoveResultObject(inst.vdest);
    }

    @Override
    public void visit(Instruction.MoveException inst) {
        result = new opt.Instruction.MoveException(inst.vdest);
    }

    @Override
    public void visit(Instruction.ReturnVoid inst) {
        result = new opt.Instruction.ReturnVoid();
    }

    @Override
    public void visit(Instruction.Return inst) {
        result = new opt.Instruction.Return(inst.vret);
    }

    @Override
    public void visit(Instruction.ReturnWide inst) {
        result = new opt.Instruction.ReturnWide(inst.vret);
    }

    @Override
    public void visit(Instruction.ReturnObject inst) {
        result = new opt.Instruction.ReturnObject(inst.vret);
    }

    @Override
    public void visit(Instruction.Const4 inst) {
        result = new opt.Instruction.Const4(inst.vdest, inst.val);
    }

    @Override
    public void visit(Instruction.Const16 inst) {
        result = new opt.Instruction.Const16(inst.vdest, inst.val);
    }

    @Override
    public void visit(Instruction.Const inst) {
        result = new opt.Instruction.Const(inst.vdest, inst.val);
    }

    @Override
    public void visit(Instruction.ConstHigh16 inst) {
        result = new opt.Instruction.ConstHigh16(inst.vdest, inst.val);
    }

    @Override
    public void visit(Instruction.ConstWide16 inst) {
        result = new opt.Instruction.ConstWide16(inst.vdest, inst.val);
    }

    @Override
    public void visit(Instruction.ConstWide32 inst) {
        result = new opt.Instruction.ConstWide32(inst.vdest, inst.val);
    }

    @Override
    public void visit(Instruction.ConstWide inst) {
        result = new opt.Instruction.ConstWide(inst.vdest, inst.val);
    }

    @Override
    public void visit(Instruction.ConstWideHigh16 inst) {
        result = new opt.Instruction.ConstWideHigh16(inst.vdest, inst.val);
    }

    @Override
    public void visit(Instruction.ConstString inst) {
        result = new opt.Instruction.ConstString(inst.vdest, inst.str);
    }

    @Override
    public void visit(Instruction.ConstStringJumbo inst) {
        result = new opt.Instruction.ConstStringJumbo(inst.vdest, inst.str);
    }

    @Override
    public void visit(Instruction.ConstClass inst) {
        result = new opt.Instruction.ConstClass(inst.vdest, inst.type);
    }

    @Override
    public void visit(Instruction.MonitorEnter inst) {
        result = new opt.Instruction.MonitorEnter(inst.vref);
    }

    @Override
    public void visit(Instruction.MonitorExit inst) {
        result = new opt.Instruction.MonitorExit(inst.vref);
    }

    @Override
    public void visit(Instruction.CheckCast inst) {
        result = new opt.Instruction.CheckCast(inst.vref, inst.type);
    }

    @Override
    public void visit(Instruction.InstanceOf inst) {
        result = new opt.Instruction.InstanceOf(inst.vdest, inst.vref, inst.type);
    }

    @Override
    public void visit(Instruction.arrayLength inst) {
        result = new opt.Instruction.arrayLength(inst.vdest, inst.vsrc);
    }

    @Override
    public void visit(Instruction.NewInstance inst) {
        result = new opt.Instruction.NewInstance(inst.vdest, inst.type);
    }

    @Override
    public void visit(Instruction.NewArray inst) {
        result = new opt.Instruction.NewArray(inst.vdest, inst.vsize, inst.type);
    }

    @Override
    public void visit(Instruction.FilledNewArray inst) {
        result = new opt.Instruction.FilledNewArray(inst.argvs, inst.type);
    }

    @Override
    public void visit(Instruction.FilledNewArrayRange inst) {
        result = new opt.Instruction.FilledNewArrayRange(inst.argvs, inst.type);
    }

    @Override
    public void visit(Instruction.FillArrayData inst) {
        result = new opt.Instruction.FillArrayData(inst.vdest, inst.addr);
    }

    @Override
    public void visit(Instruction.Throw inst) {
        result = new opt.Instruction.Throw(inst.vkind);
    }

    @Override
    public void visit(Instruction.Goto inst) {
        result = new opt.Instruction.Goto(inst.addr);
    }

    @Override
    public void visit(Instruction.Goto16 inst) {
        result = new opt.Instruction.Goto16(inst.addr);
    }

    @Override
    public void visit(Instruction.Goto32 inst) {
        result = new opt.Instruction.Goto32(inst.addr);
    }

    @Override
    public void visit(Instruction.PackedSwitch inst) {

    }

    @Override
    public void visit(Instruction.SparseSwitch inst) {

    }

    @Override
    public void visit(Instruction.IfEq inst) {
        result = new opt.Instruction.IfEq(inst.vfirst, inst.vsecond, inst.addr);

    }

    @Override
    public void visit(Instruction.IfNe inst) {
        result = new opt.Instruction.IfNe(inst.vfirst, inst.vsecond, inst.addr);

    }

    @Override
    public void visit(Instruction.IfLt inst) {
        result = new opt.Instruction.IfLt(inst.vfirst, inst.vsecond, inst.addr);

    }

    @Override
    public void visit(Instruction.IfGe inst) {
        result = new opt.Instruction.IfGe(inst.vfirst, inst.vsecond, inst.addr);

    }

    @Override
    public void visit(Instruction.IfGt inst) {
        result = new opt.Instruction.IfGt(inst.vfirst, inst.vsecond, inst.addr);

    }

    @Override
    public void visit(Instruction.IfLe inst) {
        result = new opt.Instruction.IfLe(inst.vfirst, inst.vsecond, inst.addr);

    }

    @Override
    public void visit(Instruction.IfEqz inst) {
        result = new opt.Instruction.IfEqz(inst.vtest, inst.addr);

    }

    @Override
    public void visit(Instruction.IfNez inst) {
        result = new opt.Instruction.IfNez(inst.vtest, inst.addr);

    }

    @Override
    public void visit(Instruction.IfLtz inst) {
        result = new opt.Instruction.IfLtz(inst.vtest, inst.addr);

    }

    @Override
    public void visit(Instruction.IfGez inst) {
        result = new opt.Instruction.IfGez(inst.vtest, inst.addr);

    }

    @Override
    public void visit(Instruction.IfGtz inst) {
        result = new opt.Instruction.IfGtz(inst.vtest, inst.addr);

    }

    @Override
    public void visit(Instruction.IfLez inst) {
        result = new opt.Instruction.IfLez(inst.vtest, inst.addr);

    }

    @Override
    public void visit(Instruction.Aget inst) {
        result = new opt.Instruction.Aget(inst.vdest, inst.varray, inst.vindex);

    }

    @Override
    public void visit(Instruction.AgetWide inst) {
        result = new opt.Instruction.AgetWide(inst.vdest, inst.varray, inst.vindex);

    }

    @Override
    public void visit(Instruction.AgetObject inst) {
        result = new opt.Instruction.AgetObject(inst.vdest, inst.varray, inst.vindex);

    }

    @Override
    public void visit(Instruction.AgetBoolean inst) {
        result = new opt.Instruction.AgetBoolean(inst.vdest, inst.varray, inst.vindex);

    }

    @Override
    public void visit(Instruction.AgetByte inst) {
        result = new opt.Instruction.AgetByte(inst.vdest, inst.varray, inst.vindex);

    }

    @Override
    public void visit(Instruction.AgetChar inst) {
        result = new opt.Instruction.AgetChar(inst.vdest, inst.varray, inst.vindex);

    }

    @Override
    public void visit(Instruction.AgetShort inst) {
        result = new opt.Instruction.AgetShort(inst.vdest, inst.varray, inst.vindex);

    }

    @Override
    public void visit(Instruction.Aput inst) {
        result = new opt.Instruction.AputShort(inst.vsrc, inst.varray, inst.vindex);

    }

    @Override
    public void visit(Instruction.AputWide inst) {
        result = new opt.Instruction.AputShort(inst.vsrc, inst.varray, inst.vindex);

    }

    @Override
    public void visit(Instruction.AputObject inst) {
        result = new opt.Instruction.AputShort(inst.vsrc, inst.varray, inst.vindex);

    }

    @Override
    public void visit(Instruction.AputBoolean inst) {
        result = new opt.Instruction.AputShort(inst.vsrc, inst.varray, inst.vindex);

    }

    @Override
    public void visit(Instruction.AputByte inst) {
        result = new opt.Instruction.AputShort(inst.vsrc, inst.varray, inst.vindex);

    }

    @Override
    public void visit(Instruction.AputChar inst) {
        result = new opt.Instruction.AputShort(inst.vsrc, inst.varray, inst.vindex);

    }

    @Override
    public void visit(Instruction.AputShort inst) {
        result = new opt.Instruction.AputShort(inst.vsrc, inst.varray, inst.vindex);

    }


    @Override
    public void visit(Instruction.Iget inst) {
        result = new opt.Instruction.IgetShort(inst.vdest, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.IgetWide inst) {
        result = new opt.Instruction.IgetShort(inst.vdest, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.IgetOjbect inst) {
        result = new opt.Instruction.IgetShort(inst.vdest, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.IgetBoolean inst) {
        result = new opt.Instruction.IgetShort(inst.vdest, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.IgetByte inst) {
        result = new opt.Instruction.IgetShort(inst.vdest, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.IgetChar inst) {
        result = new opt.Instruction.IgetShort(inst.vdest, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.IgetShort inst) {
        result = new opt.Instruction.IgetShort(inst.vdest, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }


    @Override
    public void visit(Instruction.Iput inst) {
        result = new opt.Instruction.IgetShort(inst.vsrc, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.IputWide inst) {
        result = new opt.Instruction.IgetShort(inst.vsrc, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.IputObject inst) {
        result = new opt.Instruction.IgetShort(inst.vsrc, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.IputBoolean inst) {
        result = new opt.Instruction.IgetShort(inst.vsrc, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.IputByte inst) {
        result = new opt.Instruction.IgetShort(inst.vsrc, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.IputChar inst) {
        result = new opt.Instruction.IgetShort(inst.vsrc, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.IputShort inst) {
        result = new opt.Instruction.IgetShort(inst.vsrc, inst.vfield, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.Sget inst) {
        result = new opt.Instruction.SgetShort(inst.vdest, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.SgetWide inst) {
        result = new opt.Instruction.SgetShort(inst.vdest, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.SgetObject inst) {
        result = new opt.Instruction.SgetShort(inst.vdest, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.SgetBoolean inst) {
        result = new opt.Instruction.SgetShort(inst.vdest, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.SgetByte inst) {
        result = new opt.Instruction.SgetShort(inst.vdest, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.SgetChar inst) {
        result = new opt.Instruction.SgetShort(inst.vdest, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.SgetShort inst) {
        result = new opt.Instruction.SgetShort(inst.vdest, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.Sput inst) {
        result = new opt.Instruction.SgetShort(inst.vsrc, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.SputWide inst) {
        result = new opt.Instruction.SgetShort(inst.vsrc, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.SputObject inst) {
        result = new opt.Instruction.SgetShort(inst.vsrc, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.SputBoolean inst) {
        result = new opt.Instruction.SgetShort(inst.vsrc, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.SputByte inst) {
        result = new opt.Instruction.SgetShort(inst.vsrc, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.SputChar inst) {
        result = new opt.Instruction.SgetShort(inst.vsrc, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.SputShort inst) {
        result = new opt.Instruction.SgetShort(inst.vsrc, inst.type.classType, inst.type.fieldName, inst.type.fieldType);

    }

    @Override
    public void visit(Instruction.InvokeVirtual inst) {
        result = new opt.Instruction.InvokeVirtual(inst.argvs, inst.type.classType, inst.type.getMethodSign());
    }

    @Override
    public void visit(Instruction.InvokeSuper inst) {
        result = new opt.Instruction.InvokeSuper(inst.argvs, inst.type.classType, inst.type.getMethodSign());

    }

    @Override
    public void visit(Instruction.InvokeDirect inst) {
        result = new opt.Instruction.InvokeDirect(inst.argvs, inst.type.classType, inst.type.getMethodSign());

    }

    @Override
    public void visit(Instruction.InvokeStatic inst) {
        result = new opt.Instruction.InvokeStatic(inst.argvs, inst.type.classType, inst.type.getMethodSign());

    }

    @Override
    public void visit(Instruction.InvokeInterface inst) {
        result = new opt.Instruction.InvokeInterface(inst.argvs, inst.type.classType, inst.type.getMethodSign());

    }

    @Override
    public void visit(Instruction.InvokeVirtualRange inst) {
        result = new opt.Instruction.InvokeVirtualRange(inst.argvs, inst.type.classType, inst.type.getMethodSign());

    }

    @Override
    public void visit(Instruction.InvokeSuperRange inst) {
        result = new opt.Instruction.InvokeSuperRange(inst.argvs, inst.type.classType, inst.type.getMethodSign());

    }

    @Override
    public void visit(Instruction.InvokeDirectRange inst) {
        result = new opt.Instruction.InvokeDirectRange(inst.argvs, inst.type.classType, inst.type.getMethodSign());

    }

    @Override
    public void visit(Instruction.InvokeStaticRange inst) {
        result = new opt.Instruction.InvokeStaticRange(inst.argvs, inst.type.classType, inst.type.getMethodSign());

    }

    @Override
    public void visit(Instruction.InvokeInterfaceRange inst) {
        result = new opt.Instruction.InvokeInterfaceRange(inst.argvs, inst.type.classType, inst.type.getMethodSign());

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
