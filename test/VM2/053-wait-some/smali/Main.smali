.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# static fields
.field private static final DELAYS:[J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 8
    const/4 v0, 0x6

    new-array v0, v0, [J

    fill-array-data v0, :array_a

    sput-object v0, LMain;->DELAYS:[J

    return-void

    nop

    :array_a
    .array-data 0x8
        0xc8t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
        0xf4t 0x1t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
        0xe8t 0x3t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
        0xd0t 0x7t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
        0xact 0xdt 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
        0x40t 0x1ft 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doit(Z)V
    .registers 13
    .parameter

    .prologue
    .line 18
    new-instance v3, Ljava/lang/Object;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 21
    monitor-enter v3

    .line 23
    const-wide/16 v0, -0x1f4

    :try_start_8
    invoke-virtual {v3, v0, v1}, Ljava/lang/Object;->wait(J)V

    .line 24
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "HEY: didn\'t throw on negative arg"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V
    :try_end_12
    .catchall {:try_start_8 .. :try_end_12} :catchall_8f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8 .. :try_end_12} :catch_86
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_12} :catch_92

    .line 31
    :goto_12
    :try_start_12
    sget-object v4, LMain;->DELAYS:[J

    array-length v5, v4

    const/4 v0, 0x0

    move v2, v0

    :goto_17
    if-ge v2, v5, :cond_c5

    aget-wide v6, v4, v2

    .line 32
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Waiting for "

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v8, "ms..."

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 34
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_3c
    .catchall {:try_start_12 .. :try_end_3c} :catchall_8f

    move-result-wide v0

    .line 36
    :try_start_3d
    invoke-virtual {v3, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_40
    .catchall {:try_start_3d .. :try_end_40} :catchall_8f
    .catch Ljava/lang/InterruptedException; {:try_start_3d .. :try_end_40} :catch_98

    .line 40
    :goto_40
    :try_start_40
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    .line 42
    sub-long/2addr v8, v0

    .line 45
    if-nez p0, :cond_c7

    .line 46
    const-wide/16 v0, 0xa

    div-long v0, v6, v0

    .line 47
    const-wide/16 v10, 0x32

    cmp-long v10, v0, v10

    if-lez v10, :cond_53

    .line 48
    const-wide/16 v0, 0x32

    .line 51
    :cond_53
    sub-long v10, v6, v0

    .line 52
    add-long/2addr v0, v6

    .line 54
    cmp-long v6, v8, v10

    if-gez v6, :cond_9d

    .line 55
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "  Elapsed time was too short"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 56
    const/4 v0, 0x1

    .line 64
    :goto_62
    if-eqz v0, :cond_82

    .line 65
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "  Wall clock elapsed "

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v6, "ms"

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 31
    :cond_82
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_17

    .line 25
    :catch_86
    move-exception v0

    .line 26
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Caught expected exception on neg arg"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_12

    .line 69
    :catchall_8f
    move-exception v0

    monitor-exit v3
    :try_end_91
    .catchall {:try_start_40 .. :try_end_91} :catchall_8f

    throw v0

    .line 27
    :catch_92
    move-exception v0

    .line 28
    :try_start_93
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_12

    .line 37
    :catch_98
    move-exception v8

    .line 38
    invoke-virtual {v8}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_40

    .line 57
    :cond_9d
    cmp-long v6, v8, v0

    if-lez v6, :cond_c7

    .line 58
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "  Elapsed time was too long: elapsed="

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v10, " max="

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 60
    const/4 v0, 0x1

    goto :goto_62

    .line 69
    :cond_c5
    monitor-exit v3
    :try_end_c6
    .catchall {:try_start_93 .. :try_end_c6} :catchall_8f

    .line 70
    return-void

    :cond_c7
    move v0, p0

    goto :goto_62
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5
    .parameter

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 13
    array-length v2, p0

    if-lt v2, v0, :cond_13

    aget-object v2, p0, v1

    const-string v3, "--timing"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 14
    :goto_f
    invoke-static {v0}, LMain;->doit(Z)V

    .line 15
    return-void

    :cond_13
    move v0, v1

    .line 13
    goto :goto_f
.end method
