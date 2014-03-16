.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5
    .parameter

    .prologue
    const/4 v3, 0x5

    .line 22
    .line 26
    new-instance v0, LImplBSub;

    invoke-direct {v0}, LImplBSub;-><init>()V

    .line 28
    invoke-interface {v0, v3}, LIface2Sub1;->iFunc2(I)I

    move-result v0

    .line 29
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "ImplBSub intf: "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 30
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(I)V

    .line 32
    new-instance v0, LImplA;

    invoke-direct {v0}, LImplA;-><init>()V

    .line 33
    invoke-virtual {v0, v3}, LImplA;->iFunc2(I)I

    move-result v0

    .line 34
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "ImplA: "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 35
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(I)V

    .line 36
    return-void
.end method
