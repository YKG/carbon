.class public LArray;
.super Ljava/lang/Object;
.source "Array.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 7
    const-class v0, LArray;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LArray;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static checkBooleans([Z)V
    .registers 2
    .parameter

    .prologue
    .line 41
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_f

    const/4 v0, 0x0

    aget-boolean v0, p0, v0

    if-nez v0, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 42
    :cond_f
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_1e

    const/4 v0, 0x1

    aget-boolean v0, p0, v0

    if-nez v0, :cond_1e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 43
    :cond_1e
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_2d

    const/4 v0, 0x2

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_2d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 44
    :cond_2d
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_3c

    const/4 v0, 0x3

    aget-boolean v0, p0, v0

    if-nez v0, :cond_3c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 45
    :cond_3c
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_4b

    const/4 v0, 0x4

    aget-boolean v0, p0, v0

    if-eqz v0, :cond_4b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 46
    :cond_4b
    return-void
.end method

.method static checkBytes([B)V
    .registers 3
    .parameter

    .prologue
    .line 13
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_f

    const/4 v0, 0x0

    aget-byte v0, p0, v0

    if-eqz v0, :cond_f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 14
    :cond_f
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_1f

    const/4 v0, 0x1

    aget-byte v0, p0, v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 15
    :cond_1f
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_2f

    const/4 v0, 0x2

    aget-byte v0, p0, v0

    const/4 v1, -0x2

    if-eq v0, v1, :cond_2f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 16
    :cond_2f
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_3f

    const/4 v0, 0x3

    aget-byte v0, p0, v0

    const/4 v1, -0x3

    if-eq v0, v1, :cond_3f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 17
    :cond_3f
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_4f

    const/4 v0, 0x4

    aget-byte v0, p0, v0

    const/4 v1, -0x4

    if-eq v0, v1, :cond_4f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 18
    :cond_4f
    return-void
.end method

.method static checkChars([C)V
    .registers 3
    .parameter

    .prologue
    .line 27
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_12

    const/4 v0, 0x0

    aget-char v0, p0, v0

    const v1, 0x9c40

    if-eq v0, v1, :cond_12

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 28
    :cond_12
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_24

    const/4 v0, 0x1

    aget-char v0, p0, v0

    const v1, 0x9c41

    if-eq v0, v1, :cond_24

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 29
    :cond_24
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_36

    const/4 v0, 0x2

    aget-char v0, p0, v0

    const v1, 0x9c42

    if-eq v0, v1, :cond_36

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 30
    :cond_36
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_48

    const/4 v0, 0x3

    aget-char v0, p0, v0

    const v1, 0x9c43

    if-eq v0, v1, :cond_48

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 31
    :cond_48
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_5a

    const/4 v0, 0x4

    aget-char v0, p0, v0

    const v1, 0x9c44

    if-eq v0, v1, :cond_5a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 32
    :cond_5a
    return-void
.end method

.method static checkFloats([F)V
    .registers 5
    .parameter

    .prologue
    .line 48
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_14

    const/4 v0, 0x0

    aget v0, p0, v0

    float-to-double v0, v0

    const-wide/high16 v2, -0x4008

    cmpl-double v0, v0, v2

    if-eqz v0, :cond_14

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 49
    :cond_14
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_28

    const/4 v0, 0x1

    aget v0, p0, v0

    float-to-double v0, v0

    const-wide/high16 v2, -0x4020

    cmpl-double v0, v0, v2

    if-eqz v0, :cond_28

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 50
    :cond_28
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_3c

    const/4 v0, 0x2

    aget v0, p0, v0

    float-to-double v0, v0

    const-wide/16 v2, 0x0

    cmpl-double v0, v0, v2

    if-eqz v0, :cond_3c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 51
    :cond_3c
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_50

    const/4 v0, 0x3

    aget v0, p0, v0

    float-to-double v0, v0

    const-wide/high16 v2, 0x3fe0

    cmpl-double v0, v0, v2

    if-eqz v0, :cond_50

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 52
    :cond_50
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_64

    const/4 v0, 0x4

    aget v0, p0, v0

    float-to-double v0, v0

    const-wide/high16 v2, 0x3ff8

    cmpl-double v0, v0, v2

    if-eqz v0, :cond_64

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 53
    :cond_64
    return-void
.end method

.method static checkInts([I)V
    .registers 3
    .parameter

    .prologue
    .line 34
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_12

    const/4 v0, 0x0

    aget v0, p0, v0

    const v1, 0x11170

    if-eq v0, v1, :cond_12

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 35
    :cond_12
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_24

    const/4 v0, 0x1

    aget v0, p0, v0

    const v1, 0x11171

    if-eq v0, v1, :cond_24

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 36
    :cond_24
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_36

    const/4 v0, 0x2

    aget v0, p0, v0

    const v1, 0x11172

    if-eq v0, v1, :cond_36

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 37
    :cond_36
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_48

    const/4 v0, 0x3

    aget v0, p0, v0

    const v1, 0x11173

    if-eq v0, v1, :cond_48

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 38
    :cond_48
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_5a

    const/4 v0, 0x4

    aget v0, p0, v0

    const v1, 0x11174

    if-eq v0, v1, :cond_5a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 39
    :cond_5a
    return-void
.end method

.method static checkLongs([J)V
    .registers 5
    .parameter

    .prologue
    .line 55
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_16

    const/4 v0, 0x0

    aget-wide v0, p0, v0

    const-wide v2, 0x1122334455667788L

    cmp-long v0, v0, v2

    if-eqz v0, :cond_16

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 56
    :cond_16
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_2c

    const/4 v0, 0x1

    aget-wide v0, p0, v0

    const-wide v2, -0x778899aabbccddefL

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 57
    :cond_2c
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_3f

    const/4 v0, 0x2

    aget-wide v0, p0, v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_3f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 58
    :cond_3f
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_52

    const/4 v0, 0x3

    aget-wide v0, p0, v0

    const-wide/16 v2, 0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_52

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 59
    :cond_52
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_65

    const/4 v0, 0x4

    aget-wide v0, p0, v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_65

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 60
    :cond_65
    return-void
.end method

.method static checkNegAlloc(I)V
    .registers 3
    .parameter

    .prologue
    .line 175
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Array.checkNegAlloc"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 180
    :try_start_7
    new-array v0, p0, [I

    .line 181
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_14

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_13
    .catch Ljava/lang/NegativeArraySizeException; {:try_start_7 .. :try_end_13} :catch_13

    .line 182
    :catch_13
    move-exception v0

    .line 187
    :cond_14
    :try_start_14
    new-array v0, p0, [Ljava/lang/String;

    .line 188
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_21

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_20
    .catch Ljava/lang/NegativeArraySizeException; {:try_start_14 .. :try_end_20} :catch_20

    .line 189
    :catch_20
    move-exception v0

    .line 192
    :cond_21
    return-void
.end method

.method static checkRange32([I[III)V
    .registers 7
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v2, 0x5

    .line 73
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Array.checkRange32"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 74
    const/4 v0, 0x0

    .line 76
    sget-boolean v1, LArray;->$assertionsDisabled:Z

    if-nez v1, :cond_16

    array-length v1, p0

    if-eq v1, v2, :cond_16

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 79
    :cond_16
    const/4 v1, 0x5

    :try_start_17
    aget v0, p0, v1

    .line 80
    sget-boolean v1, LArray;->$assertionsDisabled:Z

    if-nez v1, :cond_24

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_23
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_17 .. :try_end_23} :catch_23

    .line 81
    :catch_23
    move-exception v1

    .line 85
    :cond_24
    const/4 v1, 0x5

    :try_start_25
    aput v0, p0, v1

    .line 86
    sget-boolean v1, LArray;->$assertionsDisabled:Z

    if-nez v1, :cond_32

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_31
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_25 .. :try_end_31} :catch_31

    .line 87
    :catch_31
    move-exception v1

    .line 91
    :cond_32
    const/4 v1, 0x6

    :try_start_33
    aget v0, p0, v1

    .line 92
    sget-boolean v1, LArray;->$assertionsDisabled:Z

    if-nez v1, :cond_40

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_3f
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_33 .. :try_end_3f} :catch_3f

    .line 93
    :catch_3f
    move-exception v1

    .line 97
    :cond_40
    :try_start_40
    aget v0, p0, p2

    .line 98
    sget-boolean v1, LArray;->$assertionsDisabled:Z

    if-nez v1, :cond_4d

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_4c
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_40 .. :try_end_4c} :catch_4c

    .line 99
    :catch_4c
    move-exception v1

    .line 103
    :cond_4d
    :try_start_4d
    aput v0, p0, p2

    .line 104
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_5a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_59
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_4d .. :try_end_59} :catch_59

    .line 105
    :catch_59
    move-exception v0

    .line 109
    :cond_5a
    :try_start_5a
    aget v0, p0, p3

    .line 110
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_67

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_66
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_5a .. :try_end_66} :catch_66

    .line 111
    :catch_66
    move-exception v0

    .line 117
    :cond_67
    const/4 v0, 0x1

    :try_start_68
    aget v0, p1, v0

    .line 118
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_75

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_74
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_68 .. :try_end_74} :catch_74

    .line 119
    :catch_74
    move-exception v0

    .line 122
    :cond_75
    return-void
.end method

.method static checkRange64([JII)V
    .registers 7
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v3, 0x5

    .line 128
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Array.checkRange64"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 129
    const-wide/16 v0, 0x0

    .line 131
    sget-boolean v2, LArray;->$assertionsDisabled:Z

    if-nez v2, :cond_17

    array-length v2, p0

    if-eq v2, v3, :cond_17

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 134
    :cond_17
    const/4 v2, 0x5

    :try_start_18
    aget-wide v0, p0, v2

    .line 135
    sget-boolean v2, LArray;->$assertionsDisabled:Z

    if-nez v2, :cond_25

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
    :try_end_24
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_18 .. :try_end_24} :catch_24

    .line 136
    :catch_24
    move-exception v2

    .line 140
    :cond_25
    const/4 v2, 0x5

    :try_start_26
    aput-wide v0, p0, v2

    .line 141
    sget-boolean v2, LArray;->$assertionsDisabled:Z

    if-nez v2, :cond_33

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
    :try_end_32
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_26 .. :try_end_32} :catch_32

    .line 142
    :catch_32
    move-exception v2

    .line 146
    :cond_33
    const/4 v2, 0x6

    :try_start_34
    aget-wide v0, p0, v2

    .line 147
    sget-boolean v2, LArray;->$assertionsDisabled:Z

    if-nez v2, :cond_41

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
    :try_end_40
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_34 .. :try_end_40} :catch_40

    .line 148
    :catch_40
    move-exception v2

    .line 152
    :cond_41
    :try_start_41
    aget-wide v0, p0, p1

    .line 153
    sget-boolean v2, LArray;->$assertionsDisabled:Z

    if-nez v2, :cond_4e

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2
    :try_end_4d
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_41 .. :try_end_4d} :catch_4d

    .line 154
    :catch_4d
    move-exception v2

    .line 158
    :cond_4e
    :try_start_4e
    aput-wide v0, p0, p1

    .line 159
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_5b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_5a
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_4e .. :try_end_5a} :catch_5a

    .line 160
    :catch_5a
    move-exception v0

    .line 164
    :cond_5b
    :try_start_5b
    aget-wide v0, p0, p2

    .line 165
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_68

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_67
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_5b .. :try_end_67} :catch_67

    .line 166
    :catch_67
    move-exception v0

    .line 169
    :cond_68
    return-void
.end method

.method static checkShorts([S)V
    .registers 3
    .parameter

    .prologue
    .line 20
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_11

    const/4 v0, 0x0

    aget-short v0, p0, v0

    const/16 v1, 0x14

    if-eq v0, v1, :cond_11

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 21
    :cond_11
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_22

    const/4 v0, 0x1

    aget-short v0, p0, v0

    const/16 v1, 0xa

    if-eq v0, v1, :cond_22

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 22
    :cond_22
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_31

    const/4 v0, 0x2

    aget-short v0, p0, v0

    if-eqz v0, :cond_31

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 23
    :cond_31
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_42

    const/4 v0, 0x3

    aget-short v0, p0, v0

    const/16 v1, -0xa

    if-eq v0, v1, :cond_42

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 24
    :cond_42
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_53

    const/4 v0, 0x4

    aget-short v0, p0, v0

    const/16 v1, -0x14

    if-eq v0, v1, :cond_53

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 25
    :cond_53
    return-void
.end method

.method static checkStrings([Ljava/lang/String;)V
    .registers 3
    .parameter

    .prologue
    .line 62
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_15

    const/4 v0, 0x0

    aget-object v0, p0, v0

    const-string v1, "zero"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 63
    :cond_15
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_2a

    const/4 v0, 0x1

    aget-object v0, p0, v0

    const-string v1, "one"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 64
    :cond_2a
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_3f

    const/4 v0, 0x2

    aget-object v0, p0, v0

    const-string v1, "two"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 65
    :cond_3f
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_54

    const/4 v0, 0x3

    aget-object v0, p0, v0

    const-string v1, "three"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_54

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 66
    :cond_54
    sget-boolean v0, LArray;->$assertionsDisabled:Z

    if-nez v0, :cond_69

    const/4 v0, 0x4

    aget-object v0, p0, v0

    const-string v1, "four"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_69

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 67
    :cond_69
    return-void
.end method

.method public static run()V
    .registers 13

    .prologue
    const/4 v12, 0x0

    const/high16 v11, -0x8000

    const/4 v10, -0x1

    const/4 v7, 0x5

    .line 195
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Array check..."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 197
    new-array v0, v7, [B

    fill-array-data v0, :array_6e

    .line 198
    new-array v1, v7, [S

    fill-array-data v1, :array_76

    .line 199
    new-array v2, v7, [C

    fill-array-data v2, :array_80

    .line 200
    new-array v3, v7, [I

    fill-array-data v3, :array_8a

    .line 201
    new-array v4, v7, [Z

    fill-array-data v4, :array_98

    .line 202
    new-array v5, v7, [F

    fill-array-data v5, :array_a0

    .line 203
    new-array v6, v7, [J

    fill-array-data v6, :array_ae

    .line 205
    new-array v7, v7, [Ljava/lang/String;

    const-string v8, "zero"

    aput-object v8, v7, v12

    const/4 v8, 0x1

    const-string v9, "one"

    aput-object v9, v7, v8

    const/4 v8, 0x2

    const-string v9, "two"

    aput-object v9, v7, v8

    const/4 v8, 0x3

    const-string v9, "three"

    aput-object v9, v7, v8

    const/4 v8, 0x4

    const-string v9, "four"

    aput-object v9, v7, v8

    .line 208
    new-array v8, v12, [I

    .line 210
    invoke-static {v0}, LArray;->checkBytes([B)V

    .line 211
    invoke-static {v1}, LArray;->checkShorts([S)V

    .line 212
    invoke-static {v2}, LArray;->checkChars([C)V

    .line 213
    invoke-static {v3}, LArray;->checkInts([I)V

    .line 214
    invoke-static {v4}, LArray;->checkBooleans([Z)V

    .line 215
    invoke-static {v5}, LArray;->checkFloats([F)V

    .line 216
    invoke-static {v6}, LArray;->checkLongs([J)V

    .line 217
    invoke-static {v7}, LArray;->checkStrings([Ljava/lang/String;)V

    .line 219
    invoke-static {v3, v8, v10, v11}, LArray;->checkRange32([I[III)V

    .line 220
    invoke-static {v6, v10, v11}, LArray;->checkRange64([JII)V

    .line 222
    invoke-static {v10}, LArray;->checkNegAlloc(I)V

    .line 223
    return-void

    .line 197
    nop

    :array_6e
    .array-data 0x1
        0x0t
        0xfft
        0xfet
        0xfdt
        0xfct
    .end array-data

    .line 198
    nop

    :array_76
    .array-data 0x2
        0x14t 0x0t
        0xat 0x0t
        0x0t 0x0t
        0xf6t 0xfft
        0xect 0xfft
    .end array-data

    .line 199
    nop

    :array_80
    .array-data 0x2
        0x40t 0x9ct
        0x41t 0x9ct
        0x42t 0x9ct
        0x43t 0x9ct
        0x44t 0x9ct
    .end array-data

    .line 200
    nop

    :array_8a
    .array-data 0x4
        0x70t 0x11t 0x1t 0x0t
        0x71t 0x11t 0x1t 0x0t
        0x72t 0x11t 0x1t 0x0t
        0x73t 0x11t 0x1t 0x0t
        0x74t 0x11t 0x1t 0x0t
    .end array-data

    .line 201
    :array_98
    .array-data 0x1
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
    .end array-data

    .line 202
    nop

    :array_a0
    .array-data 0x4
        0x0t 0x0t 0xc0t 0xbft
        0x0t 0x0t 0x0t 0xbft
        0x0t 0x0t 0x0t 0x0t
        0x0t 0x0t 0x0t 0x3ft
        0x0t 0x0t 0xc0t 0x3ft
    .end array-data

    .line 203
    :array_ae
    .array-data 0x8
        0x88t 0x77t 0x66t 0x55t 0x44t 0x33t 0x22t 0x11t
        0x11t 0x22t 0x33t 0x44t 0x55t 0x66t 0x77t 0x88t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x0t
        0xfft 0xfft 0xfft 0xfft 0xfft 0xfft 0xfft 0xfft
    .end array-data
.end method
