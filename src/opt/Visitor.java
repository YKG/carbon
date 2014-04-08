package opt;

public interface Visitor {
    // 0x00
    public void visit(Instruction.Nop inst);
    public void visit(Instruction.Move inst);
    public void visit(Instruction.MoveFrom16 inst);
    public void visit(Instruction.Move16 inst);
    public void visit(Instruction.MoveWide inst);
    public void visit(Instruction.MoveWideFrom16 inst);
    public void visit(Instruction.MoveWide16 inst);
    public void visit(Instruction.MoveObject inst);
    public void visit(Instruction.MoveObjectFrom16 inst);
    public void visit(Instruction.MoveObject16 inst);
    public void visit(Instruction.MoveResult inst);
    public void visit(Instruction.MoveResultWide inst);
    public void visit(Instruction.MoveResultObject inst);
    public void visit(Instruction.MoveException inst);
    public void visit(Instruction.ReturnVoid inst);
    public void visit(Instruction.Return inst);

    //0x10
    public void visit(Instruction.ReturnWide inst);
    public void visit(Instruction.ReturnObject inst);
    public void visit(Instruction.Const4 inst);
    public void visit(Instruction.Const16 inst);
    public void visit(Instruction.Const inst);
    public void visit(Instruction.ConstHigh16 inst);
    public void visit(Instruction.ConstWide16 inst);
    public void visit(Instruction.ConstWide32 inst);
    public void visit(Instruction.ConstWide inst);
    public void visit(Instruction.ConstWideHigh16 inst);
    public void visit(Instruction.ConstString inst);
    public void visit(Instruction.ConstStringJumbo inst);
    public void visit(Instruction.ConstClass inst);
    public void visit(Instruction.MonitorEnter inst);
    public void visit(Instruction.MonitorExit inst);
    public void visit(Instruction.CheckCast inst);

    //0x20
    public void visit(Instruction.InstanceOf inst);
    public void visit(Instruction.arrayLength inst);
    public void visit(Instruction.NewInstance inst);
    public void visit(Instruction.NewArray inst);
    public void visit(Instruction.FilledNewArray inst);
    public void visit(Instruction.FilledNewArrayRange inst);
    public void visit(Instruction.FillArrayData inst);
    public void visit(Instruction.Throw inst);
    public void visit(Instruction.Goto inst);
    public void visit(Instruction.Goto16 inst);
    public void visit(Instruction.Goto32 inst);

    //0x2b
    public void visit(Instruction.PackedSwitch inst);
    public void visit(Instruction.SparseSwitch inst);

    //0x2d
    public void visit(Instruction.CmplFloat inst);
    public void visit(Instruction.CmpgFloat inst);
    public void visit(Instruction.CmplDouble inst);
    public void visit(Instruction.Cmpgdouble inst);
    public void visit(Instruction.CmpLong inst);

    //0x32
    public void visit(Instruction.IfEq inst);
    public void visit(Instruction.IfNe inst);
    public void visit(Instruction.IfLt inst);
    public void visit(Instruction.IfGe inst);
    public void visit(Instruction.IfGt inst);
    public void visit(Instruction.IfLe inst);

    //0x38
    public void visit(Instruction.IfEqz inst);
    public void visit(Instruction.IfNez inst);
    public void visit(Instruction.IfLtz inst);
    public void visit(Instruction.IfGez inst);
    public void visit(Instruction.IfGtz inst);
    public void visit(Instruction.IfLez inst);

    // 0x44
    public void visit(Instruction.Aget inst);
    public void visit(Instruction.AgetWide inst);
    public void visit(Instruction.AgetObject inst);
    public void visit(Instruction.AgetBoolean inst);
    public void visit(Instruction.AgetByte inst);
    public void visit(Instruction.AgetChar inst);
    public void visit(Instruction.AgetShort inst);
    public void visit(Instruction.Aput inst);
    public void visit(Instruction.AputWide inst);
    public void visit(Instruction.AputObject inst);
    public void visit(Instruction.AputBoolean inst);
    public void visit(Instruction.AputByte inst);
    public void visit(Instruction.AputChar inst);
    public void visit(Instruction.AputShort inst);

    //0x52
    public void visit(Instruction.Iget inst);
    public void visit(Instruction.IgetWide inst);
    public void visit(Instruction.IgetOjbect inst);
    public void visit(Instruction.IgetBoolean inst);
    public void visit(Instruction.IgetByte inst);
    public void visit(Instruction.IgetChar inst);
    public void visit(Instruction.IgetShort inst);
    public void visit(Instruction.Iput inst);
    public void visit(Instruction.IputWide inst);
    public void visit(Instruction.IputObject inst);
    public void visit(Instruction.IputBoolean inst);
    public void visit(Instruction.IputByte inst);
    public void visit(Instruction.IputChar inst);
    public void visit(Instruction.IputShort inst);

    //0x60
    public void visit(Instruction.Sget inst);
    public void visit(Instruction.SgetWide inst);
    public void visit(Instruction.SgetObject inst);
    public void visit(Instruction.SgetBoolean inst);
    public void visit(Instruction.SgetByte inst);
    public void visit(Instruction.SgetChar inst);
    public void visit(Instruction.SgetShort inst);
    public void visit(Instruction.Sput inst);
    public void visit(Instruction.SputWide inst);
    public void visit(Instruction.SputObject inst);
    public void visit(Instruction.SputBoolean inst);
    public void visit(Instruction.SputByte inst);
    public void visit(Instruction.SputChar inst);
    public void visit(Instruction.SputShort inst);

    //0x6e
    public void visit(Instruction.InvokeVirtual inst);
    public void visit(Instruction.InvokeSuper inst);
    public void visit(Instruction.InvokeDirect inst);
    public void visit(Instruction.InvokeStatic inst);
    public void visit(Instruction.InvokeInterface inst);

    //0x74
    public void visit(Instruction.InvokeVirtualRange inst);
    public void visit(Instruction.InvokeSuperRange inst);
    public void visit(Instruction.InvokeDirectRange inst);
    public void visit(Instruction.InvokeStaticRange inst);
    public void visit(Instruction.InvokeInterfaceRange inst);

    //0x7b
    public void visit(Instruction.NegInt inst);
    public void visit(Instruction.NotInt inst);
    public void visit(Instruction.NegLong inst);
    public void visit(Instruction.NotLong inst);
    public void visit(Instruction.NegFloat inst);
    public void visit(Instruction.NegDouble inst);
    public void visit(Instruction.IntToLong inst);
    public void visit(Instruction.IntToFloat inst);
    public void visit(Instruction.IntToDouble inst);
    public void visit(Instruction.LongToInt inst);
    public void visit(Instruction.LongToFloat inst);
    public void visit(Instruction.LongToDouble inst);
    public void visit(Instruction.FloatToInt inst);
    public void visit(Instruction.FloatToLong inst);
    public void visit(Instruction.FloatToDouble inst);
    public void visit(Instruction.DoubleToInt inst);
    public void visit(Instruction.DoubleToLong inst);
    public void visit(Instruction.DoubleToFloat inst);
    public void visit(Instruction.IntToByte inst);
    public void visit(Instruction.IntToChar inst);
    public void visit(Instruction.IntToShort inst);

    //0x90
    public void visit(Instruction.AddInt inst);
    public void visit(Instruction.SubInt inst);
    public void visit(Instruction.MulInt inst);
    public void visit(Instruction.DivInt inst);
    public void visit(Instruction.RemInt inst);
    public void visit(Instruction.AndInt inst);
    public void visit(Instruction.OrInt inst);
    public void visit(Instruction.XorInt inst);
    public void visit(Instruction.ShlInt inst);
    public void visit(Instruction.ShrInt inst);
    public void visit(Instruction.UshrInt inst);
    public void visit(Instruction.AddLong inst);
    public void visit(Instruction.SubLong inst);
    public void visit(Instruction.MulLong inst);
    public void visit(Instruction.DivLong inst);
    public void visit(Instruction.RemLong inst);
    public void visit(Instruction.AndLong inst);
    public void visit(Instruction.OrLong inst);
    public void visit(Instruction.XorLong inst);
    public void visit(Instruction.ShlLong inst);
    public void visit(Instruction.ShrLong inst);
    public void visit(Instruction.UshrLong inst);
    public void visit(Instruction.AddFloat inst);
    public void visit(Instruction.SubFloat inst);
    public void visit(Instruction.MulFloat inst);
    public void visit(Instruction.DivFloat inst);
    public void visit(Instruction.RemFloat inst);
    public void visit(Instruction.AddDouble inst);
    public void visit(Instruction.SubDouble inst);
    public void visit(Instruction.MulDouble inst);
    public void visit(Instruction.DivDouble inst);
    public void visit(Instruction.RemDouble inst);

    //0xb0
    public void visit(Instruction.AddInt2Addr inst);
    public void visit(Instruction.SubInt2Addr inst);
    public void visit(Instruction.MulInt2Addr inst);
    public void visit(Instruction.DivInt2Addr inst);
    public void visit(Instruction.RemInt2Addr inst);
    public void visit(Instruction.AndInt2Addr inst);
    public void visit(Instruction.OrInt2Addr inst);
    public void visit(Instruction.XorInt2Addr inst);
    public void visit(Instruction.ShlInt2Addr inst);
    public void visit(Instruction.ShrInt2Addr inst);
    public void visit(Instruction.UshrInt2Addr inst);
    public void visit(Instruction.AddLong2Addr inst);
    public void visit(Instruction.SubLong2Addr inst);
    public void visit(Instruction.MulLong2Addr inst);
    public void visit(Instruction.DivLong2Addr inst);
    public void visit(Instruction.RemLong2Addr inst);
    public void visit(Instruction.AndLong2Addr inst);
    public void visit(Instruction.OrLong2Addr inst);
    public void visit(Instruction.XorLong2Addr inst);
    public void visit(Instruction.ShlLong2Addr inst);
    public void visit(Instruction.ShrLong2Addr inst);
    public void visit(Instruction.UshrLong2Addr inst);
    public void visit(Instruction.AddFloat2Addr inst);
    public void visit(Instruction.SubFloat2Addr inst);
    public void visit(Instruction.MulFloat2Addr inst);
    public void visit(Instruction.DivFloat2Addr inst);
    public void visit(Instruction.RemFloat2Addr inst);
    public void visit(Instruction.AddDouble2Addr inst);
    public void visit(Instruction.SubDouble2Addr inst);
    public void visit(Instruction.MulDouble2Addr inst);
    public void visit(Instruction.DivDouble2Addr inst);
    public void visit(Instruction.RemDouble2Addr inst);

    //0xd0
    public void visit(Instruction.AddIntLit16 inst);
    public void visit(Instruction.RsubInt inst);
    public void visit(Instruction.MulIntLit16 inst);
    public void visit(Instruction.DivIntLit16 inst);
    public void visit(Instruction.RemIntLit16 inst);
    public void visit(Instruction.AndIntLit16 inst);
    public void visit(Instruction.OrIntLit16 inst);
    public void visit(Instruction.XorIntLit16 inst);

    //0xd8
    public void visit(Instruction.AddIntLit8 inst);
    public void visit(Instruction.RsubIntLit8 inst);
    public void visit(Instruction.MulIntLit8 inst);
    public void visit(Instruction.DivIntLit8 inst);
    public void visit(Instruction.RemIntLit8 inst);
    public void visit(Instruction.AndIntLit8 inst);
    public void visit(Instruction.OrIntLit8 inst);
    public void visit(Instruction.XorIntLit8 inst);
    public void visit(Instruction.ShlIntLit8 inst);
    public void visit(Instruction.ShrIntLit8 inst);
    public void visit(Instruction.UshrIntLit8 inst);

//    public void visit(Instruction.PackedSwitchDirective packedSwitchDirective);
//    public void visit(Instruction.SparseSwitchDirective sparseSwitchDirective);
//    public void visit(Instruction.ArrayDataDirective arrayDataDirective);
//
//    public void visit(ast.annotation.Annotation annotation);
//    public void visit(ast.annotation.Annotation.SubAnnotation subAnnotation);
//    public void visit(ast.annotation.Annotation.ElementLiteral elementLiteral);
}