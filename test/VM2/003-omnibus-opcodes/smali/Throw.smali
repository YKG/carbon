.class public LThrow;
.super Ljava/lang/Object;
.source "Throw.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 20
    const-class v0, LThrow;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LThrow;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static run()V
    .registers 1

    .prologue
    .line 117
    new-instance v0, LThrow;

    invoke-direct {v0}, LThrow;-><init>()V

    .line 119
    invoke-virtual {v0}, LThrow;->one()V

    .line 120
    invoke-virtual {v0}, LThrow;->twoA()V

    .line 121
    invoke-virtual {v0}, LThrow;->twoN()V

    .line 122
    invoke-virtual {v0}, LThrow;->rethrow()V

    .line 123
    return-void
.end method


# virtual methods
.method public one()V
    .registers 3

    .prologue
    .line 30
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Throw.one"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 32
    :try_start_7
    invoke-virtual {p0}, LThrow;->throwNullPointerException()V

    .line 33
    sget-boolean v0, LThrow;->$assertionsDisabled:Z

    if-nez v0, :cond_16

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_14} :catch_14

    .line 34
    :catch_14
    move-exception v0

    .line 40
    :cond_15
    return-void

    .line 39
    :cond_16
    sget-boolean v0, LThrow;->$assertionsDisabled:Z

    if-nez v0, :cond_15

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method public rethrow()V
    .registers 5

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 87
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Throw.rethrow"

    invoke-virtual {v0, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 94
    :try_start_9
    invoke-virtual {p0}, LThrow;->throwNullPointerException()V

    .line 95
    sget-boolean v0, LThrow;->$assertionsDisabled:Z

    if-nez v0, :cond_3f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_16
    .catchall {:try_start_9 .. :try_end_16} :catchall_25
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_16} :catch_16

    .line 96
    :catch_16
    move-exception v0

    .line 97
    :try_start_17
    instance-of v3, v0, Ljava/lang/ArithmeticException;

    if-eqz v3, :cond_35

    .line 98
    sget-boolean v3, LThrow;->$assertionsDisabled:Z

    if-nez v3, :cond_35

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_25
    .catchall {:try_start_17 .. :try_end_25} :catchall_25

    .line 105
    :catchall_25
    move-exception v0

    :goto_26
    :try_start_26
    throw v0
    :try_end_27
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_27} :catch_27

    .line 107
    :catch_27
    move-exception v0

    move v0, v2

    .line 111
    :goto_29
    sget-boolean v2, LThrow;->$assertionsDisabled:Z

    if-nez v2, :cond_41

    if-nez v1, :cond_41

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 100
    :cond_35
    :try_start_35
    instance-of v3, v0, Ljava/lang/NullPointerException;
    :try_end_37
    .catchall {:try_start_35 .. :try_end_37} :catchall_25

    if-eqz v3, :cond_3f

    .line 102
    :try_start_39
    check-cast v0, Ljava/lang/NullPointerException;

    throw v0
    :try_end_3c
    .catchall {:try_start_39 .. :try_end_3c} :catchall_3c

    .line 105
    :catchall_3c
    move-exception v0

    move v1, v2

    goto :goto_26

    :cond_3f
    move v0, v1

    .line 109
    goto :goto_29

    .line 112
    :cond_41
    sget-boolean v1, LThrow;->$assertionsDisabled:Z

    if-nez v1, :cond_45

    .line 113
    :cond_45
    sget-boolean v1, LThrow;->$assertionsDisabled:Z

    if-nez v1, :cond_51

    if-nez v0, :cond_51

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 114
    :cond_51
    return-void
.end method

.method public throwArithmeticException()V
    .registers 2

    .prologue
    .line 26
    new-instance v0, Ljava/lang/ArithmeticException;

    invoke-direct {v0}, Ljava/lang/ArithmeticException;-><init>()V

    throw v0
.end method

.method public throwNullPointerException()V
    .registers 3

    .prologue
    .line 22
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "npe!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public twoA()V
    .registers 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 43
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Throw.twoA"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 50
    :try_start_9
    invoke-virtual {p0}, LThrow;->throwArithmeticException()V
    :try_end_c
    .catch Ljava/lang/ArithmeticException; {:try_start_9 .. :try_end_c} :catch_19
    .catch Ljava/lang/NullPointerException; {:try_start_9 .. :try_end_c} :catch_1d

    move v2, v1

    .line 59
    :goto_d
    sget-boolean v3, LThrow;->$assertionsDisabled:Z

    if-nez v3, :cond_23

    if-nez v2, :cond_23

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 52
    :catch_19
    move-exception v2

    move v2, v0

    move v0, v1

    .line 53
    goto :goto_d

    .line 55
    :catch_1d
    move-exception v2

    move v2, v1

    move v4, v1

    move v1, v0

    move v0, v4

    .line 56
    goto :goto_d

    .line 60
    :cond_23
    sget-boolean v2, LThrow;->$assertionsDisabled:Z

    if-nez v2, :cond_2f

    if-eqz v1, :cond_2f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 61
    :cond_2f
    sget-boolean v1, LThrow;->$assertionsDisabled:Z

    if-nez v1, :cond_3b

    if-eqz v0, :cond_3b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 62
    :cond_3b
    return-void
.end method

.method public twoN()V
    .registers 6

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 65
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Throw.twoN"

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 72
    :try_start_9
    invoke-virtual {p0}, LThrow;->throwNullPointerException()V
    :try_end_c
    .catch Ljava/lang/ArithmeticException; {:try_start_9 .. :try_end_c} :catch_19
    .catch Ljava/lang/NullPointerException; {:try_start_9 .. :try_end_c} :catch_1d

    move v2, v1

    .line 81
    :goto_d
    sget-boolean v3, LThrow;->$assertionsDisabled:Z

    if-nez v3, :cond_23

    if-eqz v2, :cond_23

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 74
    :catch_19
    move-exception v2

    move v2, v0

    move v0, v1

    .line 75
    goto :goto_d

    .line 77
    :catch_1d
    move-exception v2

    move v2, v1

    move v4, v1

    move v1, v0

    move v0, v4

    .line 78
    goto :goto_d

    .line 82
    :cond_23
    sget-boolean v2, LThrow;->$assertionsDisabled:Z

    if-nez v2, :cond_2f

    if-nez v1, :cond_2f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 83
    :cond_2f
    sget-boolean v1, LThrow;->$assertionsDisabled:Z

    if-nez v1, :cond_3b

    if-eqz v0, :cond_3b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 84
    :cond_3b
    return-void
.end method
