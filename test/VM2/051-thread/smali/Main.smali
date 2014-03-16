.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LMain$MyThread;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    return-void
.end method

.method public static go()V
    .registers 6

    .prologue
    .line 23
    new-instance v0, Ljava/lang/Thread;

    const/4 v1, 0x0

    new-instance v2, LThreadTestSub;

    invoke-direct {v2}, LThreadTestSub;-><init>()V

    const-string v3, "Thready"

    const-wide/16 v4, 0x1c00

    invoke-direct/range {v0 .. v5}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;Ljava/lang/String;J)V

    .line 25
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 27
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Starting thread \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'\n"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 28
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 31
    :try_start_38
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_3b
    .catch Ljava/lang/InterruptedException; {:try_start_38 .. :try_end_3b} :catch_43

    .line 36
    :goto_3b
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Thread starter returning\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 37
    return-void

    .line 32
    :catch_43
    move-exception v0

    .line 33
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_3b
.end method

.method public static main([Ljava/lang/String;)V
    .registers 4
    .parameter

    .prologue
    .line 8
    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0x200

    if-ge v0, v1, :cond_1a

    .line 9
    new-instance v1, LMain$MyThread;

    invoke-direct {v1}, LMain$MyThread;-><init>()V

    .line 10
    invoke-virtual {v1}, LMain$MyThread;->start()V

    .line 12
    const-wide/16 v1, 0x1

    :try_start_f
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_12
    .catch Ljava/lang/InterruptedException; {:try_start_f .. :try_end_12} :catch_15

    .line 8
    :goto_12
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 13
    :catch_15
    move-exception v1

    .line 14
    invoke-virtual {v1}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_12

    .line 18
    :cond_1a
    invoke-static {}, LMain;->go()V

    .line 19
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "thread test done"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 20
    return-void
.end method
