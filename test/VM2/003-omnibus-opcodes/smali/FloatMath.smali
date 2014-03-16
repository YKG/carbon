.class public LFloatMath;
.super Ljava/lang/Object;
.source "FloatMath.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 6
    const-class v0, LFloatMath;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LFloatMath;->$assertionsDisabled:Z

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

    return-void
.end method

.method static checkConsts()V
    .registers 7

    .prologue
    const-wide v5, 0x4024333333333333L

    const-wide v3, 0x4023cccccccccccdL

    .line 256
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "FloatMath.checkConsts"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 258
    const/high16 v0, 0x4120

    .line 259
    sget-boolean v1, LFloatMath;->$assertionsDisabled:Z

    if-nez v1, :cond_27

    float-to-double v1, v0

    cmpl-double v1, v1, v3

    if-lez v1, :cond_21

    float-to-double v0, v0

    cmpg-double v0, v0, v5

    if-ltz v0, :cond_27

    :cond_21
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 261
    :cond_27
    const-wide/high16 v0, 0x4024

    .line 262
    sget-boolean v2, LFloatMath;->$assertionsDisabled:Z

    if-nez v2, :cond_3b

    cmpl-double v2, v0, v3

    if-lez v2, :cond_35

    cmpg-double v0, v0, v5

    if-ltz v0, :cond_3b

    :cond_35
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 263
    :cond_3b
    return-void
.end method

.method static checkConvD([D)V
    .registers 6
    .parameter

    .prologue
    .line 248
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "FloatMath.checkConvD"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 250
    const/4 v0, 0x0

    :goto_8
    array-length v1, p0

    if-ge v0, v1, :cond_32

    .line 251
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-wide v3, p0, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 250
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 252
    :cond_32
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "-2.005440939E9, -8.6133032459203287E18, 123.4560012817382"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 253
    return-void
.end method

.method static checkConvF([F)V
    .registers 5
    .parameter

    .prologue
    .line 233
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "FloatMath.checkConvF"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 235
    const/4 v0, 0x0

    :goto_8
    array-length v1, p0

    if-ge v0, v1, :cond_32

    .line 236
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget v3, p0, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 235
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 237
    :cond_32
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "-2.0054409E9, -8.6133031E18, -3.1415927"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 238
    return-void
.end method

.method static checkConvI([I)V
    .registers 3
    .parameter

    .prologue
    .line 196
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "FloatMath.checkConvI"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 197
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_19

    const/4 v0, 0x0

    aget v0, p0, v0

    const v1, 0x44332211

    if-eq v0, v1, :cond_19

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 198
    :cond_19
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_2a

    const/4 v0, 0x1

    aget v0, p0, v0

    const/16 v1, 0x7b

    if-eq v0, v1, :cond_2a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 199
    :cond_2a
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_3a

    const/4 v0, 0x2

    aget v0, p0, v0

    const/4 v1, -0x3

    if-eq v0, v1, :cond_3a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 200
    :cond_3a
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_4c

    const/4 v0, 0x3

    aget v0, p0, v0

    const v1, 0x7fffffff

    if-eq v0, v1, :cond_4c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 201
    :cond_4c
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_5d

    const/4 v0, 0x4

    aget v0, p0, v0

    const/high16 v1, -0x8000

    if-eq v0, v1, :cond_5d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 202
    :cond_5d
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_6c

    const/4 v0, 0x5

    aget v0, p0, v0

    if-eqz v0, :cond_6c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 203
    :cond_6c
    return-void
.end method

.method static checkConvL([J)V
    .registers 5
    .parameter

    .prologue
    .line 216
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "FloatMath.checkConvL"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 217
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_1b

    const/4 v0, 0x0

    aget-wide v0, p0, v0

    const-wide/32 v2, -0x778899ab

    cmp-long v0, v0, v2

    if-eqz v0, :cond_1b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 218
    :cond_1b
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_2e

    const/4 v0, 0x1

    aget-wide v0, p0, v0

    const-wide/16 v2, 0x7b

    cmp-long v0, v0, v2

    if-eqz v0, :cond_2e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 219
    :cond_2e
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_41

    const/4 v0, 0x2

    aget-wide v0, p0, v0

    const-wide/16 v2, -0x3

    cmp-long v0, v0, v2

    if-eqz v0, :cond_41

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 220
    :cond_41
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_57

    const/4 v0, 0x3

    aget-wide v0, p0, v0

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v0, v0, v2

    if-eqz v0, :cond_57

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 221
    :cond_57
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_6a

    const/4 v0, 0x4

    aget-wide v0, p0, v0

    const-wide/high16 v2, -0x8000

    cmp-long v0, v0, v2

    if-eqz v0, :cond_6a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 222
    :cond_6a
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_7d

    const/4 v0, 0x5

    aget-wide v0, p0, v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_7d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 223
    :cond_7d
    return-void
.end method

.method static convD(IJF)[D
    .registers 8
    .parameter
    .parameter
    .parameter

    .prologue
    .line 241
    const/4 v0, 0x3

    new-array v0, v0, [D

    .line 242
    const/4 v1, 0x0

    int-to-double v2, p0

    aput-wide v2, v0, v1

    .line 243
    const/4 v1, 0x1

    long-to-double v2, p1

    aput-wide v2, v0, v1

    .line 244
    const/4 v1, 0x2

    float-to-double v2, p3

    aput-wide v2, v0, v1

    .line 245
    return-object v0
.end method

.method static convF(IJD)[F
    .registers 8
    .parameter
    .parameter
    .parameter

    .prologue
    .line 226
    const/4 v0, 0x3

    new-array v0, v0, [F

    .line 227
    const/4 v1, 0x0

    int-to-float v2, p0

    aput v2, v0, v1

    .line 228
    const/4 v1, 0x1

    long-to-float v2, p1

    aput v2, v0, v1

    .line 229
    const/4 v1, 0x2

    double-to-float v2, p3

    aput v2, v0, v1

    .line 230
    return-object v0
.end method

.method static convI(JFDF)[I
    .registers 10
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const/high16 v3, 0x3f80

    .line 186
    const/4 v0, 0x6

    new-array v0, v0, [I

    .line 187
    const/4 v1, 0x0

    long-to-int v2, p0

    aput v2, v0, v1

    .line 188
    const/4 v1, 0x1

    float-to-int v2, p2

    aput v2, v0, v1

    .line 189
    const/4 v1, 0x2

    double-to-int v2, p3

    aput v2, v0, v1

    .line 190
    const/4 v1, 0x3

    div-float v2, v3, p5

    float-to-int v2, v2

    aput v2, v0, v1

    .line 191
    const/4 v1, 0x4

    const/high16 v2, -0x4080

    div-float/2addr v2, p5

    float-to-int v2, v2

    aput v2, v0, v1

    .line 192
    const/4 v1, 0x5

    div-float v2, v3, p5

    div-float/2addr v3, p5

    div-float/2addr v2, v3

    float-to-int v2, v2

    aput v2, v0, v1

    .line 193
    return-object v0
.end method

.method static convL(IFDD)[J
    .registers 12
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const-wide/high16 v4, 0x3ff0

    .line 206
    const/4 v0, 0x6

    new-array v0, v0, [J

    .line 207
    const/4 v1, 0x0

    int-to-long v2, p0

    aput-wide v2, v0, v1

    .line 208
    const/4 v1, 0x1

    float-to-long v2, p1

    aput-wide v2, v0, v1

    .line 209
    const/4 v1, 0x2

    double-to-long v2, p2

    aput-wide v2, v0, v1

    .line 210
    const/4 v1, 0x3

    div-double v2, v4, p4

    double-to-long v2, v2

    aput-wide v2, v0, v1

    .line 211
    const/4 v1, 0x4

    const-wide/high16 v2, -0x4010

    div-double/2addr v2, p4

    double-to-long v2, v2

    aput-wide v2, v0, v1

    .line 212
    const/4 v1, 0x5

    div-double v2, v4, p4

    div-double/2addr v4, p4

    div-double/2addr v2, v4

    double-to-long v2, v2

    aput-wide v2, v0, v1

    .line 213
    return-object v0
.end method

.method static convTest()V
    .registers 12

    .prologue
    const-wide v10, 0x40935a449ba5e354L

    const-wide v8, 0x1527e00f5L

    const-wide v6, -0x1527e00f5L

    const/16 v5, 0x4d2

    const/16 v4, -0x4d2

    .line 9
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "FloatMath.convTest"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 17
    const v0, 0x449a522b

    .line 18
    float-to-int v0, v0

    .line 19
    sget-boolean v1, LFloatMath;->$assertionsDisabled:Z

    if-nez v1, :cond_2a

    if-eq v0, v5, :cond_2a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 21
    :cond_2a
    const v0, -0x3b65add5

    .line 22
    float-to-int v0, v0

    .line 23
    sget-boolean v1, LFloatMath;->$assertionsDisabled:Z

    if-nez v1, :cond_3a

    if-eq v0, v4, :cond_3a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 26
    :cond_3a
    const v0, 0x449ad22b

    .line 27
    float-to-long v0, v0

    .line 28
    sget-boolean v2, LFloatMath;->$assertionsDisabled:Z

    if-nez v2, :cond_4e

    const-wide/16 v2, 0x4d6

    cmp-long v0, v0, v2

    if-eqz v0, :cond_4e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 30
    :cond_4e
    const v0, -0x3b652dd5

    .line 31
    float-to-long v0, v0

    .line 32
    sget-boolean v2, LFloatMath;->$assertionsDisabled:Z

    if-nez v2, :cond_62

    const-wide/16 v2, -0x4d6

    cmp-long v0, v0, v2

    if-eqz v0, :cond_62

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 35
    :cond_62
    const v0, 0x449ad22b

    .line 36
    float-to-double v0, v0

    .line 37
    sget-boolean v2, LFloatMath;->$assertionsDisabled:Z

    if-nez v2, :cond_7d

    cmpl-double v2, v0, v10

    if-lez v2, :cond_77

    const-wide v2, 0x40935a45a1cac083L

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_7d

    :cond_77
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 40
    :cond_7d
    const-wide v0, 0x40934a456d5cfaadL

    .line 41
    double-to-int v0, v0

    .line 42
    sget-boolean v1, LFloatMath;->$assertionsDisabled:Z

    if-nez v1, :cond_8f

    if-eq v0, v5, :cond_8f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 44
    :cond_8f
    const-wide v0, -0x3f6cb5ba92a30553L

    .line 45
    double-to-int v0, v0

    .line 46
    sget-boolean v1, LFloatMath;->$assertionsDisabled:Z

    if-nez v1, :cond_a1

    if-eq v0, v4, :cond_a1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 49
    :cond_a1
    const-wide v0, 0x41f527e00f503261L

    .line 50
    double-to-long v0, v0

    .line 51
    sget-boolean v2, LFloatMath;->$assertionsDisabled:Z

    if-nez v2, :cond_b5

    cmp-long v0, v0, v8

    if-eqz v0, :cond_b5

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 53
    :cond_b5
    const-wide v0, -0x3e0ad81ff0afcd9fL

    .line 54
    double-to-long v0, v0

    .line 55
    sget-boolean v2, LFloatMath;->$assertionsDisabled:Z

    if-nez v2, :cond_c9

    cmp-long v0, v0, v6

    if-eqz v0, :cond_c9

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 58
    :cond_c9
    const-wide v0, 0x40935a456d5cfaadL

    .line 59
    double-to-float v0, v0

    .line 60
    sget-boolean v1, LFloatMath;->$assertionsDisabled:Z

    if-nez v1, :cond_e8

    float-to-double v1, v0

    cmpl-double v1, v1, v10

    if-lez v1, :cond_e2

    float-to-double v0, v0

    const-wide v2, 0x40935a45a1cac083L

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_e8

    :cond_e2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 63
    :cond_e8
    const/16 v0, 0x1de6

    .line 64
    int-to-long v0, v0

    .line 65
    sget-boolean v2, LFloatMath;->$assertionsDisabled:Z

    if-nez v2, :cond_fb

    const-wide/16 v2, 0x1de6

    cmp-long v0, v0, v2

    if-eqz v0, :cond_fb

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 67
    :cond_fb
    const/16 v0, -0x1de6

    .line 68
    int-to-long v0, v0

    .line 69
    sget-boolean v2, LFloatMath;->$assertionsDisabled:Z

    if-nez v2, :cond_10e

    const-wide/16 v2, -0x1de6

    cmp-long v0, v0, v2

    if-eqz v0, :cond_10e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 73
    :cond_10e
    int-to-float v0, v5

    .line 74
    sget-boolean v1, LFloatMath;->$assertionsDisabled:Z

    if-nez v1, :cond_127

    const v1, 0x449a3ccd

    cmpl-float v1, v0, v1

    if-lez v1, :cond_121

    const v1, 0x449a4333

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_127

    :cond_121
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 77
    :cond_127
    int-to-float v0, v4

    .line 78
    sget-boolean v1, LFloatMath;->$assertionsDisabled:Z

    if-nez v1, :cond_140

    const v1, -0x3b65c333

    cmpg-float v1, v0, v1

    if-gez v1, :cond_13a

    const v1, -0x3b65bccd

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_140

    :cond_13a
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 81
    :cond_140
    const/16 v0, 0x4d6

    .line 82
    int-to-double v0, v0

    .line 83
    sget-boolean v2, LFloatMath;->$assertionsDisabled:Z

    if-nez v2, :cond_15f

    const-wide v2, 0x40935799a0000000L

    cmpl-double v2, v0, v2

    if-lez v2, :cond_159

    const-wide v2, 0x4093586660000000L

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_15f

    :cond_159
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 85
    :cond_15f
    const/16 v0, -0x4d6

    .line 86
    int-to-double v0, v0

    .line 87
    sget-boolean v2, LFloatMath;->$assertionsDisabled:Z

    if-nez v2, :cond_17e

    const-wide v2, -0x3f6ca86660000000L

    cmpg-double v2, v0, v2

    if-gez v2, :cond_178

    const-wide v2, -0x3f6ca799a0000000L

    cmpl-double v0, v0, v2

    if-gtz v0, :cond_17e

    :cond_178
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 91
    :cond_17e
    long-to-int v0, v8

    .line 92
    sget-boolean v1, LFloatMath;->$assertionsDisabled:Z

    if-nez v1, :cond_18e

    const v1, 0x527e00f5

    if-eq v0, v1, :cond_18e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 95
    :cond_18e
    long-to-int v0, v6

    .line 96
    sget-boolean v1, LFloatMath;->$assertionsDisabled:Z

    if-nez v1, :cond_19e

    const v1, -0x527e00f5

    if-eq v0, v1, :cond_19e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 100
    :cond_19e
    long-to-float v0, v8

    .line 101
    sget-boolean v1, LFloatMath;->$assertionsDisabled:Z

    if-nez v1, :cond_1bd

    float-to-double v1, v0

    const-wide v3, 0x41f527dff7000000L

    cmpl-double v1, v1, v3

    if-lez v1, :cond_1b7

    float-to-double v0, v0

    const-wide v2, 0x41f527e003800000L

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_1bd

    :cond_1b7
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 104
    :cond_1bd
    long-to-float v0, v6

    .line 105
    sget-boolean v1, LFloatMath;->$assertionsDisabled:Z

    if-nez v1, :cond_1dc

    float-to-double v1, v0

    const-wide v3, -0x3e0ad82009000000L

    cmpg-double v1, v1, v3

    if-gez v1, :cond_1d6

    float-to-double v0, v0

    const-wide v2, -0x3e0ad81ffc800000L

    cmpl-double v0, v0, v2

    if-gtz v0, :cond_1dc

    :cond_1d6
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 108
    :cond_1dc
    const-wide v0, 0x18e18caf5L

    .line 109
    long-to-double v0, v0

    .line 110
    sget-boolean v2, LFloatMath;->$assertionsDisabled:Z

    if-nez v2, :cond_1fe

    const-wide v2, 0x41f8e18ca9c00000L

    cmpl-double v2, v0, v2

    if-lez v2, :cond_1f8

    const-wide v2, 0x41f8e18cb0000000L

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_1fe

    :cond_1f8
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 112
    :cond_1fe
    const-wide v0, -0x18e18caf5L

    .line 113
    long-to-double v0, v0

    .line 114
    sget-boolean v2, LFloatMath;->$assertionsDisabled:Z

    if-nez v2, :cond_220

    const-wide v2, -0x3e071e7356400000L

    cmpg-double v2, v0, v2

    if-gez v2, :cond_21a

    const-wide v2, -0x3e071e7350000000L

    cmpl-double v0, v0, v2

    if-gtz v0, :cond_220

    :cond_21a
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 115
    :cond_220
    return-void
.end method

.method static doubleOperCheck([D)V
    .registers 10
    .parameter

    .prologue
    const/4 v8, 0x4

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 169
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_25

    aget-wide v0, p0, v4

    const-wide v2, 0x40f116cfd70a3d71L

    cmpl-double v0, v0, v2

    if-lez v0, :cond_1f

    aget-wide v0, p0, v4

    const-wide v2, 0x40f116d028f5c28fL

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_25

    :cond_1f
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 170
    :cond_25
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_45

    aget-wide v0, p0, v5

    const-wide v2, 0x40f1172fd70a3d71L

    cmpl-double v0, v0, v2

    if-lez v0, :cond_3f

    aget-wide v0, p0, v5

    const-wide v2, 0x40f1173028f5c28fL

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_45

    :cond_3f
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 171
    :cond_45
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_65

    aget-wide v0, p0, v6

    const-wide v2, -0x3ef65d7feb851eb8L

    cmpl-double v0, v0, v2

    if-lez v0, :cond_5f

    aget-wide v0, p0, v6

    const-wide v2, -0x3ef65d80147ae148L

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_65

    :cond_5f
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 172
    :cond_65
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_85

    aget-wide v0, p0, v7

    const-wide v2, -0x3f2936aa3d70a3d7L

    cmpl-double v0, v0, v2

    if-lez v0, :cond_7f

    aget-wide v0, p0, v7

    const-wide v2, -0x3f2936ab851eb852L

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_85

    :cond_7f
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 173
    :cond_85
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_a5

    aget-wide v0, p0, v8

    const-wide v2, 0x3feff7ced916872bL

    cmpl-double v0, v0, v2

    if-lez v0, :cond_9f

    aget-wide v0, p0, v8

    const-wide v2, 0x3ff004189374bc6aL

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_a5

    :cond_9f
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 174
    :cond_a5
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_c9

    const/16 v0, 0x8

    aget-wide v0, p0, v0

    const-wide v2, 0x40f1170fd70a3d71L

    cmpl-double v0, v0, v2

    if-lez v0, :cond_c3

    const/16 v0, 0x8

    aget-wide v0, p0, v0

    const-wide v2, 0x40f1171028f5c28fL

    cmpg-double v0, v0, v2

    if-ltz v0, :cond_c9

    :cond_c3
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 175
    :cond_c9
    return-void
.end method

.method static doubleOperTest(DD)[D
    .registers 8
    .parameter
    .parameter

    .prologue
    .line 152
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "FloatMath.doubleOperTest"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 154
    const/16 v0, 0x9

    new-array v0, v0, [D

    .line 157
    const/4 v1, 0x0

    add-double v2, p0, p2

    aput-wide v2, v0, v1

    .line 158
    const/4 v1, 0x1

    sub-double v2, p0, p2

    aput-wide v2, v0, v1

    .line 159
    const/4 v1, 0x2

    mul-double v2, p0, p2

    aput-wide v2, v0, v1

    .line 160
    const/4 v1, 0x3

    div-double v2, p0, p2

    aput-wide v2, v0, v1

    .line 161
    const/4 v1, 0x4

    neg-double v2, p2

    rem-double v2, p0, v2

    aput-wide v2, v0, v1

    .line 164
    const/16 v1, 0x8

    add-double v2, p0, p2

    sub-double/2addr v2, p2

    mul-double/2addr v2, p2

    div-double/2addr v2, p2

    rem-double/2addr v2, p2

    add-double/2addr v2, p0

    aput-wide v2, v0, v1

    .line 166
    return-object v0
.end method

.method static floatOperCheck([F)V
    .registers 8
    .parameter

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 139
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_21

    aget v0, p0, v2

    const v1, 0x4788b67f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1b

    aget v0, p0, v2

    const v1, 0x4788b681

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_21

    :cond_1b
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 140
    :cond_21
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_3d

    aget v0, p0, v3

    const v1, 0x4788b97f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_37

    aget v0, p0, v3

    const v1, 0x4788b981

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_3d

    :cond_37
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 141
    :cond_3d
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_59

    aget v0, p0, v4

    const v1, -0x37b2ebff

    cmpl-float v0, v0, v1

    if-lez v0, :cond_53

    aget v0, p0, v4

    const v1, -0x37b2ec01

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_59

    :cond_53
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 142
    :cond_59
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_75

    aget v0, p0, v5

    const v1, -0x3949b552

    cmpl-float v0, v0, v1

    if-lez v0, :cond_6f

    aget v0, p0, v5

    const v1, -0x3949b55c

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_75

    :cond_6f
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 143
    :cond_75
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_91

    aget v0, p0, v6

    const v1, 0x3f7fbe77

    cmpl-float v0, v0, v1

    if-lez v0, :cond_8b

    aget v0, p0, v6

    const v1, 0x3f8020c5

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_91

    :cond_8b
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 144
    :cond_91
    sget-boolean v0, LFloatMath;->$assertionsDisabled:Z

    if-nez v0, :cond_b1

    const/16 v0, 0x8

    aget v0, p0, v0

    const v1, 0x4788b87f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_ab

    const/16 v0, 0x8

    aget v0, p0, v0

    const v1, 0x4788b881

    cmpg-float v0, v0, v1

    if-ltz v0, :cond_b1

    :cond_ab
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 145
    :cond_b1
    return-void
.end method

.method static floatOperTest(FF)[F
    .registers 5
    .parameter
    .parameter

    .prologue
    .line 122
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "FloatMath.floatOperTest"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 124
    const/16 v0, 0x9

    new-array v0, v0, [F

    .line 127
    const/4 v1, 0x0

    add-float v2, p0, p1

    aput v2, v0, v1

    .line 128
    const/4 v1, 0x1

    sub-float v2, p0, p1

    aput v2, v0, v1

    .line 129
    const/4 v1, 0x2

    mul-float v2, p0, p1

    aput v2, v0, v1

    .line 130
    const/4 v1, 0x3

    div-float v2, p0, p1

    aput v2, v0, v1

    .line 131
    const/4 v1, 0x4

    neg-float v2, p1

    rem-float v2, p0, v2

    aput v2, v0, v1

    .line 134
    const/16 v1, 0x8

    add-float v2, p0, p1

    sub-float/2addr v2, p1

    mul-float/2addr v2, p1

    div-float/2addr v2, p1

    rem-float/2addr v2, p1

    add-float/2addr v2, p0

    aput v2, v0, v1

    .line 136
    return-object v0
.end method

.method public static run()V
    .registers 12

    .prologue
    const-wide v0, -0x778899aabbccddefL

    const v11, -0x778899ab

    const-wide v3, -0x3ff6de04abbee8bcL

    const v2, 0x42f6e979

    .line 266
    invoke-static {}, LFloatMath;->convTest()V

    .line 273
    const v5, 0x4788b800

    const/high16 v6, -0x3fc0

    invoke-static {v5, v6}, LFloatMath;->floatOperTest(FF)[F

    move-result-object v5

    .line 274
    invoke-static {v5}, LFloatMath;->floatOperCheck([F)V

    .line 275
    const-wide v5, 0x40f1170000000000L

    const-wide/high16 v7, -0x3ff8

    invoke-static {v5, v6, v7, v8}, LFloatMath;->doubleOperTest(DD)[D

    move-result-object v5

    .line 276
    invoke-static {v5}, LFloatMath;->doubleOperCheck([D)V

    .line 278
    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, LFloatMath;->convI(JFDF)[I

    move-result-object v5

    .line 279
    invoke-static {v5}, LFloatMath;->checkConvI([I)V

    .line 280
    const-wide/16 v9, 0x0

    move v5, v11

    move v6, v2

    move-wide v7, v3

    invoke-static/range {v5 .. v10}, LFloatMath;->convL(IFDD)[J

    move-result-object v5

    .line 281
    invoke-static {v5}, LFloatMath;->checkConvL([J)V

    .line 282
    invoke-static {v11, v0, v1, v3, v4}, LFloatMath;->convF(IJD)[F

    move-result-object v3

    .line 283
    invoke-static {v3}, LFloatMath;->checkConvF([F)V

    .line 284
    invoke-static {v11, v0, v1, v2}, LFloatMath;->convD(IJF)[D

    move-result-object v0

    .line 285
    invoke-static {v0}, LFloatMath;->checkConvD([D)V

    .line 287
    invoke-static {v2}, LFloatMath;->unopTest(F)F

    .line 289
    invoke-static {}, LFloatMath;->checkConsts()V

    .line 290
    return-void
.end method

.method static unopTest(F)F
    .registers 2
    .parameter

    .prologue
    .line 181
    neg-float v0, p0

    .line 182
    return v0
.end method
