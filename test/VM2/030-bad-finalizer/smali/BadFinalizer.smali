.class public LBadFinalizer;
.super Ljava/lang/Object;
.source "BadFinalizer.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static snooze(I)V
    .registers 5
    .parameter

    .prologue
    .line 9
    int-to-long v0, p0

    :try_start_1
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_4} :catch_5

    .line 13
    :goto_4
    return-void

    .line 10
    :catch_5
    move-exception v0

    .line 11
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Snooze: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_4
.end method


# virtual methods
.method protected finalize()V
    .registers 4

    .prologue
    const/4 v0, 0x0

    .line 16
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Finalizer started and spinning..."

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 21
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move v1, v0

    .line 22
    :goto_c
    const v2, 0xf4240

    if-ge v0, v2, :cond_16

    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 22
    add-int/lit8 v0, v0, 0x1

    goto :goto_c

    .line 24
    :cond_16
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 25
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Finalizer done spinning."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 27
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Finalizer sleeping forever now."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 29
    :goto_27
    const/16 v0, 0x2710

    invoke-static {v0}, LBadFinalizer;->snooze(I)V

    goto :goto_27
.end method
