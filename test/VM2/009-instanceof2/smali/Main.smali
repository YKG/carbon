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
    const/4 v1, 0x5

    .line 23
    new-array v0, v1, [LImplA;

    .line 24
    new-array v1, v1, [LImplBSub;

    .line 30
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "instanceof Serializable = "

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 31
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    instance-of v3, v0, Ljava/io/Serializable;

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Z)V

    .line 32
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "instanceof Cloneable = "

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 33
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    instance-of v3, v0, Ljava/lang/Cloneable;

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Z)V

    .line 34
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "instanceof Runnable = "

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 35
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    instance-of v0, v0, Ljava/lang/Runnable;

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Z)V

    .line 37
    instance-of v0, v1, [LImplA;

    .line 38
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "aaOkay (false) = "

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 39
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Z)V

    .line 40
    instance-of v0, v1, [LImplB;

    .line 41
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "bbOkay (true) = "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 42
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Z)V

    .line 43
    return-void
.end method
