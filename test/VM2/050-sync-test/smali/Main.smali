.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static countTest()V
    .registers 5

    .prologue
    .line 37
    new-instance v0, LCpuThread;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, LCpuThread;-><init>(I)V

    .line 38
    new-instance v1, LCpuThread;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, LCpuThread;-><init>(I)V

    .line 40
    invoke-virtual {v0}, LCpuThread;->start()V

    .line 41
    invoke-virtual {v1}, LCpuThread;->start()V

    .line 44
    const-wide/16 v2, 0x64

    :try_start_14
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_17
    .catch Ljava/lang/InterruptedException; {:try_start_14 .. :try_end_17} :catch_25

    .line 54
    :goto_17
    :try_start_17
    invoke-virtual {v0}, LCpuThread;->join()V

    .line 55
    invoke-virtual {v1}, LCpuThread;->join()V
    :try_end_1d
    .catch Ljava/lang/InterruptedException; {:try_start_17 .. :try_end_1d} :catch_31

    .line 61
    :goto_1d
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "main: all done"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 62
    return-void

    .line 46
    :catch_25
    move-exception v2

    .line 47
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "INTERRUPT!"

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 48
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_17

    .line 57
    :catch_31
    move-exception v0

    .line 58
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "INTERRUPT!"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 59
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1d
.end method

.method static interruptTest()V
    .registers 3

    .prologue
    .line 67
    new-instance v0, LSleepyThread;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, LSleepyThread;-><init>(LSleepyThread;)V

    .line 68
    new-instance v1, LSleepyThread;

    invoke-direct {v1, v0}, LSleepyThread;-><init>(LSleepyThread;)V

    .line 70
    const/4 v2, 0x4

    invoke-virtual {v0, v2}, LSleepyThread;->setPriority(I)V

    .line 71
    invoke-virtual {v0}, LSleepyThread;->start()V

    .line 72
    invoke-virtual {v1}, LSleepyThread;->start()V

    .line 73
    const/4 v0, 0x3

    invoke-virtual {v1, v0}, LSleepyThread;->setPriority(I)V

    .line 74
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 3
    .parameter

    .prologue
    .line 12
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Sleep Test"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 13
    invoke-static {}, LMain;->sleepTest()V

    .line 15
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\nCount Test"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 16
    invoke-static {}, LMain;->countTest()V

    .line 18
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\nInterrupt Test"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 19
    invoke-static {}, LMain;->interruptTest()V

    .line 20
    return-void
.end method

.method static sleepTest()V
    .registers 3

    .prologue
    .line 23
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "GOING"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 25
    const-wide/16 v0, 0x3e8

    :try_start_9
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_9 .. :try_end_c} :catch_14

    .line 31
    :goto_c
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "GONE"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 32
    return-void

    .line 27
    :catch_14
    move-exception v0

    .line 28
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "INTERRUPT!"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 29
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_c
.end method
