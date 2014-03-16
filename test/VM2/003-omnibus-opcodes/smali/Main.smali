.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 20
    const-class v0, LMain;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LMain;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 3
    .parameter

    .prologue
    .line 25
    const/4 v0, 0x0

    .line 26
    sget-boolean v1, LMain;->$assertionsDisabled:Z

    if-nez v1, :cond_6

    const/4 v0, 0x1

    .line 27
    :cond_6
    if-nez v0, :cond_15

    .line 28
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "FAIL: assert doesn\'t work (specify \'-ea\')\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 29
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0

    .line 31
    :cond_15
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "(assertions are enabled)"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 34
    new-instance v0, LMain;

    invoke-direct {v0}, LMain;-><init>()V

    .line 35
    invoke-virtual {v0}, LMain;->run()V

    .line 38
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 40
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Done!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 41
    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 44
    new-instance v0, LInstField;

    invoke-direct {v0}, LInstField;-><init>()V

    .line 45
    invoke-virtual {v0}, LInstField;->run()V

    .line 47
    invoke-static {}, LStaticField;->run()V

    .line 49
    invoke-static {}, LIntMath;->run()V

    .line 50
    invoke-static {}, LFloatMath;->run()V

    .line 51
    invoke-static {}, LCompare;->run()V

    .line 53
    invoke-static {}, LMonitor;->run()V

    .line 54
    invoke-static {}, LSwitch;->run()V

    .line 55
    invoke-static {}, LArray;->run()V

    .line 56
    invoke-static {}, LClasses;->run()V

    .line 57
    invoke-static {}, LGoto;->run()V

    .line 58
    invoke-static {}, LMethodCall;->run()V

    .line 59
    invoke-static {}, LThrow;->run()V

    .line 62
    :try_start_29
    invoke-static {}, LUnresTest1;->run()V
    :try_end_2c
    .catch Ljava/lang/VerifyError; {:try_start_29 .. :try_end_2c} :catch_36

    .line 67
    :goto_2c
    :try_start_2c
    invoke-static {}, LUnresTest1;->run()V
    :try_end_2f
    .catch Ljava/lang/VerifyError; {:try_start_2c .. :try_end_2f} :catch_50

    .line 73
    :goto_2f
    :try_start_2f
    invoke-static {}, LUnresTest2;->run()V
    :try_end_32
    .catch Ljava/lang/VerifyError; {:try_start_2f .. :try_end_32} :catch_6a
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_2f .. :try_end_32} :catch_84

    .line 80
    :goto_32
    invoke-static {}, LInternedString;->run()V

    .line 81
    return-void

    .line 63
    :catch_36
    move-exception v0

    .line 64
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Caught: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2c

    .line 68
    :catch_50
    move-exception v0

    .line 69
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Caught (retry): "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2f

    .line 74
    :catch_6a
    move-exception v0

    .line 75
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Caught: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_32

    .line 76
    :catch_84
    move-exception v0

    .line 78
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "NOTE: UnresTest2 not available"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_32
.end method
