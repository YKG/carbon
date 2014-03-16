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

.method private static catchAndRethrow()V
    .registers 3

    .prologue
    .line 33
    :try_start_0
    invoke-static {}, LMain;->throwNullPointerException()V
    :try_end_3
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_3} :catch_4

    .line 40
    return-void

    .line 34
    :catch_4
    move-exception v0

    .line 36
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "second throw"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 37
    invoke-virtual {v1, v0}, Ljava/lang/NullPointerException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 38
    throw v1
.end method

.method public static main([Ljava/lang/String;)V
    .registers 4
    .parameter

    .prologue
    .line 23
    :try_start_0
    invoke-static {}, LMain;->catchAndRethrow()V
    :try_end_3
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_3} :catch_4

    .line 29
    :goto_3
    return-void

    .line 24
    :catch_4
    move-exception v0

    .line 25
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Got an NPE: "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 26
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 27
    invoke-virtual {v0}, Ljava/lang/NullPointerException;->printStackTrace()V

    goto :goto_3
.end method

.method private static throwNullPointerException()V
    .registers 2

    .prologue
    .line 43
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "first throw"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
