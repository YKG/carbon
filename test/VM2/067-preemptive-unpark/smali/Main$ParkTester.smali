.class LMain$ParkTester;
.super Ljava/lang/Thread;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ParkTester"
.end annotation


# instance fields
.field public volatile parkNow:Z

.field public volatile success:Z


# direct methods
.method private constructor <init>()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 81
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 82
    iput-boolean v0, p0, LMain$ParkTester;->parkNow:Z

    .line 83
    iput-boolean v0, p0, LMain$ParkTester;->success:Z

    return-void
.end method

.method synthetic constructor <init>(LMain$1;)V
    .registers 2
    .parameter

    .prologue
    .line 81
    invoke-direct {p0}, LMain$ParkTester;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 7

    .prologue
    const/4 v5, 0x0

    .line 86
    :goto_1
    iget-boolean v0, p0, LMain$ParkTester;->parkNow:Z

    if-nez v0, :cond_d

    .line 88
    const-wide/16 v0, 0x1f4

    :try_start_7
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_a
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_a} :catch_b

    goto :goto_1

    .line 89
    :catch_b
    move-exception v0

    goto :goto_1

    .line 94
    :cond_d
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 95
    invoke-static {}, LMain;->access$100()Lsun/misc/Unsafe;

    move-result-object v2

    const-wide/32 v3, 0x1dcd6500

    invoke-virtual {v2, v5, v3, v4}, Lsun/misc/Unsafe;->park(ZJ)V

    .line 96
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    sub-long v0, v2, v0

    .line 98
    const-wide/16 v2, 0xc8

    cmp-long v2, v0, v2

    if-lez v2, :cond_48

    .line 99
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "park()ed for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " msec"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 100
    iput-boolean v5, p0, LMain$ParkTester;->success:Z

    .line 105
    :goto_47
    return-void

    .line 102
    :cond_48
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "park() returned quickly"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 103
    const/4 v0, 0x1

    iput-boolean v0, p0, LMain$ParkTester;->success:Z

    goto :goto_47
.end method
