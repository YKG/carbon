.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# static fields
.field public static VERBOSE:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 4
    const/4 v0, 0x0

    sput-boolean v0, LMain;->VERBOSE:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static accessStuff()V
    .registers 3

    .prologue
    .line 29
    const-class v0, Lother/Blort;

    .line 38
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "\ngetFields A"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 40
    :try_start_9
    invoke-virtual {v0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_c} :catch_cb

    .line 45
    :goto_c
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "getFields B"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 46
    sget-object v1, LEnforcer;->THE_ONE:LEnforcer;

    invoke-virtual {v1}, LEnforcer;->denyNext()V

    .line 48
    :try_start_18
    invoke-virtual {v0}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_1b} :catch_d1

    .line 53
    :goto_1b
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "\ngetDeclaredFields A"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 55
    :try_start_22
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_25} :catch_d7

    .line 60
    :goto_25
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "getDeclaredFields B"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 61
    sget-object v1, LEnforcer;->THE_ONE:LEnforcer;

    invoke-virtual {v1}, LEnforcer;->denyNext()V

    .line 63
    :try_start_31
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;
    :try_end_34
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_34} :catch_dd

    .line 68
    :goto_34
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "\ngetMethods A"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 70
    :try_start_3b
    invoke-virtual {v0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_3e} :catch_e3

    .line 75
    :goto_3e
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "getMethods B"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 76
    sget-object v1, LEnforcer;->THE_ONE:LEnforcer;

    invoke-virtual {v1}, LEnforcer;->denyNext()V

    .line 78
    :try_start_4a
    invoke-virtual {v0}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;
    :try_end_4d
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_4d} :catch_e9

    .line 83
    :goto_4d
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "\ngetDeclaredMethods A"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 85
    :try_start_54
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;
    :try_end_57
    .catch Ljava/lang/Exception; {:try_start_54 .. :try_end_57} :catch_ef

    .line 90
    :goto_57
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "getDeclaredMethods B"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 91
    sget-object v1, LEnforcer;->THE_ONE:LEnforcer;

    invoke-virtual {v1}, LEnforcer;->denyNext()V

    .line 93
    :try_start_63
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;
    :try_end_66
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_66} :catch_f5

    .line 98
    :goto_66
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "\ngetConstructors A"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 100
    :try_start_6d
    invoke-virtual {v0}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_6d .. :try_end_70} :catch_fb

    .line 105
    :goto_70
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "getConstructors B"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 106
    sget-object v1, LEnforcer;->THE_ONE:LEnforcer;

    invoke-virtual {v1}, LEnforcer;->denyNext()V

    .line 108
    :try_start_7c
    invoke-virtual {v0}, Ljava/lang/Class;->getConstructors()[Ljava/lang/reflect/Constructor;
    :try_end_7f
    .catch Ljava/lang/Exception; {:try_start_7c .. :try_end_7f} :catch_101

    .line 113
    :goto_7f
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "\ngetDeclaredConstructors A"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 115
    :try_start_86
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;
    :try_end_89
    .catch Ljava/lang/Exception; {:try_start_86 .. :try_end_89} :catch_107

    .line 120
    :goto_89
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "getDeclaredConstructors B"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 121
    sget-object v1, LEnforcer;->THE_ONE:LEnforcer;

    invoke-virtual {v1}, LEnforcer;->denyNext()V

    .line 123
    :try_start_95
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredConstructors()[Ljava/lang/reflect/Constructor;
    :try_end_98
    .catch Ljava/lang/Exception; {:try_start_95 .. :try_end_98} :catch_10d

    .line 128
    :goto_98
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "\ngetClasses A"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 130
    :try_start_9f
    invoke-virtual {v0}, Ljava/lang/Class;->getClasses()[Ljava/lang/Class;
    :try_end_a2
    .catch Ljava/lang/Exception; {:try_start_9f .. :try_end_a2} :catch_112

    .line 135
    :goto_a2
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "getClasses B"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 136
    sget-object v1, LEnforcer;->THE_ONE:LEnforcer;

    invoke-virtual {v1}, LEnforcer;->denyNext()V

    .line 138
    :try_start_ae
    invoke-virtual {v0}, Ljava/lang/Class;->getClasses()[Ljava/lang/Class;
    :try_end_b1
    .catch Ljava/lang/Exception; {:try_start_ae .. :try_end_b1} :catch_117

    .line 143
    :goto_b1
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "\ngetDeclaredClasses A"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 145
    :try_start_b8
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredClasses()[Ljava/lang/Class;
    :try_end_bb
    .catch Ljava/lang/Exception; {:try_start_b8 .. :try_end_bb} :catch_11c

    .line 150
    :goto_bb
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "getDeclaredClasses B"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 151
    sget-object v1, LEnforcer;->THE_ONE:LEnforcer;

    invoke-virtual {v1}, LEnforcer;->denyNext()V

    .line 153
    :try_start_c7
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredClasses()[Ljava/lang/Class;
    :try_end_ca
    .catch Ljava/lang/Exception; {:try_start_c7 .. :try_end_ca} :catch_121

    .line 157
    :goto_ca
    return-void

    .line 41
    :catch_cb
    move-exception v1

    .line 42
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto/16 :goto_c

    .line 49
    :catch_d1
    move-exception v1

    .line 50
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto/16 :goto_1b

    .line 56
    :catch_d7
    move-exception v1

    .line 57
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto/16 :goto_25

    .line 64
    :catch_dd
    move-exception v1

    .line 65
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto/16 :goto_34

    .line 71
    :catch_e3
    move-exception v1

    .line 72
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto/16 :goto_3e

    .line 79
    :catch_e9
    move-exception v1

    .line 80
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto/16 :goto_4d

    .line 86
    :catch_ef
    move-exception v1

    .line 87
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto/16 :goto_57

    .line 94
    :catch_f5
    move-exception v1

    .line 95
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto/16 :goto_66

    .line 101
    :catch_fb
    move-exception v1

    .line 102
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto/16 :goto_70

    .line 109
    :catch_101
    move-exception v1

    .line 110
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto/16 :goto_7f

    .line 116
    :catch_107
    move-exception v1

    .line 117
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto/16 :goto_89

    .line 124
    :catch_10d
    move-exception v1

    .line 125
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto :goto_98

    .line 131
    :catch_112
    move-exception v1

    .line 132
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto :goto_a2

    .line 139
    :catch_117
    move-exception v1

    .line 140
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto :goto_b1

    .line 146
    :catch_11c
    move-exception v1

    .line 147
    invoke-static {v1}, LMain;->report(Ljava/lang/Throwable;)V

    goto :goto_bb

    .line 154
    :catch_121
    move-exception v0

    .line 155
    invoke-static {v0}, LMain;->report(Ljava/lang/Throwable;)V

    goto :goto_ca
.end method

.method public static main([Ljava/lang/String;)V
    .registers 3
    .parameter

    .prologue
    .line 7
    array-length v0, p0

    if-lez v0, :cond_11

    .line 8
    const/4 v0, 0x0

    aget-object v0, p0, v0

    const-string v1, "--verbose"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 9
    const/4 v0, 0x1

    sput-boolean v0, LMain;->VERBOSE:Z

    .line 13
    :cond_11
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Setting SecurityManager."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 14
    sget-object v0, LEnforcer;->THE_ONE:LEnforcer;

    invoke-static {v0}, Ljava/lang/System;->setSecurityManager(Ljava/lang/SecurityManager;)V

    .line 15
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Running tests."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 16
    invoke-static {}, LMain;->accessStuff()V

    .line 17
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\nDone!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method public static report(Ljava/lang/Throwable;)V
    .registers 2
    .parameter

    .prologue
    .line 21
    sget-boolean v0, LMain;->VERBOSE:Z

    if-eqz v0, :cond_a

    .line 22
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->printStackTrace(Ljava/io/PrintStream;)V

    .line 26
    :goto_9
    return-void

    .line 24
    :cond_a
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_9
.end method
