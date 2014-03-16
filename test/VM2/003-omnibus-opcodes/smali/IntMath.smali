.class public LIntMath;
.super Ljava/lang/Object;
.source "IntMath.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LIntMath$Shorty;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 6
    const-class v0, LIntMath;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LIntMath;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 321
    return-void
.end method

.method static charSubTest()V
    .registers 2

    .prologue
    .line 102
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.charSubTest"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 110
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_b

    .line 111
    :cond_b
    return-void
.end method

.method static checkConsts(BSIJ)V
    .registers 9
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 381
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.checkConsts"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 383
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_14

    const/4 v0, 0x1

    if-eq p0, v0, :cond_14

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 384
    :cond_14
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_22

    const/16 v0, -0x100

    if-eq p1, v0, :cond_22

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 385
    :cond_22
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_33

    int-to-long v0, p1

    const-wide/16 v2, -0x100

    cmp-long v0, v0, v2

    if-eqz v0, :cond_33

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 386
    :cond_33
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_42

    const v0, -0x15b38

    if-eq p2, v0, :cond_42

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 387
    :cond_42
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_54

    int-to-long v0, p2

    const-wide/32 v2, -0x15b38

    cmp-long v0, v0, v2

    if-eqz v0, :cond_54

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 388
    :cond_54
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_67

    const-wide v0, -0x66ddccbbaa998878L

    cmp-long v0, p3, v0

    if-eqz v0, :cond_67

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 389
    :cond_67
    return-void
.end method

.method static convTest()V
    .registers 4

    .prologue
    .line 75
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.convTest"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 83
    const/16 v0, 0x1de6

    .line 84
    int-to-long v0, v0

    .line 85
    sget-boolean v2, LIntMath;->$assertionsDisabled:Z

    if-nez v2, :cond_1a

    const-wide/16 v2, 0x1de6

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 87
    :cond_1a
    const/16 v0, -0x1de6

    .line 88
    int-to-long v0, v0

    .line 89
    sget-boolean v2, LIntMath;->$assertionsDisabled:Z

    if-nez v2, :cond_2d

    const-wide/16 v2, -0x1de6

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 92
    :cond_2d
    const-wide v0, 0x1527e00f5L

    .line 93
    long-to-int v0, v0

    .line 94
    sget-boolean v1, LIntMath;->$assertionsDisabled:Z

    if-nez v1, :cond_42

    const v1, 0x527e00f5

    if-eq v0, v1, :cond_42

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 96
    :cond_42
    const-wide v0, -0x1527e00f5L

    .line 97
    long-to-int v0, v0

    .line 98
    sget-boolean v1, LIntMath;->$assertionsDisabled:Z

    if-nez v1, :cond_57

    const v1, -0x527e00f5

    if-eq v0, v1, :cond_57

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 99
    :cond_57
    return-void
.end method

.method static divideByZero(I)V
    .registers 5
    .parameter

    .prologue
    .line 349
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.divideByZero"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 352
    const/16 v0, 0x64

    :try_start_9
    div-int/2addr v0, p0

    .line 353
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_15

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_14
    .catch Ljava/lang/ArithmeticException; {:try_start_9 .. :try_end_14} :catch_14

    .line 354
    :catch_14
    move-exception v0

    .line 358
    :cond_15
    const/16 v0, 0x64

    :try_start_17
    rem-int/2addr v0, p0

    .line 359
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_23

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_22
    .catch Ljava/lang/ArithmeticException; {:try_start_17 .. :try_end_22} :catch_22

    .line 360
    :catch_22
    move-exception v0

    .line 364
    :cond_23
    const-wide/16 v0, 0x64

    int-to-long v2, p0

    :try_start_26
    div-long/2addr v0, v2

    .line 365
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_32

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_31
    .catch Ljava/lang/ArithmeticException; {:try_start_26 .. :try_end_31} :catch_31

    .line 366
    :catch_31
    move-exception v0

    .line 370
    :cond_32
    const-wide/16 v0, 0x64

    int-to-long v2, p0

    :try_start_35
    rem-long/2addr v0, v2

    .line 371
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_41

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_40
    .catch Ljava/lang/ArithmeticException; {:try_start_35 .. :try_end_40} :catch_40

    .line 372
    :catch_40
    move-exception v0

    .line 374
    :cond_41
    return-void
.end method

.method static intOperCheck([I)V
    .registers 5
    .parameter

    .prologue
    const v3, 0x11170

    const/4 v2, 0x1

    .line 139
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.intOperCheck"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 140
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_1d

    const/4 v0, 0x0

    aget v0, p0, v0

    const v1, 0x1116d

    if-eq v0, v1, :cond_1d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 141
    :cond_1d
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_2e

    aget v0, p0, v2

    const v1, 0x11173

    if-eq v0, v1, :cond_2e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 142
    :cond_2e
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_40

    const/4 v0, 0x2

    aget v0, p0, v0

    const v1, -0x33450

    if-eq v0, v1, :cond_40

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 143
    :cond_40
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_52

    const/4 v0, 0x3

    aget v0, p0, v0

    const v1, 0x24101100

    if-eq v0, v1, :cond_52

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 144
    :cond_52
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_63

    const/4 v0, 0x4

    aget v0, p0, v0

    const/16 v1, -0x5b25

    if-eq v0, v1, :cond_63

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 145
    :cond_63
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_72

    const/4 v0, 0x5

    aget v0, p0, v0

    if-eq v0, v2, :cond_72

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 146
    :cond_72
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_81

    const/4 v0, 0x6

    aget v0, p0, v0

    if-eq v0, v3, :cond_81

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 147
    :cond_81
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_91

    const/4 v0, 0x7

    aget v0, p0, v0

    const/4 v1, -0x3

    if-eq v0, v1, :cond_91

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 148
    :cond_91
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_a4

    const/16 v0, 0x8

    aget v0, p0, v0

    const v1, -0x11173

    if-eq v0, v1, :cond_a4

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 149
    :cond_a4
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_b4

    const/16 v0, 0x9

    aget v0, p0, v0

    if-eq v0, v3, :cond_b4

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 150
    :cond_b4
    return-void
.end method

.method static intOperTest(II)[I
    .registers 5
    .parameter
    .parameter

    .prologue
    .line 118
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.intOperTest"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 120
    const/16 v0, 0xa

    new-array v0, v0, [I

    .line 123
    const/4 v1, 0x0

    add-int v2, p0, p1

    aput v2, v0, v1

    .line 124
    const/4 v1, 0x1

    sub-int v2, p0, p1

    aput v2, v0, v1

    .line 125
    const/4 v1, 0x2

    mul-int v2, p0, p1

    aput v2, v0, v1

    .line 126
    const/4 v1, 0x3

    mul-int v2, p0, p0

    aput v2, v0, v1

    .line 127
    const/4 v1, 0x4

    div-int v2, p0, p1

    aput v2, v0, v1

    .line 128
    const/4 v1, 0x5

    neg-int v2, p1

    rem-int v2, p0, v2

    aput v2, v0, v1

    .line 129
    const/4 v1, 0x6

    and-int v2, p0, p1

    aput v2, v0, v1

    .line 130
    const/4 v1, 0x7

    or-int v2, p0, p1

    aput v2, v0, v1

    .line 131
    const/16 v1, 0x8

    xor-int v2, p0, p1

    aput v2, v0, v1

    .line 134
    const/16 v1, 0x9

    add-int v2, p0, p1

    sub-int/2addr v2, p1

    mul-int/2addr v2, p1

    div-int/2addr v2, p1

    rem-int/2addr v2, p1

    and-int/2addr v2, p1

    or-int/2addr v2, p1

    xor-int/2addr v2, p1

    add-int/2addr v2, p0

    aput v2, v0, v1

    .line 136
    return-object v0
.end method

.method static intShiftCheck([I)V
    .registers 3
    .parameter

    .prologue
    .line 231
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.intShiftCheck"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 233
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_19

    const/4 v0, 0x0

    aget v0, p0, v0

    const v1, 0xaa0100

    if-eq v0, v1, :cond_19

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 234
    :cond_19
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_2b

    const/4 v0, 0x1

    aget v0, p0, v0

    const v1, -0xff56

    if-eq v0, v1, :cond_2b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 235
    :cond_2b
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_3d

    const/4 v0, 0x2

    aget v0, p0, v0

    const v1, 0xff00aa

    if-eq v0, v1, :cond_3d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 236
    :cond_3d
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_4f

    const/4 v0, 0x3

    aget v0, p0, v0

    const v1, 0xaa00

    if-eq v0, v1, :cond_4f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 237
    :cond_4f
    return-void
.end method

.method static intShiftTest(II)[I
    .registers 5
    .parameter
    .parameter

    .prologue
    .line 219
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.intShiftTest"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 221
    const/4 v0, 0x4

    new-array v0, v0, [I

    .line 223
    const/4 v1, 0x0

    shl-int v2, p0, p1

    aput v2, v0, v1

    .line 224
    const/4 v1, 0x1

    shr-int v2, p0, p1

    aput v2, v0, v1

    .line 225
    const/4 v1, 0x2

    ushr-int v2, p0, p1

    aput v2, v0, v1

    .line 227
    const/4 v1, 0x3

    shl-int v2, p0, p1

    shr-int/2addr v2, p1

    ushr-int/2addr v2, p1

    shl-int/2addr v2, p1

    aput v2, v0, v1

    .line 228
    return-object v0
.end method

.method static lit16Check([I)V
    .registers 3
    .parameter

    .prologue
    .line 172
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_12

    const/4 v0, 0x0

    aget v0, p0, v0

    const v1, 0x133b9

    if-eq v0, v1, :cond_12

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 173
    :cond_12
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_24

    const/4 v0, 0x1

    aget v0, p0, v0

    const v1, -0x12be9

    if-eq v0, v1, :cond_24

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 174
    :cond_24
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_36

    const/4 v0, 0x2

    aget v0, p0, v0

    const v1, 0x4a2c868

    if-eq v0, v1, :cond_36

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 175
    :cond_36
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_47

    const/4 v0, 0x3

    aget v0, p0, v0

    const/16 v1, 0x4d

    if-eq v0, v1, :cond_47

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 176
    :cond_47
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_58

    const/4 v0, 0x4

    aget v0, p0, v0

    const/16 v1, 0x309

    if-eq v0, v1, :cond_58

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 177
    :cond_58
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_69

    const/4 v0, 0x5

    aget v0, p0, v0

    const/16 v1, 0x3c0

    if-eq v0, v1, :cond_69

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 178
    :cond_69
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_7a

    const/4 v0, 0x6

    aget v0, p0, v0

    const/16 v1, -0x27

    if-eq v0, v1, :cond_7a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 179
    :cond_7a
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_8c

    const/4 v0, 0x7

    aget v0, p0, v0

    const v1, -0x12c37

    if-eq v0, v1, :cond_8c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 180
    :cond_8c
    return-void
.end method

.method static lit16Test(I)[I
    .registers 4
    .parameter

    .prologue
    .line 156
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.lit16Test"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 158
    const/16 v0, 0x8

    new-array v0, v0, [I

    .line 161
    const/4 v1, 0x0

    add-int/lit16 v2, p0, 0x3e8

    aput v2, v0, v1

    .line 162
    const/4 v1, 0x1

    rsub-int v2, p0, 0x3e8

    aput v2, v0, v1

    .line 163
    const/4 v1, 0x2

    mul-int/lit16 v2, p0, 0x3e8

    aput v2, v0, v1

    .line 164
    const/4 v1, 0x3

    div-int/lit16 v2, p0, 0x3e8

    aput v2, v0, v1

    .line 165
    const/4 v1, 0x4

    rem-int/lit16 v2, p0, 0x3e8

    aput v2, v0, v1

    .line 166
    const/4 v1, 0x5

    and-int/lit16 v2, p0, 0x3e8

    aput v2, v0, v1

    .line 167
    const/4 v1, 0x6

    or-int/lit16 v2, p0, -0x3e8

    aput v2, v0, v1

    .line 168
    const/4 v1, 0x7

    xor-int/lit16 v2, p0, -0x3e8

    aput v2, v0, v1

    .line 169
    return-object v0
.end method

.method static lit8Check([I)V
    .registers 3
    .parameter

    .prologue
    .line 204
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_12

    const/4 v0, 0x0

    aget v0, p0, v0

    const v1, -0xd8f9

    if-eq v0, v1, :cond_12

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 205
    :cond_12
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_24

    const/4 v0, 0x1

    aget v0, p0, v0

    const v1, 0xd90d

    if-eq v0, v1, :cond_24

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 206
    :cond_24
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_36

    const/4 v0, 0x2

    aget v0, p0, v0

    const v1, -0x87a1e

    if-eq v0, v1, :cond_36

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 207
    :cond_36
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_47

    const/4 v0, 0x3

    aget v0, p0, v0

    const/16 v1, -0x15b3

    if-eq v0, v1, :cond_47

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 208
    :cond_47
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_57

    const/4 v0, 0x4

    aget v0, p0, v0

    const/4 v1, -0x5

    if-eq v0, v1, :cond_57

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 209
    :cond_57
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_68

    const/4 v0, 0x5

    aget v0, p0, v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_68

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 210
    :cond_68
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_78

    const/4 v0, 0x6

    aget v0, p0, v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_78

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 211
    :cond_78
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_8a

    const/4 v0, 0x7

    aget v0, p0, v0

    const v1, 0xd90b

    if-eq v0, v1, :cond_8a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 212
    :cond_8a
    return-void
.end method

.method static lit8Test(I)[I
    .registers 4
    .parameter

    .prologue
    .line 186
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.lit8Test"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 188
    const/16 v0, 0x8

    new-array v0, v0, [I

    .line 191
    const/4 v1, 0x0

    add-int/lit8 v2, p0, 0xa

    aput v2, v0, v1

    .line 192
    const/4 v1, 0x1

    rsub-int/lit8 v2, p0, 0xa

    aput v2, v0, v1

    .line 193
    const/4 v1, 0x2

    mul-int/lit8 v2, p0, 0xa

    aput v2, v0, v1

    .line 194
    const/4 v1, 0x3

    div-int/lit8 v2, p0, 0xa

    aput v2, v0, v1

    .line 195
    const/4 v1, 0x4

    rem-int/lit8 v2, p0, 0xa

    aput v2, v0, v1

    .line 196
    const/4 v1, 0x5

    and-int/lit8 v2, p0, 0xa

    aput v2, v0, v1

    .line 197
    const/4 v1, 0x6

    or-int/lit8 v2, p0, -0xa

    aput v2, v0, v1

    .line 198
    const/4 v1, 0x7

    xor-int/lit8 v2, p0, -0xa

    aput v2, v0, v1

    .line 199
    return-object v0
.end method

.method static longOperCheck([J)V
    .registers 7
    .parameter

    .prologue
    const-wide v4, 0x104c533c00L

    .line 265
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.longOperCheck"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 266
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_22

    const/4 v0, 0x0

    aget-wide v0, p0, v0

    const-wide v2, 0x104c533bfdL

    cmp-long v0, v0, v2

    if-eqz v0, :cond_22

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 267
    :cond_22
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_38

    const/4 v0, 0x1

    aget-wide v0, p0, v0

    const-wide v2, 0x104c533c03L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_38

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 268
    :cond_38
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_4e

    const/4 v0, 0x2

    aget-wide v0, p0, v0

    const-wide v2, -0x30e4f9b400L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_4e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 269
    :cond_4e
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_64

    const/4 v0, 0x3

    aget-wide v0, p0, v0

    const-wide v2, -0x5ed6f95009f00000L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_64

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 270
    :cond_64
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_7a

    const/4 v0, 0x4

    aget-wide v0, p0, v0

    const-wide v2, -0x56ec66955L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_7a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 271
    :cond_7a
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_8d

    const/4 v0, 0x5

    aget-wide v0, p0, v0

    const-wide/16 v2, 0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_8d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 272
    :cond_8d
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_9e

    const/4 v0, 0x6

    aget-wide v0, p0, v0

    cmp-long v0, v0, v4

    if-eqz v0, :cond_9e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 273
    :cond_9e
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_b1

    const/4 v0, 0x7

    aget-wide v0, p0, v0

    const-wide/16 v2, -0x3

    cmp-long v0, v0, v2

    if-eqz v0, :cond_b1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 274
    :cond_b1
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_c8

    const/16 v0, 0x8

    aget-wide v0, p0, v0

    const-wide v2, -0x104c533c03L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_c8

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 275
    :cond_c8
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_da

    const/16 v0, 0x9

    aget-wide v0, p0, v0

    cmp-long v0, v0, v4

    if-eqz v0, :cond_da

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 277
    :cond_da
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_e9

    array-length v0, p0

    const/16 v1, 0xa

    if-eq v0, v1, :cond_e9

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 278
    :cond_e9
    return-void
.end method

.method static longOperTest(JJ)[J
    .registers 8
    .parameter
    .parameter

    .prologue
    .line 244
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.longOperTest"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 246
    const/16 v0, 0xa

    new-array v0, v0, [J

    .line 249
    const/4 v1, 0x0

    add-long v2, p0, p2

    aput-wide v2, v0, v1

    .line 250
    const/4 v1, 0x1

    sub-long v2, p0, p2

    aput-wide v2, v0, v1

    .line 251
    const/4 v1, 0x2

    mul-long v2, p0, p2

    aput-wide v2, v0, v1

    .line 252
    const/4 v1, 0x3

    mul-long v2, p0, p0

    aput-wide v2, v0, v1

    .line 253
    const/4 v1, 0x4

    div-long v2, p0, p2

    aput-wide v2, v0, v1

    .line 254
    const/4 v1, 0x5

    neg-long v2, p2

    rem-long v2, p0, v2

    aput-wide v2, v0, v1

    .line 255
    const/4 v1, 0x6

    and-long v2, p0, p2

    aput-wide v2, v0, v1

    .line 256
    const/4 v1, 0x7

    or-long v2, p0, p2

    aput-wide v2, v0, v1

    .line 257
    const/16 v1, 0x8

    xor-long v2, p0, p2

    aput-wide v2, v0, v1

    .line 260
    const/16 v1, 0x9

    add-long v2, p0, p2

    sub-long/2addr v2, p2

    mul-long/2addr v2, p2

    div-long/2addr v2, p2

    rem-long/2addr v2, p2

    and-long/2addr v2, p2

    or-long/2addr v2, p2

    xor-long/2addr v2, p2

    add-long/2addr v2, p0

    aput-wide v2, v0, v1

    .line 262
    return-object v0
.end method

.method static longShiftCheck([J)J
    .registers 6
    .parameter

    .prologue
    const/4 v4, 0x0

    .line 296
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.longShiftCheck"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 298
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_1d

    aget-wide v0, p0, v4

    const-wide v2, -0x692100ff55ff0000L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 299
    :cond_1d
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_33

    const/4 v0, 0x1

    aget-wide v0, p0, v0

    const-wide v2, -0x2a5569210100L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_33

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 300
    :cond_33
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_49

    const/4 v0, 0x2

    aget-wide v0, p0, v0

    const-wide v2, 0xd5aa96deff00L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_49

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 301
    :cond_49
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_5f

    const/4 v0, 0x3

    aget-wide v0, p0, v0

    const-wide v2, -0x692101000000L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_5f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 303
    :cond_5f
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_6d

    array-length v0, p0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_6d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 305
    :cond_6d
    aget-wide v0, p0, v4

    return-wide v0
.end method

.method static longShiftTest(JI)[J
    .registers 7
    .parameter
    .parameter

    .prologue
    .line 284
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.longShiftTest"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 286
    const/4 v0, 0x4

    new-array v0, v0, [J

    .line 288
    const/4 v1, 0x0

    shl-long v2, p0, p2

    aput-wide v2, v0, v1

    .line 289
    const/4 v1, 0x1

    shr-long v2, p0, p2

    aput-wide v2, v0, v1

    .line 290
    const/4 v1, 0x2

    ushr-long v2, p0, p2

    aput-wide v2, v0, v1

    .line 292
    const/4 v1, 0x3

    shl-long v2, p0, p2

    shr-long/2addr v2, p2

    ushr-long/2addr v2, p2

    shl-long/2addr v2, p2

    aput-wide v2, v0, v1

    .line 293
    return-object v0
.end method

.method public static run()V
    .registers 5

    .prologue
    .line 392
    invoke-static {}, LIntMath;->shiftTest1()V

    .line 393
    invoke-static {}, LIntMath;->shiftTest2()V

    .line 394
    invoke-static {}, LIntMath;->unsignedShiftTest()V

    .line 395
    invoke-static {}, LIntMath;->convTest()V

    .line 396
    invoke-static {}, LIntMath;->charSubTest()V

    .line 401
    const v0, 0x11170

    const/4 v1, -0x3

    invoke-static {v0, v1}, LIntMath;->intOperTest(II)[I

    move-result-object v0

    .line 402
    invoke-static {v0}, LIntMath;->intOperCheck([I)V

    .line 403
    const-wide v0, 0x104c533c00L

    const-wide/16 v2, -0x3

    invoke-static {v0, v1, v2, v3}, LIntMath;->longOperTest(JJ)[J

    move-result-object v0

    .line 404
    invoke-static {v0}, LIntMath;->longOperCheck([J)V

    .line 406
    const v0, 0x12fd1

    invoke-static {v0}, LIntMath;->lit16Test(I)[I

    move-result-object v0

    .line 407
    invoke-static {v0}, LIntMath;->lit16Check([I)V

    .line 408
    const v0, -0xd903

    invoke-static {v0}, LIntMath;->lit8Test(I)[I

    move-result-object v0

    .line 409
    invoke-static {v0}, LIntMath;->lit8Check([I)V

    .line 411
    const v0, -0xff55ff

    const/16 v1, 0x8

    invoke-static {v0, v1}, LIntMath;->intShiftTest(II)[I

    move-result-object v0

    .line 412
    invoke-static {v0}, LIntMath;->intShiftCheck([I)V

    .line 413
    const-wide v0, -0x2a55692100ff55ffL

    const/16 v2, 0x10

    invoke-static {v0, v1, v2}, LIntMath;->longShiftTest(JI)[J

    move-result-object v0

    .line 414
    invoke-static {v0}, LIntMath;->longShiftCheck([J)J

    move-result-wide v0

    .line 415
    sget-boolean v2, LIntMath;->$assertionsDisabled:Z

    if-nez v2, :cond_6a

    const-wide v2, -0x692100ff55ff0000L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_6a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 417
    :cond_6a
    const v0, -0xff15dd

    invoke-static {v0}, LIntMath;->truncateTest(I)LIntMath$Shorty;

    move-result-object v0

    .line 418
    invoke-static {v0}, LIntMath;->truncateCheck(LIntMath$Shorty;)V

    .line 420
    const/4 v0, 0x0

    invoke-static {v0}, LIntMath;->divideByZero(I)V

    .line 422
    const/4 v0, 0x1

    const/16 v1, -0x100

    const v2, -0x15b38

    const-wide v3, -0x66ddccbbaa998878L

    invoke-static {v0, v1, v2, v3, v4}, LIntMath;->checkConsts(BSIJ)V

    .line 424
    const/16 v0, 0x26

    invoke-static {v0}, LIntMath;->unopTest(I)I

    move-result v0

    invoke-static {v0}, LIntMath;->unopCheck(I)V

    .line 425
    return-void
.end method

.method static shiftTest1()V
    .registers 13

    .prologue
    const/4 v12, 0x4

    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 9
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.shiftTest1"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 11
    const/16 v0, 0x8

    new-array v0, v0, [I

    fill-array-data v0, :array_bc

    .line 17
    aget v1, v0, v8

    aget v2, v0, v9

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    aget v2, v0, v10

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    aget v2, v0, v11

    shl-int/lit8 v2, v2, 0x18

    or-int/2addr v1, v2

    .line 18
    aget v2, v0, v12

    const/4 v3, 0x5

    aget v3, v0, v3

    shl-int/lit8 v3, v3, 0x8

    or-int/2addr v2, v3

    const/4 v3, 0x6

    aget v3, v0, v3

    shl-int/lit8 v3, v3, 0x10

    or-int/2addr v2, v3

    const/4 v3, 0x7

    aget v3, v0, v3

    shl-int/lit8 v3, v3, 0x18

    or-int/2addr v2, v3

    .line 19
    int-to-long v3, v1

    int-to-long v5, v2

    const/16 v7, 0x20

    shl-long/2addr v5, v7

    or-long/2addr v3, v5

    .line 21
    sget-boolean v5, LIntMath;->$assertionsDisabled:Z

    if-nez v5, :cond_4d

    const v5, 0x44332211

    if-eq v1, v5, :cond_4d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 22
    :cond_4d
    sget-boolean v1, LIntMath;->$assertionsDisabled:Z

    if-nez v1, :cond_5c

    const v1, -0x44556678

    if-eq v2, v1, :cond_5c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 23
    :cond_5c
    sget-boolean v1, LIntMath;->$assertionsDisabled:Z

    if-nez v1, :cond_6f

    const-wide v1, -0x44556677bbccddefL

    cmp-long v1, v3, v1

    if-eqz v1, :cond_6f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 25
    :cond_6f
    aget v1, v0, v8

    int-to-long v1, v1

    aget v3, v0, v9

    int-to-long v3, v3

    const/16 v5, 0x8

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    aget v3, v0, v10

    int-to-long v3, v3

    const/16 v5, 0x10

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    aget v3, v0, v11

    int-to-long v3, v3

    const/16 v5, 0x18

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    aget v3, v0, v12

    int-to-long v3, v3

    const/16 v5, 0x20

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    const/4 v3, 0x5

    aget v3, v0, v3

    int-to-long v3, v3

    const/16 v5, 0x28

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    const/4 v3, 0x6

    aget v3, v0, v3

    int-to-long v3, v3

    const/16 v5, 0x30

    shl-long/2addr v3, v5

    or-long/2addr v1, v3

    const/4 v3, 0x7

    aget v0, v0, v3

    int-to-long v3, v0

    const/16 v0, 0x38

    shl-long/2addr v3, v0

    or-long v0, v1, v3

    .line 34
    sget-boolean v2, LIntMath;->$assertionsDisabled:Z

    if-nez v2, :cond_ba

    const-wide v2, -0x44556677bbccddefL

    cmp-long v0, v0, v2

    if-eqz v0, :cond_ba

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 35
    :cond_ba
    return-void

    .line 11
    nop

    :array_bc
    .array-data 0x4
        0x11t 0x0t 0x0t 0x0t
        0x22t 0x0t 0x0t 0x0t
        0x33t 0x0t 0x0t 0x0t
        0x44t 0x0t 0x0t 0x0t
        0x88t 0x0t 0x0t 0x0t
        0x99t 0x0t 0x0t 0x0t
        0xaat 0x0t 0x0t 0x0t
        0xbbt 0x0t 0x0t 0x0t
    .end array-data
.end method

.method static shiftTest2()V
    .registers 17

    .prologue
    .line 38
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.shiftTest2"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 40
    const-wide/16 v0, 0x11

    .line 41
    const-wide/16 v2, 0x22

    .line 42
    const-wide/16 v4, 0x33

    .line 43
    const-wide/16 v6, 0x44

    .line 44
    const-wide/16 v8, 0x55

    .line 45
    const-wide/16 v10, 0x66

    .line 46
    const-wide/16 v12, 0x77

    .line 47
    const-wide/16 v14, 0x88

    .line 49
    const/16 v16, 0x38

    shl-long v0, v0, v16

    const/16 v16, 0x30

    shl-long v2, v2, v16

    or-long/2addr v0, v2

    const/16 v2, 0x28

    shl-long v2, v4, v2

    or-long/2addr v0, v2

    const/16 v2, 0x20

    shl-long v2, v6, v2

    or-long/2addr v0, v2

    const/16 v2, 0x18

    shl-long v2, v8, v2

    or-long/2addr v0, v2

    const/16 v2, 0x10

    shl-long v2, v10, v2

    or-long/2addr v0, v2

    const/16 v2, 0x8

    shl-long v2, v12, v2

    or-long/2addr v0, v2

    or-long/2addr v0, v14

    .line 52
    sget-boolean v2, LIntMath;->$assertionsDisabled:Z

    if-nez v2, :cond_4d

    const-wide v2, 0x1122334455667788L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_4d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 53
    :cond_4d
    return-void
.end method

.method static truncateCheck(LIntMath$Shorty;)V
    .registers 3
    .parameter

    .prologue
    .line 340
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_10

    iget-short v0, p0, LIntMath$Shorty;->mShort:S

    const/16 v1, -0x15dd

    if-eq v0, v1, :cond_10

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 341
    :cond_10
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_21

    iget-char v0, p0, LIntMath$Shorty;->mChar:C

    const v1, 0xea23

    if-eq v0, v1, :cond_21

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 342
    :cond_21
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_31

    iget-byte v0, p0, LIntMath$Shorty;->mByte:B

    const/16 v1, 0x23

    if-eq v0, v1, :cond_31

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 343
    :cond_31
    return-void
.end method

.method static truncateTest(I)LIntMath$Shorty;
    .registers 3
    .parameter

    .prologue
    .line 331
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.truncateTest"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 332
    new-instance v0, LIntMath$Shorty;

    invoke-direct {v0}, LIntMath$Shorty;-><init>()V

    .line 334
    int-to-short v1, p0

    iput-short v1, v0, LIntMath$Shorty;->mShort:S

    .line 335
    int-to-char v1, p0

    iput-char v1, v0, LIntMath$Shorty;->mChar:C

    .line 336
    int-to-byte v1, p0

    iput-byte v1, v0, LIntMath$Shorty;->mByte:B

    .line 337
    return-object v0
.end method

.method static unopCheck(I)V
    .registers 2
    .parameter

    .prologue
    .line 318
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    const/16 v0, 0x25

    if-eq p0, v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 319
    :cond_e
    return-void
.end method

.method static unopTest(I)I
    .registers 2
    .parameter

    .prologue
    .line 313
    neg-int v0, p0

    .line 314
    xor-int/lit8 v0, v0, -0x1

    .line 315
    return v0
.end method

.method static unsignedShiftTest()V
    .registers 6

    .prologue
    const v2, 0xfffffff

    const/16 v5, 0xfff

    const/4 v4, -0x1

    .line 56
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.unsignedShiftTest"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 63
    int-to-byte v0, v2

    .line 64
    int-to-short v1, v2

    .line 65
    int-to-char v2, v5

    .line 68
    sget-boolean v3, LIntMath;->$assertionsDisabled:Z

    if-nez v3, :cond_1c

    if-eq v0, v4, :cond_1c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 69
    :cond_1c
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_28

    if-eq v1, v4, :cond_28

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 70
    :cond_28
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_34

    if-eq v2, v5, :cond_34

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 71
    :cond_34
    sget-boolean v0, LIntMath;->$assertionsDisabled:Z

    if-nez v0, :cond_38

    .line 72
    :cond_38
    return-void
.end method
