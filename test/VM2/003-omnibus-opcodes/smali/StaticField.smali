.class public LStaticField;
.super Ljava/lang/Object;
.source "StaticField.java"


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static mBoolean1:Z

.field public static mBoolean2:Z

.field public static mByte1:B

.field public static mByte2:B

.field public static mChar1:C

.field public static mChar2:C

.field public static mDouble1:D

.field public static mDouble2:D

.field public static mFloat1:F

.field public static mFloat2:F

.field public static mInt1:I

.field public static mInt2:I

.field public static mLong1:J

.field public static mLong2:J

.field public static mShort1:S

.field public static mShort2:S


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 17
    const-class v0, LStaticField;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LStaticField;->$assertionsDisabled:Z

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

.method public static assignFields()V
    .registers 3

    .prologue
    const/16 v2, 0x7fff

    .line 24
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "StaticField assign..."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 25
    const/4 v0, 0x1

    sput-boolean v0, LStaticField;->mBoolean1:Z

    .line 26
    const/4 v0, 0x0

    sput-boolean v0, LStaticField;->mBoolean2:Z

    .line 27
    const/16 v0, 0x7f

    sput-byte v0, LStaticField;->mByte1:B

    .line 28
    const/16 v0, -0x80

    sput-byte v0, LStaticField;->mByte2:B

    .line 29
    sput-char v2, LStaticField;->mChar1:C

    .line 30
    const v0, 0xffff

    sput-char v0, LStaticField;->mChar2:C

    .line 31
    sput-short v2, LStaticField;->mShort1:S

    .line 32
    const/16 v0, -0x8000

    sput-short v0, LStaticField;->mShort2:S

    .line 33
    const v0, 0x10001

    sput v0, LStaticField;->mInt1:I

    .line 34
    const v0, -0x10001

    sput v0, LStaticField;->mInt2:I

    .line 35
    const v0, 0x40490e56

    sput v0, LStaticField;->mFloat1:F

    .line 36
    const/high16 v0, -0x80

    sput v0, LStaticField;->mFloat2:F

    .line 37
    const-wide v0, 0x1122334455667788L

    sput-wide v0, LStaticField;->mLong1:J

    .line 38
    const-wide v0, -0x1122334455667788L

    sput-wide v0, LStaticField;->mLong2:J

    .line 39
    const-wide v0, 0x400921fb54411744L

    sput-wide v0, LStaticField;->mDouble1:D

    .line 40
    const-wide/high16 v0, 0x7ff0

    sput-wide v0, LStaticField;->mDouble2:D

    .line 41
    return-void
.end method

.method public static checkFields()V
    .registers 4

    .prologue
    const/16 v2, 0x7fff

    .line 44
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "StaticField check..."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 45
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_17

    sget-boolean v0, LStaticField;->mBoolean1:Z

    if-nez v0, :cond_17

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 46
    :cond_17
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_25

    sget-boolean v0, LStaticField;->mBoolean2:Z

    if-eqz v0, :cond_25

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 47
    :cond_25
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_35

    sget-byte v0, LStaticField;->mByte1:B

    const/16 v1, 0x7f

    if-eq v0, v1, :cond_35

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 48
    :cond_35
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_45

    sget-byte v0, LStaticField;->mByte2:B

    const/16 v1, -0x80

    if-eq v0, v1, :cond_45

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 49
    :cond_45
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_53

    sget-char v0, LStaticField;->mChar1:C

    if-eq v0, v2, :cond_53

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 50
    :cond_53
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_64

    sget-char v0, LStaticField;->mChar2:C

    const v1, 0xffff

    if-eq v0, v1, :cond_64

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 51
    :cond_64
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_72

    sget-short v0, LStaticField;->mShort1:S

    if-eq v0, v2, :cond_72

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 52
    :cond_72
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_82

    sget-short v0, LStaticField;->mShort2:S

    const/16 v1, -0x8000

    if-eq v0, v1, :cond_82

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 53
    :cond_82
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_93

    sget v0, LStaticField;->mInt1:I

    const v1, 0x10001

    if-eq v0, v1, :cond_93

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 54
    :cond_93
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_a4

    sget v0, LStaticField;->mInt2:I

    const v1, -0x10001

    if-eq v0, v1, :cond_a4

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 55
    :cond_a4
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_c0

    sget v0, LStaticField;->mFloat1:F

    const v1, 0x40490625

    cmpl-float v0, v0, v1

    if-lez v0, :cond_ba

    sget v0, LStaticField;->mFloat2:F

    const v1, 0x40491687

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_c0

    :cond_ba
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 56
    :cond_c0
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_d2

    sget v0, LStaticField;->mFloat2:F

    sget v1, LStaticField;->mFloat1:F

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_d2

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 57
    :cond_d2
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_e7

    sget-wide v0, LStaticField;->mLong1:J

    const-wide v2, 0x1122334455667788L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_e7

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 58
    :cond_e7
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_fc

    sget-wide v0, LStaticField;->mLong2:J

    const-wide v2, -0x1122334455667788L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_fc

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 59
    :cond_fc
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_11c

    sget-wide v0, LStaticField;->mDouble1:D

    const-wide v2, 0x400921fb542fe938L

    cmpl-double v0, v0, v2

    if-lez v0, :cond_116

    sget-wide v0, LStaticField;->mDouble1:D

    const-wide v2, 0x400921fb54524550L

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_11c

    :cond_116
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 60
    :cond_11c
    sget-boolean v0, LStaticField;->$assertionsDisabled:Z

    if-nez v0, :cond_12e

    sget-wide v0, LStaticField;->mDouble2:D

    sget-wide v2, LStaticField;->mDouble1:D

    cmpl-double v0, v0, v2

    if-gtz v0, :cond_12e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 61
    :cond_12e
    return-void
.end method

.method public static run()V
    .registers 0

    .prologue
    .line 19
    invoke-static {}, LStaticField;->assignFields()V

    .line 20
    invoke-static {}, LStaticField;->checkFields()V

    .line 21
    return-void
.end method
