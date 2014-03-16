.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 3
    .parameter

    .prologue
    .line 24
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "tests beginning"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 25
    invoke-static {}, LMain;->testOomeLarge()V

    .line 26
    invoke-static {}, LMain;->testOomeSmall()V

    .line 27
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "tests succeeded"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 28
    return-void
.end method

.method private static testOomeLarge()V
    .registers 2

    .prologue
    .line 31
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "testOomeLarge beginning"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 38
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 42
    const v1, 0xffffe0

    :try_start_f
    new-array v1, v1, [B
    :try_end_11
    .catch Ljava/lang/OutOfMemoryError; {:try_start_f .. :try_end_11} :catch_1f

    .line 48
    :goto_11
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_26

    .line 49
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Test failed: OutOfMemoryError not thrown"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 43
    :catch_1f
    move-exception v0

    .line 45
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_11

    .line 53
    :cond_26
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "testOomeLarge succeeded"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 54
    return-void
.end method

.method private static testOomeSmall()V
    .registers 2

    .prologue
    .line 90
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "testOomeSmall beginning"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 91
    invoke-static {}, LMain;->testOomeSmallInternal()Z

    move-result v0

    if-nez v0, :cond_15

    .line 95
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Test failed: OutOfMemoryError not thrown while filling heap"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :cond_15
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "testOomeSmall succeeded"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 99
    return-void
.end method

.method private static testOomeSmallInternal()Z
    .registers 6

    .prologue
    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 64
    new-instance v4, Ljava/util/LinkedList;

    invoke-direct {v4}, Ljava/util/LinkedList;-><init>()V

    .line 68
    const/high16 v2, 0x10

    move v3, v2

    .line 69
    :goto_a
    const/16 v2, 0x18

    if-lt v3, v2, :cond_29

    move v2, v0

    .line 72
    :goto_f
    const/high16 v5, 0x100

    :try_start_11
    div-int/2addr v5, v3

    if-ge v2, v5, :cond_1c

    .line 73
    new-array v5, v3, [B

    invoke-virtual {v4, v5}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z
    :try_end_19
    .catch Ljava/lang/OutOfMemoryError; {:try_start_11 .. :try_end_19} :catch_20

    .line 72
    add-int/lit8 v2, v2, 0x1

    goto :goto_f

    :cond_1c
    move v2, v0

    .line 79
    :goto_1d
    if-nez v2, :cond_23

    .line 86
    :goto_1f
    return v0

    .line 75
    :catch_20
    move-exception v2

    move v2, v1

    .line 76
    goto :goto_1d

    .line 83
    :cond_23
    mul-int/lit8 v2, v3, 0x4

    div-int/lit8 v2, v2, 0x5

    move v3, v2

    .line 84
    goto :goto_a

    :cond_29
    move v0, v1

    .line 86
    goto :goto_1f
.end method
