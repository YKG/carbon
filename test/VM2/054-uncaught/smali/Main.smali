.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LMain$Helper;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    return-void
.end method

.method static catchTheUncaught(I)V
    .registers 6
    .parameter

    .prologue
    .line 27
    new-instance v0, LThreadDeathHandler;

    const-string v1, "DEFAULT"

    invoke-direct {v0, v1}, LThreadDeathHandler;-><init>(Ljava/lang/String;)V

    .line 28
    new-instance v1, LThreadDeathHandler;

    const-string v2, "THREAD"

    invoke-direct {v1, v2}, LThreadDeathHandler;-><init>(Ljava/lang/String;)V

    .line 30
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Test "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 31
    packed-switch p0, :pswitch_data_48

    .line 49
    :goto_29
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "Hi diddly-ho, neighborino."

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 33
    :pswitch_31
    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    goto :goto_29

    .line 37
    :pswitch_35
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    goto :goto_29

    .line 42
    :pswitch_3d
    invoke-static {v0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 43
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    goto :goto_29

    .line 31
    :pswitch_data_48
    .packed-switch 0x1
        :pswitch_31
        :pswitch_35
        :pswitch_3d
    .end packed-switch
.end method

.method public static main([Ljava/lang/String;)V
    .registers 3
    .parameter

    .prologue
    const/4 v1, 0x1

    .line 8
    invoke-static {v1}, LMain;->testThread(I)V

    .line 9
    const/4 v0, 0x2

    invoke-static {v0}, LMain;->testThread(I)V

    .line 10
    const/4 v0, 0x3

    invoke-static {v0}, LMain;->testThread(I)V

    .line 12
    invoke-static {v1}, LMain;->catchTheUncaught(I)V

    .line 13
    return-void
.end method

.method private static testThread(I)V
    .registers 2
    .parameter

    .prologue
    .line 16
    new-instance v0, LMain$Helper;

    invoke-direct {v0, p0}, LMain$Helper;-><init>(I)V

    .line 17
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 20
    :try_start_8
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_b
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_b} :catch_c

    .line 24
    :goto_b
    return-void

    .line 21
    :catch_c
    move-exception v0

    .line 22
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_b
.end method
