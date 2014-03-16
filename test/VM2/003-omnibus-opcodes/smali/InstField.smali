.class public LInstField;
.super Ljava/lang/Object;
.source "InstField.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field public mBoolean1:Z

.field public mBoolean2:Z

.field public mByte1:B

.field public mByte2:B

.field public mChar1:C

.field public mChar2:C

.field public mDouble1:D

.field public mDouble2:D

.field public mFloat1:F

.field public mFloat2:F

.field public mInt1:I

.field public mInt2:I

.field public mLong1:J

.field public mLong2:J

.field public mShort1:S

.field public mShort2:S


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 17
    const-class v0, LInstField;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LInstField;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static nullCheck(LInstField;)V
    .registers 3
    .parameter

    .prologue
    .line 28
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "InstField.nullCheck"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 30
    :try_start_7
    iget v0, p0, LInstField;->mInt1:I

    .line 31
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_14

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_13
    .catch Ljava/lang/NullPointerException; {:try_start_7 .. :try_end_13} :catch_13

    .line 32
    :catch_13
    move-exception v0

    .line 36
    :cond_14
    :try_start_14
    iget-wide v0, p0, LInstField;->mLong1:J

    .line 37
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_21

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_20
    .catch Ljava/lang/NullPointerException; {:try_start_14 .. :try_end_20} :catch_20

    .line 38
    :catch_20
    move-exception v0

    .line 42
    :cond_21
    const/4 v0, 0x5

    :try_start_22
    iput v0, p0, LInstField;->mInt1:I

    .line 43
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_2f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_2e
    .catch Ljava/lang/NullPointerException; {:try_start_22 .. :try_end_2e} :catch_2e

    .line 44
    :catch_2e
    move-exception v0

    .line 48
    :cond_2f
    const-wide/16 v0, 0x11

    :try_start_31
    iput-wide v0, p0, LInstField;->mLong1:J

    .line 49
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_3e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_3d
    .catch Ljava/lang/NullPointerException; {:try_start_31 .. :try_end_3d} :catch_3d

    .line 50
    :catch_3d
    move-exception v0

    .line 53
    :cond_3e
    return-void
.end method


# virtual methods
.method public assignFields()V
    .registers 4

    .prologue
    const/16 v2, 0x7fff

    .line 56
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "InstField assign..."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 57
    const/4 v0, 0x1

    iput-boolean v0, p0, LInstField;->mBoolean1:Z

    .line 58
    const/4 v0, 0x0

    iput-boolean v0, p0, LInstField;->mBoolean2:Z

    .line 59
    const/16 v0, 0x7f

    iput-byte v0, p0, LInstField;->mByte1:B

    .line 60
    const/16 v0, -0x80

    iput-byte v0, p0, LInstField;->mByte2:B

    .line 61
    iput-char v2, p0, LInstField;->mChar1:C

    .line 62
    const v0, 0xffff

    iput-char v0, p0, LInstField;->mChar2:C

    .line 63
    iput-short v2, p0, LInstField;->mShort1:S

    .line 64
    const/16 v0, -0x8000

    iput-short v0, p0, LInstField;->mShort2:S

    .line 65
    const v0, 0x10001

    iput v0, p0, LInstField;->mInt1:I

    .line 66
    const v0, -0x10001

    iput v0, p0, LInstField;->mInt2:I

    .line 67
    const v0, 0x40490e56

    iput v0, p0, LInstField;->mFloat1:F

    .line 68
    const/high16 v0, -0x80

    iput v0, p0, LInstField;->mFloat2:F

    .line 69
    const-wide v0, 0x1122334455667788L

    iput-wide v0, p0, LInstField;->mLong1:J

    .line 70
    const-wide v0, -0x1122334455667788L

    iput-wide v0, p0, LInstField;->mLong2:J

    .line 71
    const-wide v0, 0x400921fb54411744L

    iput-wide v0, p0, LInstField;->mDouble1:D

    .line 72
    const-wide/high16 v0, 0x7ff0

    iput-wide v0, p0, LInstField;->mDouble2:D

    .line 73
    return-void
.end method

.method public checkFields()V
    .registers 5

    .prologue
    const/16 v2, 0x7fff

    .line 76
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "InstField check..."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 77
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_17

    iget-boolean v0, p0, LInstField;->mBoolean1:Z

    if-nez v0, :cond_17

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 78
    :cond_17
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_25

    iget-boolean v0, p0, LInstField;->mBoolean2:Z

    if-eqz v0, :cond_25

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 79
    :cond_25
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_35

    iget-byte v0, p0, LInstField;->mByte1:B

    const/16 v1, 0x7f

    if-eq v0, v1, :cond_35

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 80
    :cond_35
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_45

    iget-byte v0, p0, LInstField;->mByte2:B

    const/16 v1, -0x80

    if-eq v0, v1, :cond_45

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 81
    :cond_45
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_53

    iget-char v0, p0, LInstField;->mChar1:C

    if-eq v0, v2, :cond_53

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 82
    :cond_53
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_64

    iget-char v0, p0, LInstField;->mChar2:C

    const v1, 0xffff

    if-eq v0, v1, :cond_64

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 83
    :cond_64
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_72

    iget-short v0, p0, LInstField;->mShort1:S

    if-eq v0, v2, :cond_72

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 84
    :cond_72
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_82

    iget-short v0, p0, LInstField;->mShort2:S

    const/16 v1, -0x8000

    if-eq v0, v1, :cond_82

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 85
    :cond_82
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_93

    iget v0, p0, LInstField;->mInt1:I

    const v1, 0x10001

    if-eq v0, v1, :cond_93

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 86
    :cond_93
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_a4

    iget v0, p0, LInstField;->mInt2:I

    const v1, -0x10001

    if-eq v0, v1, :cond_a4

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 87
    :cond_a4
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_c0

    iget v0, p0, LInstField;->mFloat1:F

    const v1, 0x40490625

    cmpl-float v0, v0, v1

    if-lez v0, :cond_ba

    iget v0, p0, LInstField;->mFloat1:F

    const v1, 0x40491687

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_c0

    :cond_ba
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 88
    :cond_c0
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_d2

    iget v0, p0, LInstField;->mFloat2:F

    iget v1, p0, LInstField;->mFloat1:F

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_d2

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 89
    :cond_d2
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_e7

    iget-wide v0, p0, LInstField;->mLong1:J

    const-wide v2, 0x1122334455667788L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_e7

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 90
    :cond_e7
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_fc

    iget-wide v0, p0, LInstField;->mLong2:J

    const-wide v2, -0x1122334455667788L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_fc

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 91
    :cond_fc
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_11c

    iget-wide v0, p0, LInstField;->mDouble1:D

    const-wide v2, 0x400921fb542fe938L

    cmpl-double v0, v0, v2

    if-lez v0, :cond_116

    iget-wide v0, p0, LInstField;->mDouble1:D

    const-wide v2, 0x400921fb54524550L

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_11c

    :cond_116
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 92
    :cond_11c
    sget-boolean v0, LInstField;->$assertionsDisabled:Z

    if-nez v0, :cond_12e

    iget-wide v0, p0, LInstField;->mDouble2:D

    iget-wide v2, p0, LInstField;->mDouble1:D

    cmpl-double v0, v0, v2

    if-gtz v0, :cond_12e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 93
    :cond_12e
    return-void
.end method

.method public run()V
    .registers 2

    .prologue
    .line 19
    invoke-virtual {p0}, LInstField;->assignFields()V

    .line 20
    invoke-virtual {p0}, LInstField;->checkFields()V

    .line 21
    const/4 v0, 0x0

    invoke-static {v0}, LInstField;->nullCheck(LInstField;)V

    .line 22
    return-void
.end method
