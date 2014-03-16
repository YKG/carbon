.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# static fields
.field private static basisTestValue:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 5
    const/16 v0, 0xc

    sput v0, LMain;->basisTestValue:I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static basis(I)I
    .registers 3
    .parameter

    .prologue
    .line 80
    move v0, p0

    :goto_1
    if-lez v0, :cond_6a

    .line 81
    const-string v1, "aname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 82
    const-string v1, "bname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 83
    const-string v1, "cname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 84
    const-string v1, "dname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 85
    const-string v1, "ename"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 86
    const-string v1, "fname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 87
    const-string v1, "gname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 88
    const-string v1, "hname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 89
    const-string v1, "iname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 90
    const-string v1, "jname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 91
    const-string v1, "kname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 92
    const-string v1, "lname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 93
    const-string v1, "mname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 94
    const-string v1, "nname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 95
    const-string v1, "oname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 96
    const-string v1, "pname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 97
    const-string v1, "qname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 98
    const-string v1, "rname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 99
    const-string v1, "sname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 100
    const-string v1, "tname"

    invoke-static {v0, v1}, LMain;->basisCall(ILjava/lang/String;)I

    .line 80
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 103
    :cond_6a
    mul-int/lit8 v0, p0, 0x14

    return v0
.end method

.method public static basisCall(ILjava/lang/String;)I
    .registers 4
    .parameter
    .parameter

    .prologue
    .line 107
    const-string v0, "fuzzbot"

    invoke-virtual {p1, v0}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v0

    .line 109
    sget v1, LMain;->basisTestValue:I

    mul-int/2addr v0, v1

    if-ge p0, v0, :cond_d

    .line 110
    sget p0, LMain;->basisTestValue:I

    .line 112
    :cond_d
    return p0
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 8
    array-length v2, p0

    if-lt v2, v0, :cond_13

    aget-object v2, p0, v1

    const-string v3, "--timing"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_13

    .line 9
    :goto_f
    invoke-static {v0}, LMain;->run(Z)V

    .line 10
    return-void

    :cond_13
    move v0, v1

    .line 8
    goto :goto_f
.end method

.method public static preTest()V
    .registers 3

    .prologue
    .line 58
    const-class v0, LSamePackagePublicEnum;

    .line 60
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "FOUR"

    invoke-static {v0, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 61
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "ONE"

    invoke-static {v0, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 62
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "FOURTEEN"

    invoke-static {v0, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 63
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "NINE"

    invoke-static {v0, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 64
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "FIVE"

    invoke-static {v0, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 65
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "TWELVE"

    invoke-static {v0, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 67
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "ZERO"

    invoke-static {v0, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, LSamePackagePublicEnum;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method public static run(Z)V
    .registers 18
    .parameter

    .prologue
    .line 13
    invoke-static {}, LMain;->preTest()V

    .line 15
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 16
    const/16 v2, 0x1f4

    invoke-static {v2}, LMain;->test1(I)I

    move-result v2

    .line 17
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    .line 18
    const/16 v5, 0x1f4

    invoke-static {v5}, LMain;->test2(I)I

    move-result v5

    .line 19
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    .line 20
    const/16 v8, 0x1f4

    invoke-static {v8}, LMain;->test3(I)I

    move-result v8

    .line 21
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v9

    .line 22
    const/16 v11, 0x7d0

    invoke-static {v11}, LMain;->basis(I)I

    move-result v11

    .line 23
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    .line 25
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "basis: performed "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " iterations"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 26
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "test1: performed "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " iterations"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 27
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "test2: performed "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " iterations"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 28
    sget-object v14, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "test3: performed "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " iterations"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 30
    sub-long v0, v3, v0

    long-to-double v0, v0

    int-to-double v14, v2

    div-double/2addr v0, v14

    const-wide v14, 0x412e848000000000L

    div-double/2addr v0, v14

    .line 31
    sub-long v2, v6, v3

    long-to-double v2, v2

    int-to-double v4, v5

    div-double/2addr v2, v4

    const-wide v4, 0x412e848000000000L

    div-double/2addr v2, v4

    .line 32
    sub-long v4, v9, v6

    long-to-double v4, v4

    int-to-double v6, v8

    div-double/2addr v4, v6

    const-wide v6, 0x412e848000000000L

    div-double/2addr v4, v6

    .line 33
    sub-long v6, v12, v9

    long-to-double v6, v6

    int-to-double v8, v11

    div-double/2addr v6, v8

    const-wide v8, 0x412e848000000000L

    div-double/2addr v6, v8

    .line 35
    add-double v8, v0, v2

    add-double/2addr v8, v4

    const-wide/high16 v10, 0x4008

    div-double/2addr v8, v10

    .line 36
    const-wide/high16 v10, 0x4039

    mul-double/2addr v10, v6

    cmpg-double v8, v8, v10

    if-gez v8, :cond_12e

    .line 37
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v9, "Timing is acceptable."

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 43
    :goto_e7
    if-eqz p0, :cond_12d

    .line 44
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v9, "basis time: %.3g msec\n"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v10, v11

    invoke-virtual {v8, v9, v10}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 45
    sget-object v6, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v7, "test1: %.3g msec per iteration\n"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    aput-object v0, v8, v9

    invoke-virtual {v6, v7, v8}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 46
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "test2: %.3g msec per iteration\n"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    aput-object v2, v6, v7

    invoke-virtual {v0, v1, v6}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 47
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "test3: %.3g msec per iteration\n"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 50
    :cond_12d
    return-void

    .line 39
    :cond_12e
    sget-object v8, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v9, "Iterations are taking too long!"

    invoke-virtual {v8, v9}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 40
    const/16 p0, 0x1

    goto :goto_e7
.end method

.method public static test1(I)I
    .registers 4
    .parameter

    .prologue
    .line 117
    const-class v1, LSamePackagePublicEnum;

    move v0, p0

    .line 118
    :goto_3
    if-lez v0, :cond_6c

    .line 119
    const-string v2, "ZERO"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 120
    const-string v2, "ONE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 121
    const-string v2, "TWO"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 122
    const-string v2, "THREE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 123
    const-string v2, "FOUR"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 124
    const-string v2, "FIVE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 125
    const-string v2, "SIX"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 126
    const-string v2, "SEVEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 127
    const-string v2, "EIGHT"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 128
    const-string v2, "NINE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 129
    const-string v2, "TEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 130
    const-string v2, "ELEVEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 131
    const-string v2, "TWELVE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 132
    const-string v2, "THIRTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 133
    const-string v2, "FOURTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 134
    const-string v2, "FIFTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 135
    const-string v2, "SIXTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 136
    const-string v2, "SEVENTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 137
    const-string v2, "EIGHTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 138
    const-string v2, "NINETEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 118
    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    .line 141
    :cond_6c
    mul-int/lit8 v0, p0, 0x14

    return v0
.end method

.method public static test2(I)I
    .registers 4
    .parameter

    .prologue
    .line 145
    const-class v1, LSamePackagePrivateEnum;

    move v0, p0

    .line 146
    :goto_3
    if-lez v0, :cond_6c

    .line 147
    const-string v2, "ZERO"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 148
    const-string v2, "ONE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 149
    const-string v2, "TWO"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 150
    const-string v2, "THREE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 151
    const-string v2, "FOUR"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 152
    const-string v2, "FIVE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 153
    const-string v2, "SIX"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 154
    const-string v2, "SEVEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 155
    const-string v2, "EIGHT"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 156
    const-string v2, "NINE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 157
    const-string v2, "TEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 158
    const-string v2, "ELEVEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 159
    const-string v2, "TWELVE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 160
    const-string v2, "THIRTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 161
    const-string v2, "FOURTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 162
    const-string v2, "FIFTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 163
    const-string v2, "SIXTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 164
    const-string v2, "SEVENTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 165
    const-string v2, "EIGHTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 166
    const-string v2, "NINETEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 146
    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    .line 169
    :cond_6c
    mul-int/lit8 v0, p0, 0x14

    return v0
.end method

.method public static test3(I)I
    .registers 4
    .parameter

    .prologue
    .line 173
    const-class v1, Lotherpackage/OtherPackagePublicEnum;

    move v0, p0

    .line 174
    :goto_3
    if-lez v0, :cond_6c

    .line 175
    const-string v2, "ZERO"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 176
    const-string v2, "ONE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 177
    const-string v2, "TWO"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 178
    const-string v2, "THREE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 179
    const-string v2, "FOUR"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 180
    const-string v2, "FIVE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 181
    const-string v2, "SIX"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 182
    const-string v2, "SEVEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 183
    const-string v2, "EIGHT"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 184
    const-string v2, "NINE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 185
    const-string v2, "TEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 186
    const-string v2, "ELEVEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 187
    const-string v2, "TWELVE"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 188
    const-string v2, "THIRTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 189
    const-string v2, "FOURTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 190
    const-string v2, "FIFTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 191
    const-string v2, "SIXTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 192
    const-string v2, "SEVENTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 193
    const-string v2, "EIGHTEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 194
    const-string v2, "NINETEEN"

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 174
    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    .line 197
    :cond_6c
    mul-int/lit8 v0, p0, 0x14

    return v0
.end method
