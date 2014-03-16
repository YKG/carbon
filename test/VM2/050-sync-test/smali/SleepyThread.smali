.class LSleepyThread;
.super Ljava/lang/Thread;
.source "Main.java"


# static fields
.field private static count:I


# instance fields
.field private mOther:LSleepyThread;

.field private mWaitOnMe:[Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 126
    const/4 v0, 0x0

    sput v0, LSleepyThread;->count:I

    return-void
.end method

.method constructor <init>(LSleepyThread;)V
    .registers 7
    .parameter

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    .line 128
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 129
    iput-object p1, p0, LSleepyThread;->mOther:LSleepyThread;

    .line 130
    new-array v0, v4, [Ljava/lang/Integer;

    const/4 v1, 0x0

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v3

    iput-object v0, p0, LSleepyThread;->mWaitOnMe:[Ljava/lang/Integer;

    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "thread#"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, LSleepyThread;->count:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, LSleepyThread;->setName(Ljava/lang/String;)V

    .line 133
    sget v0, LSleepyThread;->count:I

    add-int/lit8 v0, v0, 0x1

    sput v0, LSleepyThread;->count:I

    .line 134
    return-void
.end method


# virtual methods
.method public run()V
    .registers 6

    .prologue
    .line 137
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "SleepyThread.run starting"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 146
    iget-object v0, p0, LSleepyThread;->mOther:LSleepyThread;

    if-nez v0, :cond_56

    .line 147
    const/4 v1, 0x0

    .line 150
    :try_start_c
    iget-object v2, p0, LSleepyThread;->mWaitOnMe:[Ljava/lang/Integer;

    monitor-enter v2
    :try_end_f
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_f} :catch_25
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_f} :catch_50

    .line 151
    :try_start_f
    iget-object v0, p0, LSleepyThread;->mWaitOnMe:[Ljava/lang/Integer;

    const-wide/16 v3, 0x2328

    invoke-virtual {v0, v3, v4}, Ljava/lang/Object;->wait(J)V

    .line 152
    monitor-exit v2
    :try_end_17
    .catchall {:try_start_f .. :try_end_17} :catchall_22

    move v0, v1

    .line 164
    :goto_18
    if-nez v0, :cond_21

    .line 165
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "NOT INTERRUPTED"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 178
    :cond_21
    :goto_21
    return-void

    .line 152
    :catchall_22
    move-exception v0

    :try_start_23
    monitor-exit v2
    :try_end_24
    .catchall {:try_start_23 .. :try_end_24} :catchall_22

    :try_start_24
    throw v0
    :try_end_25
    .catch Ljava/lang/InterruptedException; {:try_start_24 .. :try_end_25} :catch_25
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_25} :catch_50

    .line 154
    :catch_25
    move-exception v0

    .line 156
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " interrupted, flag="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 158
    const/4 v0, 0x1

    .line 162
    goto :goto_18

    .line 160
    :catch_50
    move-exception v0

    .line 161
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move v0, v1

    goto :goto_18

    .line 168
    :cond_56
    const-wide/16 v0, 0x7d0

    :try_start_58
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5b
    .catch Ljava/lang/InterruptedException; {:try_start_58 .. :try_end_5b} :catch_85

    .line 174
    :goto_5b
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "interrupting other (isAlive="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, LSleepyThread;->mOther:LSleepyThread;

    invoke-virtual {v2}, LSleepyThread;->isAlive()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 176
    iget-object v0, p0, LSleepyThread;->mOther:LSleepyThread;

    invoke-virtual {v0}, LSleepyThread;->interrupt()V

    goto :goto_21

    .line 170
    :catch_85
    move-exception v0

    .line 171
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "PESKY INTERRUPTED?"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_5b
.end method
