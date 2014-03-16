.class LUnresTest2;
.super Ljava/lang/Object;
.source "UnresTest2.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 4
    const-class v0, LUnresTest2;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LUnresTest2;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static checkCasts(Ljava/lang/Object;)Z
    .registers 4
    .parameter

    .prologue
    .line 9
    const/4 v2, 0x0

    .line 12
    :try_start_1
    move-object v0, p0

    check-cast v0, LUnresClass;

    move-object v1, v0

    .line 13
    sget-boolean v1, LUnresTest2;->$assertionsDisabled:Z

    if-nez v1, :cond_10

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_f
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_f} :catch_f

    .line 14
    :catch_f
    move-exception v1

    .line 18
    :cond_10
    :try_start_10
    instance-of v1, p0, LUnresClass;
    :try_end_12
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_10 .. :try_end_12} :catch_1e

    .line 19
    :try_start_12
    sget-boolean v2, LUnresTest2;->$assertionsDisabled:Z

    if-nez v2, :cond_1d

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
    :try_end_1c
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_12 .. :try_end_1c} :catch_1c

    .line 20
    :catch_1c
    move-exception v2

    .line 24
    :cond_1d
    :goto_1d
    return v1

    .line 20
    :catch_1e
    move-exception v1

    move v1, v2

    goto :goto_1d
.end method

.method public static run()V
    .registers 2

    .prologue
    .line 28
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "UnresTest2..."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 30
    new-instance v0, LUnresStuff;

    invoke-direct {v0}, LUnresStuff;-><init>()V

    .line 33
    :try_start_c
    new-instance v1, LUnresClass;

    invoke-direct {v1}, LUnresClass;-><init>()V

    .line 34
    sget-boolean v1, LUnresTest2;->$assertionsDisabled:Z

    if-nez v1, :cond_1c

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_1b
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_c .. :try_end_1b} :catch_1b

    .line 35
    :catch_1b
    move-exception v1

    .line 40
    :cond_1c
    const/4 v1, 0x3

    :try_start_1d
    new-array v1, v1, [LUnresClass;

    .line 41
    sget-boolean v1, LUnresTest2;->$assertionsDisabled:Z

    if-nez v1, :cond_2a

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_29
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1d .. :try_end_29} :catch_29

    .line 42
    :catch_29
    move-exception v1

    .line 46
    :cond_2a
    invoke-static {v0}, LUnresTest2;->checkCasts(Ljava/lang/Object;)Z

    .line 47
    return-void
.end method
