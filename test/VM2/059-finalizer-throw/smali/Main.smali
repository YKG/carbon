.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# static fields
.field static volatile didFinal:Z

.field static waiter:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 9
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, LMain;->waiter:Ljava/lang/Object;

    .line 10
    const/4 v0, 0x0

    sput-boolean v0, LMain;->didFinal:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static createAndForget()V
    .registers 1

    .prologue
    .line 13
    new-instance v0, LMain;

    invoke-direct {v0}, LMain;-><init>()V

    .line 14
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 3
    .parameter

    .prologue
    .line 17
    invoke-static {}, LMain;->createAndForget()V

    .line 19
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 20
    invoke-static {}, Ljava/lang/System;->runFinalization()V

    .line 22
    :goto_9
    sget-boolean v0, LMain;->didFinal:Z

    if-nez v0, :cond_1a

    .line 24
    const-wide/16 v0, 0x1f4

    :try_start_f
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_12
    .catch Ljava/lang/InterruptedException; {:try_start_f .. :try_end_12} :catch_13

    goto :goto_9

    .line 25
    :catch_13
    move-exception v0

    .line 26
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_9

    .line 32
    :cond_1a
    const-wide/16 v0, 0x2ee

    :try_start_1c
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1f
    .catch Ljava/lang/InterruptedException; {:try_start_1c .. :try_end_1f} :catch_27

    .line 37
    :goto_1f
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "done"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 38
    return-void

    .line 33
    :catch_27
    move-exception v0

    .line 34
    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    goto :goto_1f
.end method


# virtual methods
.method protected finalize()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 41
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "In finalizer"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 43
    const/4 v0, 0x1

    sput-boolean v0, LMain;->didFinal:Z

    .line 45
    new-instance v0, Ljava/lang/InterruptedException;

    const-string v1, "whee"

    invoke-direct {v0, v1}, Ljava/lang/InterruptedException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
