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
    .registers 7
    .parameter

    .prologue
    .line 23
    const-wide/16 v0, 0x0

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x0

    :try_start_6
    invoke-static/range {v0 .. v5}, LMain;->stackOverflowTestSub(DDD)V
    :try_end_9
    .catch Ljava/lang/StackOverflowError; {:try_start_6 .. :try_end_9} :catch_11

    .line 28
    :goto_9
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "SOE test done"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 29
    return-void

    .line 25
    :catch_11
    move-exception v0

    .line 26
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "caught SOE"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_9
.end method

.method private static stackOverflowTestSub(DDD)V
    .registers 6
    .parameter
    .parameter
    .parameter

    .prologue
    .line 33
    invoke-static/range {p0 .. p5}, LMain;->stackOverflowTestSub(DDD)V

    .line 34
    return-void
.end method
