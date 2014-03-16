.class public LMonitor;
.super Ljava/lang/Object;
.source "Monitor.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static mVal:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    const/4 v1, 0x0

    .line 8
    const-class v0, LMonitor;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_f

    const/4 v0, 0x1

    :goto_a
    sput-boolean v0, LMonitor;->$assertionsDisabled:Z

    .line 9
    sput v1, LMonitor;->mVal:I

    return-void

    :cond_f
    move v0, v1

    .line 8
    goto :goto_a
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static run()V
    .registers 2

    .prologue
    .line 22
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Monitor.run"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 24
    const/4 v1, 0x0

    .line 27
    :try_start_8
    monitor-enter v1
    :try_end_9
    .catch Ljava/lang/NullPointerException; {:try_start_8 .. :try_end_9} :catch_1a

    .line 28
    :try_start_9
    sget v0, LMonitor;->mVal:I

    add-int/lit8 v0, v0, 0x1

    sput v0, LMonitor;->mVal:I

    .line 29
    monitor-exit v1
    :try_end_10
    .catchall {:try_start_9 .. :try_end_10} :catchall_3f

    .line 30
    :try_start_10
    sget-boolean v0, LMonitor;->$assertionsDisabled:Z

    if-nez v0, :cond_1b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_1a
    .catch Ljava/lang/NullPointerException; {:try_start_10 .. :try_end_1a} :catch_1a

    .line 31
    :catch_1a
    move-exception v0

    .line 35
    :cond_1b
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 36
    monitor-enter v1

    .line 37
    :try_start_21
    sget v0, LMonitor;->mVal:I

    add-int/lit8 v0, v0, 0x1

    sput v0, LMonitor;->mVal:I

    .line 38
    monitor-exit v1
    :try_end_28
    .catchall {:try_start_21 .. :try_end_28} :catchall_42

    .line 40
    new-instance v0, LMonitor;

    invoke-direct {v0}, LMonitor;-><init>()V

    invoke-virtual {v0}, LMonitor;->subTest()V

    .line 42
    sget-boolean v0, LMonitor;->$assertionsDisabled:Z

    if-nez v0, :cond_45

    sget v0, LMonitor;->mVal:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_45

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 29
    :catchall_3f
    move-exception v0

    :try_start_40
    monitor-exit v1
    :try_end_41
    .catchall {:try_start_40 .. :try_end_41} :catchall_3f

    :try_start_41
    throw v0
    :try_end_42
    .catch Ljava/lang/NullPointerException; {:try_start_41 .. :try_end_42} :catch_1a

    .line 38
    :catchall_42
    move-exception v0

    :try_start_43
    monitor-exit v1
    :try_end_44
    .catchall {:try_start_43 .. :try_end_44} :catchall_42

    throw v0

    .line 43
    :cond_45
    return-void
.end method


# virtual methods
.method public declared-synchronized subTest()V
    .registers 4

    .prologue
    .line 12
    monitor-enter p0

    :try_start_1
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 13
    monitor-enter v1
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_1d

    .line 14
    :try_start_7
    sget v0, LMonitor;->mVal:I

    add-int/lit8 v0, v0, 0x1

    sput v0, LMonitor;->mVal:I

    .line 15
    const/4 v0, 0x0

    .line 16
    sget-boolean v2, LMonitor;->$assertionsDisabled:Z

    if-nez v2, :cond_20

    if-eqz v0, :cond_20

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 17
    :catchall_1a
    move-exception v0

    monitor-exit v1
    :try_end_1c
    .catchall {:try_start_7 .. :try_end_1c} :catchall_1a

    :try_start_1c
    throw v0
    :try_end_1d
    .catchall {:try_start_1c .. :try_end_1d} :catchall_1d

    .line 12
    :catchall_1d
    move-exception v0

    monitor-exit p0

    throw v0

    .line 17
    :cond_20
    :try_start_20
    monitor-exit v1
    :try_end_21
    .catchall {:try_start_20 .. :try_end_21} :catchall_1a

    .line 18
    monitor-exit p0

    return-void
.end method
