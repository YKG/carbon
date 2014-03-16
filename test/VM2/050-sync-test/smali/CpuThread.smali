.class LCpuThread;
.super Ljava/lang/Thread;
.source "Main.java"


# static fields
.field static mCount:I

.field static mSyncable:Ljava/lang/Object;


# instance fields
.field mNumber:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 78
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, LCpuThread;->mSyncable:Ljava/lang/Object;

    .line 79
    const/4 v0, 0x0

    sput v0, LCpuThread;->mCount:I

    return-void
.end method

.method constructor <init>(I)V
    .registers 4
    .parameter

    .prologue
    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CpuThread "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 84
    iput p1, p0, LCpuThread;->mNumber:I

    .line 85
    return-void
.end method


# virtual methods
.method output(I)V
    .registers 6
    .parameter

    .prologue
    .line 103
    sget-object v1, LCpuThread;->mSyncable:Ljava/lang/Object;

    monitor-enter v1

    .line 107
    :try_start_3
    sget v2, LCpuThread;->mCount:I

    .line 109
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "going: "

    invoke-virtual {v0, v3}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 110
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p1}, Ljava/io/PrintStream;->println(I)V

    .line 113
    const/4 v0, 0x0

    :goto_12
    const/16 v3, 0x1388

    if-ge v0, v3, :cond_19

    add-int/lit8 v0, v0, 0x1

    goto :goto_12

    .line 116
    :cond_19
    add-int/lit8 v0, v2, 0x1

    .line 117
    sput v0, LCpuThread;->mCount:I

    .line 118
    monitor-exit v1

    .line 119
    return-void

    .line 118
    :catchall_1f
    move-exception v0

    monitor-exit v1
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_1f

    throw v0
.end method

.method public run()V
    .registers 3

    .prologue
    .line 91
    const/4 v0, 0x0

    :goto_1
    const/16 v1, 0xa

    if-ge v0, v1, :cond_d

    .line 92
    iget v1, p0, LCpuThread;->mNumber:I

    invoke-virtual {p0, v1}, LCpuThread;->output(I)V

    .line 91
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 95
    :cond_d
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Final result: "

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 96
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    sget v1, LCpuThread;->mCount:I

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(I)V

    .line 97
    return-void
.end method
