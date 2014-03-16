.class public LCompare;
.super Ljava/lang/Object;
.source "Compare.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 8
    const-class v0, LCompare;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LCompare;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static run()V
    .registers 11

    .prologue
    const/4 v2, 0x4

    const/high16 v10, 0x4080

    const-wide/high16 v8, 0x4010

    .line 165
    const/4 v0, -0x5

    const/4 v1, 0x0

    invoke-static {v0, v2, v2, v1}, LCompare;->testIntCompare(IIII)V

    .line 166
    const-wide/16 v0, -0x5

    const-wide v2, -0xfffffff7L

    const-wide/16 v4, 0x4

    const-wide/16 v6, 0x8

    invoke-static/range {v0 .. v7}, LCompare;->testLongCompare(JJJJ)V

    .line 168
    const/high16 v0, -0x3f60

    const/high16 v1, 0x7fc0

    invoke-static {v0, v10, v10, v1}, LCompare;->testFloatCompare(FFFF)V

    .line 169
    const-wide/high16 v0, -0x3fec

    const-wide/high16 v6, 0x7ff8

    move-wide v2, v8

    move-wide v4, v8

    invoke-static/range {v0 .. v7}, LCompare;->testDoubleCompare(DDDD)V

    .line 170
    return-void
.end method

.method static testDoubleCompare(DDDD)V
    .registers 10
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 137
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.testDoubleCompare"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 138
    cmpl-double v0, p0, p2

    if-lez v0, :cond_15

    .line 139
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_15

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 140
    :cond_15
    cmpg-double v0, p2, p0

    if-gez v0, :cond_23

    .line 141
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_23

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 142
    :cond_23
    cmpl-double v0, p2, p0

    if-nez v0, :cond_31

    .line 143
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_31

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 144
    :cond_31
    cmpl-double v0, p2, p4

    if-eqz v0, :cond_3f

    .line 145
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_3f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 147
    :cond_3f
    cmpg-double v0, p2, p6

    if-gtz v0, :cond_4d

    .line 148
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_4d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 149
    :cond_4d
    cmpl-double v0, p2, p6

    if-ltz v0, :cond_5b

    .line 150
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_5b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 151
    :cond_5b
    cmpg-double v0, p0, p6

    if-gtz v0, :cond_69

    .line 152
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_69

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 153
    :cond_69
    cmpl-double v0, p0, p6

    if-ltz v0, :cond_77

    .line 154
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_77

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 155
    :cond_77
    cmpl-double v0, p6, p2

    if-ltz v0, :cond_85

    .line 156
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_85

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 157
    :cond_85
    cmpg-double v0, p6, p2

    if-gtz v0, :cond_93

    .line 158
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_93

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 160
    :cond_93
    cmpl-double v0, p6, p6

    if-nez v0, :cond_a1

    .line 161
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_a1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 162
    :cond_a1
    return-void
.end method

.method static testFloatCompare(FFFF)V
    .registers 6
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 107
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.testFloatCompare"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 108
    cmpl-float v0, p0, p1

    if-lez v0, :cond_15

    .line 109
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_15

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 110
    :cond_15
    cmpg-float v0, p1, p0

    if-gez v0, :cond_23

    .line 111
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_23

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 112
    :cond_23
    cmpl-float v0, p1, p0

    if-nez v0, :cond_31

    .line 113
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_31

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 114
    :cond_31
    cmpl-float v0, p1, p2

    if-eqz v0, :cond_3f

    .line 115
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_3f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 117
    :cond_3f
    cmpg-float v0, p1, p3

    if-gtz v0, :cond_4d

    .line 118
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_4d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 119
    :cond_4d
    cmpl-float v0, p1, p3

    if-ltz v0, :cond_5b

    .line 120
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_5b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 121
    :cond_5b
    cmpg-float v0, p0, p3

    if-gtz v0, :cond_69

    .line 122
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_69

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 123
    :cond_69
    cmpl-float v0, p0, p3

    if-ltz v0, :cond_77

    .line 124
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_77

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 125
    :cond_77
    cmpl-float v0, p3, p1

    if-ltz v0, :cond_85

    .line 126
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_85

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 127
    :cond_85
    cmpg-float v0, p3, p1

    if-gtz v0, :cond_93

    .line 128
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_93

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 130
    :cond_93
    cmpl-float v0, p3, p3

    if-nez v0, :cond_a1

    .line 131
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_a1

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 132
    :cond_a1
    return-void
.end method

.method static testIntCompare(IIII)V
    .registers 6
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 14
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.testIntCompare"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 16
    if-le p0, p1, :cond_13

    .line 17
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_13

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 18
    :cond_13
    if-lt p0, p1, :cond_1f

    .line 19
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_1f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 20
    :cond_1f
    if-ge p1, p0, :cond_2b

    .line 21
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_2b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 22
    :cond_2b
    if-gt p1, p0, :cond_37

    .line 23
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_37

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 24
    :cond_37
    if-ne p1, p0, :cond_43

    .line 25
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_43

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 26
    :cond_43
    if-eq p1, p2, :cond_4f

    .line 27
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_4f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 30
    :cond_4f
    if-eq p1, p0, :cond_5d

    .line 36
    :cond_51
    if-lez p0, :cond_67

    .line 37
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_67

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 33
    :cond_5d
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_51

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 38
    :cond_67
    if-ltz p0, :cond_73

    .line 39
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_73

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 40
    :cond_73
    if-gez p1, :cond_7f

    .line 41
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_7f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 42
    :cond_7f
    if-gtz p1, :cond_8b

    .line 43
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_8b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 44
    :cond_8b
    if-nez p1, :cond_97

    .line 45
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_97

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 46
    :cond_97
    if-eqz p3, :cond_a3

    .line 47
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_a3

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 49
    :cond_a3
    if-nez p3, :cond_a6

    .line 54
    :cond_a5
    return-void

    .line 52
    :cond_a6
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_a5

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
.end method

.method static testLongCompare(JJJJ)V
    .registers 12
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    const-wide/16 v2, 0x1

    .line 64
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "IntMath.testLongCompare"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 65
    cmp-long v0, p0, p4

    if-lez v0, :cond_17

    .line 66
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_17

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 67
    :cond_17
    cmp-long v0, p4, p0

    if-gez v0, :cond_25

    .line 68
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_25

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 69
    :cond_25
    cmp-long v0, p4, p0

    if-nez v0, :cond_33

    .line 70
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_33

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 72
    :cond_33
    add-long v0, p4, v2

    cmp-long v0, p4, v0

    if-ltz v0, :cond_43

    .line 73
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_43

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 74
    :cond_43
    add-long v0, p0, v2

    cmp-long v0, p0, v0

    if-ltz v0, :cond_53

    .line 75
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_53

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 78
    :cond_53
    cmp-long v0, p4, p0

    if-eqz v0, :cond_65

    .line 85
    :cond_57
    cmp-long v0, p4, p6

    if-lez v0, :cond_6f

    .line 86
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_6f

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 81
    :cond_65
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_57

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 87
    :cond_6f
    cmp-long v0, p6, p4

    if-gez v0, :cond_7d

    .line 88
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_7d

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 89
    :cond_7d
    cmp-long v0, p6, p4

    if-nez v0, :cond_8b

    .line 90
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_8b

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 93
    :cond_8b
    cmp-long v0, p0, p2

    if-gez v0, :cond_99

    .line 94
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_99

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 95
    :cond_99
    cmp-long v0, p2, p0

    if-lez v0, :cond_a7

    .line 96
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_a7

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 97
    :cond_a7
    cmp-long v0, p2, p0

    if-nez v0, :cond_b5

    .line 98
    sget-boolean v0, LCompare;->$assertionsDisabled:Z

    if-nez v0, :cond_b5

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 99
    :cond_b5
    return-void
.end method
