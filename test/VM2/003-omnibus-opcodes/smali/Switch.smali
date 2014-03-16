.class public LSwitch;
.super Ljava/lang/Object;
.source "Switch.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 1
    const-class v0, LSwitch;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LSwitch;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static run()V
    .registers 0

    .prologue
    .line 60
    invoke-static {}, LSwitch;->testSwitch()V

    .line 61
    return-void
.end method

.method private static testSwitch()V
    .registers 2

    .prologue
    .line 6
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Switch.testSwitch"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 8
    const/4 v0, 0x1

    .line 10
    packed-switch v0, :pswitch_data_e8

    .line 17
    sget-boolean v1, LSwitch;->$assertionsDisabled:Z

    if-nez v1, :cond_47

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 11
    :pswitch_15
    sget-boolean v1, LSwitch;->$assertionsDisabled:Z

    if-nez v1, :cond_47

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 12
    :pswitch_1f
    sget-boolean v1, LSwitch;->$assertionsDisabled:Z

    if-nez v1, :cond_47

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 14
    :pswitch_29
    sget-boolean v1, LSwitch;->$assertionsDisabled:Z

    if-nez v1, :cond_47

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 15
    :pswitch_33
    sget-boolean v1, LSwitch;->$assertionsDisabled:Z

    if-nez v1, :cond_47

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 16
    :pswitch_3d
    sget-boolean v1, LSwitch;->$assertionsDisabled:Z

    if-nez v1, :cond_47

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 19
    :cond_47
    :pswitch_47
    packed-switch v0, :pswitch_data_f8

    .line 25
    :cond_4a
    const v0, 0x12345678

    .line 27
    packed-switch v0, :pswitch_data_100

    .line 30
    sget-boolean v1, LSwitch;->$assertionsDisabled:Z

    if-nez v1, :cond_78

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 20
    :pswitch_5a
    sget-boolean v0, LSwitch;->$assertionsDisabled:Z

    if-nez v0, :cond_4a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 21
    :pswitch_64
    sget-boolean v0, LSwitch;->$assertionsDisabled:Z

    if-nez v0, :cond_4a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 29
    :pswitch_6e
    sget-boolean v1, LSwitch;->$assertionsDisabled:Z

    if-nez v1, :cond_78

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 32
    :cond_78
    :pswitch_78
    sparse-switch v0, :sswitch_data_108

    .line 38
    sget-boolean v1, LSwitch;->$assertionsDisabled:Z

    if-nez v1, :cond_ad

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 33
    :sswitch_85
    sget-boolean v1, LSwitch;->$assertionsDisabled:Z

    if-nez v1, :cond_ad

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 34
    :sswitch_8f
    sget-boolean v1, LSwitch;->$assertionsDisabled:Z

    if-nez v1, :cond_ad

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 36
    :sswitch_99
    sget-boolean v1, LSwitch;->$assertionsDisabled:Z

    if-nez v1, :cond_ad

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 37
    :sswitch_a3
    sget-boolean v1, LSwitch;->$assertionsDisabled:Z

    if-nez v1, :cond_ad

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 40
    :cond_ad
    :sswitch_ad
    sparse-switch v0, :sswitch_data_11e

    .line 46
    :cond_b0
    const/4 v0, -0x5

    .line 47
    sparse-switch v0, :sswitch_data_128

    .line 51
    sget-boolean v0, LSwitch;->$assertionsDisabled:Z

    if-nez v0, :cond_e6

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 41
    :sswitch_be
    sget-boolean v0, LSwitch;->$assertionsDisabled:Z

    if-nez v0, :cond_b0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 42
    :sswitch_c8
    sget-boolean v0, LSwitch;->$assertionsDisabled:Z

    if-nez v0, :cond_b0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 48
    :sswitch_d2
    sget-boolean v0, LSwitch;->$assertionsDisabled:Z

    if-nez v0, :cond_e6

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 50
    :sswitch_dc
    sget-boolean v0, LSwitch;->$assertionsDisabled:Z

    if-nez v0, :cond_e6

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 57
    :cond_e6
    :sswitch_e6
    return-void

    .line 10
    nop

    :pswitch_data_e8
    .packed-switch -0x1
        :pswitch_15
        :pswitch_1f
        :pswitch_47
        :pswitch_29
        :pswitch_33
        :pswitch_3d
    .end packed-switch

    .line 19
    :pswitch_data_f8
    .packed-switch 0x3
        :pswitch_5a
        :pswitch_64
    .end packed-switch

    .line 27
    :pswitch_data_100
    .packed-switch 0x12345678
        :pswitch_78
        :pswitch_6e
    .end packed-switch

    .line 32
    :sswitch_data_108
    .sparse-switch
        -0x6 -> :sswitch_8f
        0x3 -> :sswitch_a3
        0x16 -> :sswitch_99
        0x39 -> :sswitch_85
        0x12345678 -> :sswitch_ad
    .end sparse-switch

    .line 40
    :sswitch_data_11e
    .sparse-switch
        -0x6 -> :sswitch_be
        0x3 -> :sswitch_c8
    .end sparse-switch

    .line 47
    :sswitch_data_128
    .sparse-switch
        -0x5 -> :sswitch_e6
        0x0 -> :sswitch_dc
        0xc -> :sswitch_d2
    .end sparse-switch
.end method
