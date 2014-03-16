.class public LMethodCall;
.super LMethodCallBase;
.source "MethodCall.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 20
    const-class v0, LMethodCall;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LMethodCall;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>()V
    .registers 3

    .prologue
    .line 22
    invoke-direct {p0}, LMethodCallBase;-><init>()V

    .line 23
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "  MethodCall ctor"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 24
    return-void
.end method

.method private directly()V
    .registers 1

    .prologue
    .line 34
    return-void
.end method

.method static manyArgs(IJIJIJIIDFDSICIIBZIIJJIIIII[[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V
    .registers 42
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 45
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "MethodCalls.manyArgs"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 46
    sget-boolean v1, LMethodCall;->$assertionsDisabled:Z

    if-nez v1, :cond_13

    if-eqz p0, :cond_13

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 47
    :cond_13
    sget-boolean v1, LMethodCall;->$assertionsDisabled:Z

    if-nez v1, :cond_35

    move/from16 v0, p13

    float-to-double v1, v0

    const-wide v3, 0x4021fae147ae147bL

    cmpl-double v1, v1, v3

    if-lez v1, :cond_2f

    move/from16 v0, p13

    float-to-double v1, v0

    const-wide v3, 0x4022051eb851eb85L

    cmpg-double v1, v1, v3

    if-ltz v1, :cond_35

    :cond_2f
    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 48
    :cond_35
    sget-boolean v1, LMethodCall;->$assertionsDisabled:Z

    if-nez v1, :cond_45

    const/16 v1, -0x10

    move/from16 v0, p21

    if-eq v0, v1, :cond_45

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 49
    :cond_45
    sget-boolean v1, LMethodCall;->$assertionsDisabled:Z

    if-nez v1, :cond_55

    const/16 v1, 0x19

    move/from16 v0, p32

    if-eq v0, v1, :cond_55

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 50
    :cond_55
    sget-boolean v1, LMethodCall;->$assertionsDisabled:Z

    if-nez v1, :cond_69

    const-string v1, "twenty nine"

    move-object/from16 v0, p36

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_69

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 51
    :cond_69
    return-void
.end method

.method public static run()V
    .registers 37

    .prologue
    .line 54
    new-instance v0, LMethodCall;

    invoke-direct {v0}, LMethodCall;-><init>()V

    .line 57
    invoke-virtual {v0}, LMethodCallBase;->tryThing()I

    .line 58
    invoke-virtual {v0}, LMethodCall;->tryThing()I

    .line 60
    const/4 v0, 0x0

    .line 62
    :try_start_c
    invoke-direct {v0}, LMethodCall;->directly()V

    .line 63
    sget-boolean v0, LMethodCall;->$assertionsDisabled:Z

    if-nez v0, :cond_1a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_19
    .catch Ljava/lang/NullPointerException; {:try_start_c .. :try_end_19} :catch_19

    .line 64
    :catch_19
    move-exception v0

    .line 68
    :cond_1a
    const/4 v0, 0x0

    const-wide/16 v1, 0x1

    const/4 v3, 0x2

    const-wide/16 v4, 0x3

    const/4 v6, 0x4

    const-wide/16 v7, 0x5

    const/4 v9, 0x6

    const/4 v10, 0x7

    const-wide/high16 v11, 0x4020

    const/high16 v13, 0x4110

    const-wide/high16 v14, 0x4024

    const/16 v16, 0xb

    const/16 v17, 0xc

    const/16 v18, 0xd

    const/16 v19, 0xe

    const/16 v20, 0xf

    const/16 v21, -0x10

    const/16 v22, 0x1

    const/16 v23, 0x12

    const/16 v24, 0x13

    const-wide/16 v25, 0x14

    const-wide/16 v27, 0x15

    const/16 v29, 0x16

    const/16 v30, 0x17

    const/16 v31, 0x18

    const/16 v32, 0x19

    const/16 v33, 0x1a

    const/16 v34, 0x0

    check-cast v34, [[Ljava/lang/String;

    const/16 v35, 0x0

    const-string v36, "twenty nine"

    invoke-static/range {v0 .. v36}, LMethodCall;->manyArgs(IJIJIJIIDFDSICIIBZIIJJIIIII[[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    return-void
.end method


# virtual methods
.method tryThing()I
    .registers 3

    .prologue
    .line 28
    invoke-super {p0}, LMethodCallBase;->tryThing()I

    move-result v0

    .line 29
    sget-boolean v1, LMethodCall;->$assertionsDisabled:Z

    if-nez v1, :cond_11

    const/4 v1, 0x7

    if-eq v0, v1, :cond_11

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 30
    :cond_11
    return v0
.end method
