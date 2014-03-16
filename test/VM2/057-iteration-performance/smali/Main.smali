.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LMain$1;,
        LMain$Target;,
        LMain$Normalization;
    }
.end annotation


# static fields
.field private static final ARRAY_BYTES:I = 0x2000

.field public static final BODIES:I = 0x8

.field private static final BYTES_1:[B = null

.field private static final BYTES_2:[B = null

.field private static final INNER_ARRAY:[I = null

.field private static final INNER_COUNT:I = 0x64

.field private static final INNER_LIST:Ljava/util/ArrayList; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOOPS:I = 0x7

.field private static final TARGET:LMain$Target;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/16 v1, 0x2000

    const/16 v3, 0x64

    .line 449
    new-array v0, v3, [I

    sput-object v0, LMain;->INNER_ARRAY:[I

    .line 450
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v0, LMain;->INNER_LIST:Ljava/util/ArrayList;

    .line 452
    new-instance v0, LMain$Target;

    invoke-direct {v0}, LMain$Target;-><init>()V

    sput-object v0, LMain;->TARGET:LMain$Target;

    .line 454
    new-array v0, v1, [B

    sput-object v0, LMain;->BYTES_1:[B

    .line 455
    new-array v0, v1, [B

    sput-object v0, LMain;->BYTES_2:[B

    .line 458
    const/4 v0, 0x0

    :goto_1f
    if-ge v0, v3, :cond_2a

    .line 459
    sget-object v1, LMain;->INNER_LIST:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 458
    add-int/lit8 v0, v0, 0x1

    goto :goto_1f

    .line 461
    :cond_2a
    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 463
    return-void
.end method

.method public static checkTimes([[DZ)Z
    .registers 16
    .parameter
    .parameter

    .prologue
    const/4 v13, 0x3

    const/4 v12, 0x2

    const/4 v4, 0x1

    const/4 v1, 0x0

    const/16 v11, 0x8

    .line 163
    const/4 v0, 0x7

    new-array v5, v0, [[D

    new-array v0, v11, [D

    fill-array-data v0, :array_8a

    aput-object v0, v5, v1

    new-array v0, v11, [D

    fill-array-data v0, :array_ae

    aput-object v0, v5, v4

    new-array v0, v11, [D

    fill-array-data v0, :array_d2

    aput-object v0, v5, v12

    new-array v0, v11, [D

    fill-array-data v0, :array_f6

    aput-object v0, v5, v13

    const/4 v0, 0x4

    new-array v2, v11, [D

    fill-array-data v2, :array_11a

    aput-object v2, v5, v0

    const/4 v0, 0x5

    new-array v2, v11, [D

    fill-array-data v2, :array_13e

    aput-object v2, v5, v0

    const/4 v0, 0x6

    new-array v2, v11, [D

    fill-array-data v2, :array_162

    aput-object v2, v5, v0

    move v3, v1

    move v0, v4

    .line 175
    :goto_3f
    if-ge v3, v11, :cond_89

    move v2, v1

    .line 176
    :goto_42
    const/4 v6, 0x7

    if-ge v2, v6, :cond_85

    .line 177
    aget-object v6, p0, v3

    aget-wide v6, v6, v2

    aget-object v8, p0, v1

    aget-wide v8, v8, v1

    div-double/2addr v6, v8

    .line 178
    aget-object v8, v5, v2

    aget-wide v8, v8, v3

    cmpl-double v8, v6, v8

    if-lez v8, :cond_82

    .line 179
    if-eqz p1, :cond_81

    .line 180
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v8, "%c%d is too slow: %.3g vs. %.3g\n"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    add-int/lit8 v10, v3, 0x41

    int-to-char v10, v10

    invoke-static {v10}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    move-result-object v10

    aput-object v10, v9, v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v4

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v9, v12

    aget-object v6, v5, v2

    aget-wide v6, v6, v3

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v9, v13

    invoke-virtual {v0, v8, v9}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    :cond_81
    move v0, v1

    .line 176
    :cond_82
    add-int/lit8 v2, v2, 0x1

    goto :goto_42

    .line 175
    :cond_85
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    goto :goto_3f

    .line 188
    :cond_89
    return v0

    .line 163
    :array_8a
    .array-data 0x8
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0xf0t 0x3ft
        0x66t 0x66t 0x66t 0x66t 0x66t 0x66t 0x2t 0x40t
        0x33t 0x33t 0x33t 0x33t 0x33t 0x33t 0x3t 0x40t
        0x66t 0x66t 0x66t 0x66t 0x66t 0x66t 0xat 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x1at 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x28t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x80t 0x4ct 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x80t 0x57t 0x40t
    .end array-data

    :array_ae
    .array-data 0x8
        0x33t 0x33t 0x33t 0x33t 0x33t 0x33t 0xf3t 0x3ft
        0x33t 0x33t 0x33t 0x33t 0x33t 0x33t 0x3t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x4t 0x40t
        0x33t 0x33t 0x33t 0x33t 0x33t 0x33t 0xbt 0x40t
        0x66t 0x66t 0x66t 0x66t 0x66t 0x66t 0x1at 0x40t
        0x66t 0x66t 0x66t 0x66t 0x66t 0x66t 0x28t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x4et 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0xc0t 0x57t 0x40t
    .end array-data

    :array_d2
    .array-data 0x8
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0xf8t 0x3ft
        0xcdt 0xcct 0xcct 0xcct 0xcct 0xcct 0x4t 0x40t
        0x33t 0x33t 0x33t 0x33t 0x33t 0x33t 0x7t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0xct 0x40t
        0xcdt 0xcct 0xcct 0xcct 0xcct 0xcct 0x1at 0x40t
        0xcdt 0xcct 0xcct 0xcct 0xcct 0xcct 0x28t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x80t 0x4ft 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x58t 0x40t
    .end array-data

    :array_f6
    .array-data 0x8
        0x9at 0x99t 0x99t 0x99t 0x99t 0x99t 0xf9t 0x3ft
        0x66t 0x66t 0x66t 0x66t 0x66t 0x66t 0x6t 0x40t
        0x33t 0x33t 0x33t 0x33t 0x33t 0x33t 0x7t 0x40t
        0xcdt 0xcct 0xcct 0xcct 0xcct 0xcct 0xct 0x40t
        0x33t 0x33t 0x33t 0x33t 0x33t 0x33t 0x1bt 0x40t
        0x33t 0x33t 0x33t 0x33t 0x33t 0x33t 0x29t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0xc0t 0x4ft 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x40t 0x58t 0x40t
    .end array-data

    :array_11a
    .array-data 0x8
        0x33t 0x33t 0x33t 0x33t 0x33t 0x33t 0xfbt 0x3ft
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x8t 0x40t
        0x33t 0x33t 0x33t 0x33t 0x33t 0x33t 0x7t 0x40t
        0x9at 0x99t 0x99t 0x99t 0x99t 0x99t 0xdt 0x40t
        0x9at 0x99t 0x99t 0x99t 0x99t 0x99t 0x1bt 0x40t
        0x9at 0x99t 0x99t 0x99t 0x99t 0x99t 0x29t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x50t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x80t 0x58t 0x40t
    .end array-data

    :array_13e
    .array-data 0x8
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x18t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x18t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x18t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x1ct 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x24t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x2et 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x20t 0x50t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x40t 0x5at 0x40t
    .end array-data

    :array_162
    .array-data 0x8
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x3ft 0x40t
        0x33t 0x33t 0x33t 0x33t 0x33t 0x33t 0x3ft 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x80t 0x3ft 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x0t 0x41t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x80t 0x44t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0x80t 0x45t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0xc0t 0x56t 0x40t
        0x0t 0x0t 0x0t 0x0t 0x0t 0xe0t 0x60t 0x40t
    .end array-data
.end method

.method public static combineTimings([[D[[DI)V
    .registers 11
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 152
    move v0, v1

    :goto_2
    array-length v2, p0

    if-ge v0, v2, :cond_24

    move v2, v1

    .line 153
    :goto_6
    aget-object v3, p0, v0

    array-length v3, v3

    if-ge v2, v3, :cond_21

    .line 154
    aget-object v3, p0, v0

    aget-object v4, p0, v0

    aget-wide v4, v4, v2

    int-to-double v6, p2

    mul-double/2addr v4, v6

    aget-object v6, p1, v0

    aget-wide v6, v6, v2

    add-double/2addr v4, v6

    add-int/lit8 v6, p2, 0x1

    int-to-double v6, v6

    div-double/2addr v4, v6

    aput-wide v4, v3, v2

    .line 153
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 152
    :cond_21
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 159
    :cond_24
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 8
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 49
    array-length v2, p0

    if-lt v2, v0, :cond_4f

    aget-object v2, p0, v1

    const-string v3, "--timing"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4f

    .line 51
    :goto_f
    const/16 v2, 0x64

    .line 55
    :goto_11
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    .line 56
    invoke-static {v2, v1}, LMain;->runAllTests(IZ)[[D

    .line 57
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    .line 59
    sub-long v3, v5, v3

    long-to-double v3, v3

    const-wide v5, 0x41cdcd6500000000L

    div-double/2addr v3, v5

    .line 60
    const-wide/high16 v5, 0x3fd0

    cmpl-double v5, v3, v5

    if-lez v5, :cond_51

    .line 68
    int-to-double v1, v2

    div-double/2addr v1, v3

    const-wide/high16 v3, 0x4034

    mul-double/2addr v1, v3

    double-to-int v1, v1

    .line 70
    if-eqz v0, :cond_4b

    .line 71
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "iters = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 74
    :cond_4b
    invoke-static {v0, v1}, LMain;->run(ZI)V

    .line 75
    return-void

    :cond_4f
    move v0, v1

    .line 49
    goto :goto_f

    .line 64
    :cond_51
    mul-int/lit8 v2, v2, 0x2

    .line 65
    goto :goto_11
.end method

.method public static printTimings([[DLMain$Normalization;)V
    .registers 12
    .parameter
    .parameter

    .prologue
    .line 82
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, Ljava/io/PrintStream;->println()V

    .line 83
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "%-7s   A        B        C        D        E        F        G        H\n"

    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/Object;

    const/4 v4, 0x0

    sget-object v0, LMain$Normalization;->NONE:LMain$Normalization;

    if-ne p1, v0, :cond_3c

    const-string v0, "(usec)"

    :goto_13
    aput-object v0, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 86
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "      -------- -------- -------- -------- -------- -------- -------- --------"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 89
    const/16 v0, 0x8

    new-array v3, v0, [D

    .line 90
    const/4 v0, 0x0

    move v2, v0

    :goto_25
    const/16 v0, 0x8

    if-ge v2, v0, :cond_4c

    .line 92
    sget-object v0, LMain$1;->$SwitchMap$Main$Normalization:[I

    invoke-virtual {p1}, LMain$Normalization;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_e8

    .line 95
    const-wide/high16 v0, 0x3ff0

    .line 97
    :goto_36
    aput-wide v0, v3, v2

    .line 90
    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_25

    .line 83
    :cond_3c
    const-string v0, "(ratio)"

    goto :goto_13

    .line 93
    :pswitch_3f
    aget-object v0, p0, v2

    const/4 v1, 0x0

    aget-wide v0, v0, v1

    goto :goto_36

    .line 94
    :pswitch_45
    const/4 v0, 0x0

    aget-object v0, p0, v0

    const/4 v1, 0x0

    aget-wide v0, v0, v1

    goto :goto_36

    .line 100
    :cond_4c
    const/4 v0, 0x0

    :goto_4d
    const/4 v1, 0x7

    if-ge v0, v1, :cond_e7

    .line 101
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "%4d: %8.3g %8.3g %8.3g %8.3g %8.3g %8.3g %8.3g %8.3g\n"

    const/16 v4, 0x9

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    const/4 v6, 0x0

    aget-object v6, p0, v6

    aget-wide v6, v6, v0

    const/4 v8, 0x0

    aget-wide v8, v3, v8

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    const/4 v6, 0x1

    aget-object v6, p0, v6

    aget-wide v6, v6, v0

    const/4 v8, 0x1

    aget-wide v8, v3, v8

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    const/4 v6, 0x2

    aget-object v6, p0, v6

    aget-wide v6, v6, v0

    const/4 v8, 0x2

    aget-wide v8, v3, v8

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x4

    const/4 v6, 0x3

    aget-object v6, p0, v6

    aget-wide v6, v6, v0

    const/4 v8, 0x3

    aget-wide v8, v3, v8

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x5

    const/4 v6, 0x4

    aget-object v6, p0, v6

    aget-wide v6, v6, v0

    const/4 v8, 0x4

    aget-wide v8, v3, v8

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x6

    const/4 v6, 0x5

    aget-object v6, p0, v6

    aget-wide v6, v6, v0

    const/4 v8, 0x5

    aget-wide v8, v3, v8

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x7

    const/4 v6, 0x6

    aget-object v6, p0, v6

    aget-wide v6, v6, v0

    const/4 v8, 0x6

    aget-wide v8, v3, v8

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v4, v5

    const/16 v5, 0x8

    const/4 v6, 0x7

    aget-object v6, p0, v6

    aget-wide v6, v6, v0

    const/4 v8, 0x7

    aget-wide v8, v3, v8

    div-double/2addr v6, v8

    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-virtual {v1, v2, v4}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 100
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_4d

    .line 113
    :cond_e7
    return-void

    .line 92
    :pswitch_data_e8
    .packed-switch 0x1
        :pswitch_3f
        :pswitch_45
    .end packed-switch
.end method

.method public static run(ZI)V
    .registers 7
    .parameter
    .parameter

    .prologue
    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 116
    const/4 v0, 0x0

    check-cast v0, [[D

    move v4, v1

    move-object v3, v0

    .line 119
    :goto_7
    const/4 v0, 0x5

    if-ge v4, v0, :cond_50

    .line 120
    if-nez p0, :cond_e

    if-nez v4, :cond_3a

    :cond_e
    move v0, v2

    :goto_f
    invoke-static {p1, v0}, LMain;->runAllTests(IZ)[[D

    move-result-object v0

    .line 122
    if-nez v3, :cond_3c

    .line 128
    :goto_15
    invoke-static {v0, p0}, LMain;->checkTimes([[DZ)Z

    move-result v3

    if-eqz v3, :cond_41

    .line 133
    :goto_1b
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Done with runs."

    invoke-virtual {v1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 135
    invoke-static {v0, v2}, LMain;->checkTimes([[DZ)Z

    move-result v1

    .line 137
    if-nez v1, :cond_4e

    .line 141
    :goto_28
    if-eqz v2, :cond_46

    .line 142
    sget-object v1, LMain$Normalization;->NONE:LMain$Normalization;

    invoke-static {v0, v1}, LMain;->printTimings([[DLMain$Normalization;)V

    .line 143
    sget-object v1, LMain$Normalization;->TOP_LEFT:LMain$Normalization;

    invoke-static {v0, v1}, LMain;->printTimings([[DLMain$Normalization;)V

    .line 144
    sget-object v1, LMain$Normalization;->PER_COLUMN:LMain$Normalization;

    invoke-static {v0, v1}, LMain;->printTimings([[DLMain$Normalization;)V

    .line 148
    :goto_39
    return-void

    :cond_3a
    move v0, v1

    .line 120
    goto :goto_f

    .line 125
    :cond_3c
    invoke-static {v3, v0, v4}, LMain;->combineTimings([[D[[DI)V

    move-object v0, v3

    goto :goto_15

    .line 119
    :cond_41
    add-int/lit8 v3, v4, 0x1

    move v4, v3

    move-object v3, v0

    goto :goto_7

    .line 146
    :cond_46
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "\nAll times are within the expected ranges."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_39

    :cond_4e
    move v2, p0

    goto :goto_28

    :cond_50
    move-object v0, v3

    goto :goto_1b
.end method

.method public static runAllTests(IZ)[[D
    .registers 25
    .parameter
    .parameter

    .prologue
    .line 193
    move/from16 v0, p0

    int-to-double v1, v0

    const-wide/high16 v3, 0x4059

    mul-double/2addr v1, v3

    const-wide v3, 0x408f400000000000L

    mul-double v2, v1, v3

    .line 195
    const/16 v1, 0x8

    const/4 v4, 0x7

    filled-new-array {v1, v4}, [I

    move-result-object v1

    sget-object v4, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    invoke-static {v4, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [[D

    .line 200
    if-eqz p1, :cond_25

    .line 201
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Running A..."

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 204
    :cond_25
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    .line 205
    invoke-static/range {p0 .. p0}, LMain;->testA0(I)V

    .line 206
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    .line 207
    invoke-static/range {p0 .. p0}, LMain;->testA1(I)V

    .line 208
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 209
    invoke-static/range {p0 .. p0}, LMain;->testA2(I)V

    .line 210
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    .line 211
    invoke-static/range {p0 .. p0}, LMain;->testA3(I)V

    .line 212
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    .line 213
    invoke-static/range {p0 .. p0}, LMain;->testA4(I)V

    .line 214
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    .line 215
    invoke-static/range {p0 .. p0}, LMain;->testA5(I)V

    .line 216
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v16

    .line 217
    invoke-static/range {p0 .. p0}, LMain;->testA6(I)V

    .line 218
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v18

    .line 220
    const/16 v20, 0x0

    aget-object v20, v1, v20

    const/16 v21, 0x0

    sub-long v4, v6, v4

    long-to-double v4, v4

    div-double/2addr v4, v2

    aput-wide v4, v20, v21

    .line 221
    const/4 v4, 0x0

    aget-object v4, v1, v4

    const/4 v5, 0x1

    sub-long v6, v8, v6

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 222
    const/4 v4, 0x0

    aget-object v4, v1, v4

    const/4 v5, 0x2

    sub-long v6, v10, v8

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 223
    const/4 v4, 0x0

    aget-object v4, v1, v4

    const/4 v5, 0x3

    sub-long v6, v12, v10

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 224
    const/4 v4, 0x0

    aget-object v4, v1, v4

    const/4 v5, 0x4

    sub-long v6, v14, v12

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 225
    const/4 v4, 0x0

    aget-object v4, v1, v4

    const/4 v5, 0x5

    sub-long v6, v16, v14

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 226
    const/4 v4, 0x0

    aget-object v4, v1, v4

    const/4 v5, 0x6

    sub-long v6, v18, v16

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 230
    if-eqz p1, :cond_ab

    .line 231
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Running B..."

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 234
    :cond_ab
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    .line 235
    invoke-static/range {p0 .. p0}, LMain;->testB0(I)V

    .line 236
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    .line 237
    invoke-static/range {p0 .. p0}, LMain;->testB1(I)V

    .line 238
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 239
    invoke-static/range {p0 .. p0}, LMain;->testB2(I)V

    .line 240
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    .line 241
    invoke-static/range {p0 .. p0}, LMain;->testB3(I)V

    .line 242
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    .line 243
    invoke-static/range {p0 .. p0}, LMain;->testB4(I)V

    .line 244
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    .line 245
    invoke-static/range {p0 .. p0}, LMain;->testB5(I)V

    .line 246
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v16

    .line 247
    invoke-static/range {p0 .. p0}, LMain;->testB6(I)V

    .line 248
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v18

    .line 250
    const/16 v20, 0x1

    aget-object v20, v1, v20

    const/16 v21, 0x0

    sub-long v4, v6, v4

    long-to-double v4, v4

    div-double/2addr v4, v2

    aput-wide v4, v20, v21

    .line 251
    const/4 v4, 0x1

    aget-object v4, v1, v4

    const/4 v5, 0x1

    sub-long v6, v8, v6

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 252
    const/4 v4, 0x1

    aget-object v4, v1, v4

    const/4 v5, 0x2

    sub-long v6, v10, v8

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 253
    const/4 v4, 0x1

    aget-object v4, v1, v4

    const/4 v5, 0x3

    sub-long v6, v12, v10

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 254
    const/4 v4, 0x1

    aget-object v4, v1, v4

    const/4 v5, 0x4

    sub-long v6, v14, v12

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 255
    const/4 v4, 0x1

    aget-object v4, v1, v4

    const/4 v5, 0x5

    sub-long v6, v16, v14

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 256
    const/4 v4, 0x1

    aget-object v4, v1, v4

    const/4 v5, 0x6

    sub-long v6, v18, v16

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 260
    if-eqz p1, :cond_131

    .line 261
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Running C..."

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 264
    :cond_131
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    .line 265
    invoke-static/range {p0 .. p0}, LMain;->testC0(I)V

    .line 266
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    .line 267
    invoke-static/range {p0 .. p0}, LMain;->testC1(I)V

    .line 268
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 269
    invoke-static/range {p0 .. p0}, LMain;->testC2(I)V

    .line 270
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    .line 271
    invoke-static/range {p0 .. p0}, LMain;->testC3(I)V

    .line 272
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    .line 273
    invoke-static/range {p0 .. p0}, LMain;->testC4(I)V

    .line 274
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    .line 275
    invoke-static/range {p0 .. p0}, LMain;->testC5(I)V

    .line 276
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v16

    .line 277
    invoke-static/range {p0 .. p0}, LMain;->testC6(I)V

    .line 278
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v18

    .line 280
    const/16 v20, 0x2

    aget-object v20, v1, v20

    const/16 v21, 0x0

    sub-long v4, v6, v4

    long-to-double v4, v4

    div-double/2addr v4, v2

    aput-wide v4, v20, v21

    .line 281
    const/4 v4, 0x2

    aget-object v4, v1, v4

    const/4 v5, 0x1

    sub-long v6, v8, v6

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 282
    const/4 v4, 0x2

    aget-object v4, v1, v4

    const/4 v5, 0x2

    sub-long v6, v10, v8

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 283
    const/4 v4, 0x2

    aget-object v4, v1, v4

    const/4 v5, 0x3

    sub-long v6, v12, v10

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 284
    const/4 v4, 0x2

    aget-object v4, v1, v4

    const/4 v5, 0x4

    sub-long v6, v14, v12

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 285
    const/4 v4, 0x2

    aget-object v4, v1, v4

    const/4 v5, 0x5

    sub-long v6, v16, v14

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 286
    const/4 v4, 0x2

    aget-object v4, v1, v4

    const/4 v5, 0x6

    sub-long v6, v18, v16

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 290
    if-eqz p1, :cond_1b7

    .line 291
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Running D..."

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 294
    :cond_1b7
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    .line 295
    invoke-static/range {p0 .. p0}, LMain;->testD0(I)V

    .line 296
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    .line 297
    invoke-static/range {p0 .. p0}, LMain;->testD1(I)V

    .line 298
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 299
    invoke-static/range {p0 .. p0}, LMain;->testD2(I)V

    .line 300
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    .line 301
    invoke-static/range {p0 .. p0}, LMain;->testD3(I)V

    .line 302
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    .line 303
    invoke-static/range {p0 .. p0}, LMain;->testD4(I)V

    .line 304
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    .line 305
    invoke-static/range {p0 .. p0}, LMain;->testD5(I)V

    .line 306
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v16

    .line 307
    invoke-static/range {p0 .. p0}, LMain;->testD6(I)V

    .line 308
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v18

    .line 310
    const/16 v20, 0x3

    aget-object v20, v1, v20

    const/16 v21, 0x0

    sub-long v4, v6, v4

    long-to-double v4, v4

    div-double/2addr v4, v2

    aput-wide v4, v20, v21

    .line 311
    const/4 v4, 0x3

    aget-object v4, v1, v4

    const/4 v5, 0x1

    sub-long v6, v8, v6

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 312
    const/4 v4, 0x3

    aget-object v4, v1, v4

    const/4 v5, 0x2

    sub-long v6, v10, v8

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 313
    const/4 v4, 0x3

    aget-object v4, v1, v4

    const/4 v5, 0x3

    sub-long v6, v12, v10

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 314
    const/4 v4, 0x3

    aget-object v4, v1, v4

    const/4 v5, 0x4

    sub-long v6, v14, v12

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 315
    const/4 v4, 0x3

    aget-object v4, v1, v4

    const/4 v5, 0x5

    sub-long v6, v16, v14

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 316
    const/4 v4, 0x3

    aget-object v4, v1, v4

    const/4 v5, 0x6

    sub-long v6, v18, v16

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 320
    if-eqz p1, :cond_23d

    .line 321
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Running E..."

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 324
    :cond_23d
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    .line 325
    invoke-static/range {p0 .. p0}, LMain;->testE0(I)V

    .line 326
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    .line 327
    invoke-static/range {p0 .. p0}, LMain;->testE1(I)V

    .line 328
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 329
    invoke-static/range {p0 .. p0}, LMain;->testE2(I)V

    .line 330
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    .line 331
    invoke-static/range {p0 .. p0}, LMain;->testE3(I)V

    .line 332
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    .line 333
    invoke-static/range {p0 .. p0}, LMain;->testE4(I)V

    .line 334
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    .line 335
    invoke-static/range {p0 .. p0}, LMain;->testE5(I)V

    .line 336
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v16

    .line 337
    invoke-static/range {p0 .. p0}, LMain;->testE6(I)V

    .line 338
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v18

    .line 340
    const/16 v20, 0x4

    aget-object v20, v1, v20

    const/16 v21, 0x0

    sub-long v4, v6, v4

    long-to-double v4, v4

    div-double/2addr v4, v2

    aput-wide v4, v20, v21

    .line 341
    const/4 v4, 0x4

    aget-object v4, v1, v4

    const/4 v5, 0x1

    sub-long v6, v8, v6

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 342
    const/4 v4, 0x4

    aget-object v4, v1, v4

    const/4 v5, 0x2

    sub-long v6, v10, v8

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 343
    const/4 v4, 0x4

    aget-object v4, v1, v4

    const/4 v5, 0x3

    sub-long v6, v12, v10

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 344
    const/4 v4, 0x4

    aget-object v4, v1, v4

    const/4 v5, 0x4

    sub-long v6, v14, v12

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 345
    const/4 v4, 0x4

    aget-object v4, v1, v4

    const/4 v5, 0x5

    sub-long v6, v16, v14

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 346
    const/4 v4, 0x4

    aget-object v4, v1, v4

    const/4 v5, 0x6

    sub-long v6, v18, v16

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 350
    if-eqz p1, :cond_2c3

    .line 351
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v5, "Running F..."

    invoke-virtual {v4, v5}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 354
    :cond_2c3
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    .line 355
    invoke-static/range {p0 .. p0}, LMain;->testF0(I)V

    .line 356
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v6

    .line 357
    invoke-static/range {p0 .. p0}, LMain;->testF1(I)V

    .line 358
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    .line 359
    invoke-static/range {p0 .. p0}, LMain;->testF2(I)V

    .line 360
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    .line 361
    invoke-static/range {p0 .. p0}, LMain;->testF3(I)V

    .line 362
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v12

    .line 363
    invoke-static/range {p0 .. p0}, LMain;->testF4(I)V

    .line 364
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v14

    .line 365
    invoke-static/range {p0 .. p0}, LMain;->testF5(I)V

    .line 366
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v16

    .line 367
    invoke-static/range {p0 .. p0}, LMain;->testF6(I)V

    .line 368
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v18

    .line 370
    const/16 v20, 0x5

    aget-object v20, v1, v20

    const/16 v21, 0x0

    sub-long v4, v6, v4

    long-to-double v4, v4

    div-double/2addr v4, v2

    aput-wide v4, v20, v21

    .line 371
    const/4 v4, 0x5

    aget-object v4, v1, v4

    const/4 v5, 0x1

    sub-long v6, v8, v6

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 372
    const/4 v4, 0x5

    aget-object v4, v1, v4

    const/4 v5, 0x2

    sub-long v6, v10, v8

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 373
    const/4 v4, 0x5

    aget-object v4, v1, v4

    const/4 v5, 0x3

    sub-long v6, v12, v10

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 374
    const/4 v4, 0x5

    aget-object v4, v1, v4

    const/4 v5, 0x4

    sub-long v6, v14, v12

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 375
    const/4 v4, 0x5

    aget-object v4, v1, v4

    const/4 v5, 0x5

    sub-long v6, v16, v14

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 376
    const/4 v4, 0x5

    aget-object v4, v1, v4

    const/4 v5, 0x6

    sub-long v6, v18, v16

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 380
    div-int/lit8 v4, p0, 0x5

    .line 381
    const-wide/high16 v5, 0x4014

    div-double/2addr v2, v5

    .line 385
    if-eqz p1, :cond_34e

    .line 386
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "Running G..."

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 389
    :cond_34e
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    .line 390
    invoke-static {v4}, LMain;->testG0(I)V

    .line 391
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v7

    .line 392
    invoke-static {v4}, LMain;->testG1(I)V

    .line 393
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v9

    .line 394
    invoke-static {v4}, LMain;->testG2(I)V

    .line 395
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v11

    .line 396
    invoke-static {v4}, LMain;->testG3(I)V

    .line 397
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v13

    .line 398
    invoke-static {v4}, LMain;->testG4(I)V

    .line 399
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v15

    .line 400
    invoke-static {v4}, LMain;->testG5(I)V

    .line 401
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v17

    .line 402
    invoke-static {v4}, LMain;->testG6(I)V

    .line 403
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v19

    .line 405
    const/16 v21, 0x6

    aget-object v21, v1, v21

    const/16 v22, 0x0

    sub-long v5, v7, v5

    long-to-double v5, v5

    div-double/2addr v5, v2

    aput-wide v5, v21, v22

    .line 406
    const/4 v5, 0x6

    aget-object v5, v1, v5

    const/4 v6, 0x1

    sub-long v7, v9, v7

    long-to-double v7, v7

    div-double/2addr v7, v2

    aput-wide v7, v5, v6

    .line 407
    const/4 v5, 0x6

    aget-object v5, v1, v5

    const/4 v6, 0x2

    sub-long v7, v11, v9

    long-to-double v7, v7

    div-double/2addr v7, v2

    aput-wide v7, v5, v6

    .line 408
    const/4 v5, 0x6

    aget-object v5, v1, v5

    const/4 v6, 0x3

    sub-long v7, v13, v11

    long-to-double v7, v7

    div-double/2addr v7, v2

    aput-wide v7, v5, v6

    .line 409
    const/4 v5, 0x6

    aget-object v5, v1, v5

    const/4 v6, 0x4

    sub-long v7, v15, v13

    long-to-double v7, v7

    div-double/2addr v7, v2

    aput-wide v7, v5, v6

    .line 410
    const/4 v5, 0x6

    aget-object v5, v1, v5

    const/4 v6, 0x5

    sub-long v7, v17, v15

    long-to-double v7, v7

    div-double/2addr v7, v2

    aput-wide v7, v5, v6

    .line 411
    const/4 v5, 0x6

    aget-object v5, v1, v5

    const/4 v6, 0x6

    sub-long v7, v19, v17

    long-to-double v7, v7

    div-double/2addr v7, v2

    aput-wide v7, v5, v6

    .line 415
    if-eqz p1, :cond_3d4

    .line 416
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v6, "Running H..."

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 419
    :cond_3d4
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5

    .line 420
    invoke-static {v4}, LMain;->testH0(I)V

    .line 421
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v7

    .line 422
    invoke-static {v4}, LMain;->testH1(I)V

    .line 423
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v9

    .line 424
    invoke-static {v4}, LMain;->testH2(I)V

    .line 425
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v11

    .line 426
    invoke-static {v4}, LMain;->testH3(I)V

    .line 427
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v13

    .line 428
    invoke-static {v4}, LMain;->testH4(I)V

    .line 429
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v15

    .line 430
    invoke-static {v4}, LMain;->testH5(I)V

    .line 431
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v17

    .line 432
    invoke-static {v4}, LMain;->testH6(I)V

    .line 433
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v19

    .line 435
    const/4 v4, 0x7

    aget-object v4, v1, v4

    const/16 v21, 0x0

    sub-long v5, v7, v5

    long-to-double v5, v5

    div-double/2addr v5, v2

    aput-wide v5, v4, v21

    .line 436
    const/4 v4, 0x7

    aget-object v4, v1, v4

    const/4 v5, 0x1

    sub-long v6, v9, v7

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 437
    const/4 v4, 0x7

    aget-object v4, v1, v4

    const/4 v5, 0x2

    sub-long v6, v11, v9

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 438
    const/4 v4, 0x7

    aget-object v4, v1, v4

    const/4 v5, 0x3

    sub-long v6, v13, v11

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 439
    const/4 v4, 0x7

    aget-object v4, v1, v4

    const/4 v5, 0x4

    sub-long v6, v15, v13

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 440
    const/4 v4, 0x7

    aget-object v4, v1, v4

    const/4 v5, 0x5

    sub-long v6, v17, v15

    long-to-double v6, v6

    div-double/2addr v6, v2

    aput-wide v6, v4, v5

    .line 441
    const/4 v4, 0x7

    aget-object v4, v1, v4

    const/4 v5, 0x6

    sub-long v6, v19, v17

    long-to-double v6, v6

    div-double v2, v6, v2

    aput-wide v2, v4, v5

    .line 443
    return-object v1
.end method

.method public static testA0(I)V
    .registers 2
    .parameter

    .prologue
    .line 479
    :goto_0
    if-lez p0, :cond_c

    .line 480
    const/16 v0, 0x64

    :goto_4
    if-lez v0, :cond_9

    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    .line 479
    :cond_9
    add-int/lit8 p0, p0, -0x1

    goto :goto_0

    .line 484
    :cond_c
    return-void
.end method

.method public static testA1(I)V
    .registers 3
    .parameter

    .prologue
    .line 487
    const/16 v1, 0x64

    .line 489
    :goto_2
    if-lez p0, :cond_d

    .line 490
    const/4 v0, 0x0

    :goto_5
    if-ge v0, v1, :cond_a

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 489
    :cond_a
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 494
    :cond_d
    return-void
.end method

.method public static testA2(I)V
    .registers 4
    .parameter

    .prologue
    .line 497
    sget-object v1, LMain;->INNER_ARRAY:[I

    .line 499
    :goto_2
    if-lez p0, :cond_e

    .line 500
    const/4 v0, 0x0

    :goto_5
    array-length v2, v1

    if-ge v0, v2, :cond_b

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 499
    :cond_b
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 504
    :cond_e
    return-void
.end method

.method public static testA3(I)V
    .registers 5
    .parameter

    .prologue
    .line 507
    sget-object v1, LMain;->INNER_ARRAY:[I

    .line 509
    :goto_2
    if-lez p0, :cond_10

    .line 510
    array-length v2, v1

    const/4 v0, 0x0

    :goto_6
    if-ge v0, v2, :cond_d

    aget v3, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 509
    :cond_d
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 514
    :cond_10
    return-void
.end method

.method public static testA4(I)V
    .registers 4
    .parameter

    .prologue
    .line 517
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 519
    :goto_2
    if-lez p0, :cond_f

    .line 520
    const/4 v0, 0x0

    :goto_5
    iget v2, v1, LMain$Target;->size:I

    if-ge v0, v2, :cond_c

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 519
    :cond_c
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 524
    :cond_f
    return-void
.end method

.method public static testA5(I)V
    .registers 4
    .parameter

    .prologue
    .line 527
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 529
    :goto_2
    if-lez p0, :cond_11

    .line 530
    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1}, LMain$Target;->size()I

    move-result v2

    if-ge v0, v2, :cond_e

    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 529
    :cond_e
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 534
    :cond_11
    return-void
.end method

.method public static testA6(I)V
    .registers 4
    .parameter

    .prologue
    .line 537
    sget-object v0, LMain;->INNER_LIST:Ljava/util/ArrayList;

    .line 539
    :goto_2
    if-lez p0, :cond_15

    .line 540
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_12

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    goto :goto_8

    .line 539
    :cond_12
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 544
    :cond_15
    return-void
.end method

.method public static testB0(I)V
    .registers 4
    .parameter

    .prologue
    .line 547
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 549
    :goto_2
    if-lez p0, :cond_14

    .line 550
    const/16 v0, 0x64

    :goto_6
    if-lez v0, :cond_11

    .line 551
    iget v2, v1, LMain$Target;->value:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, LMain$Target;->value:I

    .line 550
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 549
    :cond_11
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 554
    :cond_14
    return-void
.end method

.method public static testB1(I)V
    .registers 5
    .parameter

    .prologue
    .line 557
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 558
    const/16 v2, 0x64

    .line 560
    :goto_4
    if-lez p0, :cond_15

    .line 561
    const/4 v0, 0x0

    :goto_7
    if-ge v0, v2, :cond_12

    .line 562
    iget v3, v1, LMain$Target;->value:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v1, LMain$Target;->value:I

    .line 561
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 560
    :cond_12
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 565
    :cond_15
    return-void
.end method

.method public static testB2(I)V
    .registers 5
    .parameter

    .prologue
    .line 568
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 569
    sget-object v2, LMain;->INNER_ARRAY:[I

    .line 571
    :goto_4
    if-lez p0, :cond_16

    .line 572
    const/4 v0, 0x0

    :goto_7
    array-length v3, v2

    if-ge v0, v3, :cond_13

    .line 573
    iget v3, v1, LMain$Target;->value:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v1, LMain$Target;->value:I

    .line 572
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 571
    :cond_13
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 576
    :cond_16
    return-void
.end method

.method public static testB3(I)V
    .registers 6
    .parameter

    .prologue
    .line 579
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 580
    sget-object v2, LMain;->INNER_ARRAY:[I

    .line 582
    :goto_4
    if-lez p0, :cond_18

    .line 583
    array-length v3, v2

    const/4 v0, 0x0

    :goto_8
    if-ge v0, v3, :cond_15

    aget v4, v2, v0

    .line 584
    iget v4, v1, LMain$Target;->value:I

    add-int/lit8 v4, v4, 0x1

    iput v4, v1, LMain$Target;->value:I

    .line 583
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 582
    :cond_15
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 587
    :cond_18
    return-void
.end method

.method public static testB4(I)V
    .registers 4
    .parameter

    .prologue
    .line 590
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 592
    :goto_2
    if-lez p0, :cond_15

    .line 593
    const/4 v0, 0x0

    :goto_5
    iget v2, v1, LMain$Target;->size:I

    if-ge v0, v2, :cond_12

    .line 594
    iget v2, v1, LMain$Target;->value:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, LMain$Target;->value:I

    .line 593
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 592
    :cond_12
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 597
    :cond_15
    return-void
.end method

.method public static testB5(I)V
    .registers 4
    .parameter

    .prologue
    .line 600
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 602
    :goto_2
    if-lez p0, :cond_17

    .line 603
    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1}, LMain$Target;->size()I

    move-result v2

    if-ge v0, v2, :cond_14

    .line 604
    iget v2, v1, LMain$Target;->value:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v1, LMain$Target;->value:I

    .line 603
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 602
    :cond_14
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 607
    :cond_17
    return-void
.end method

.method public static testB6(I)V
    .registers 5
    .parameter

    .prologue
    .line 610
    sget-object v0, LMain;->TARGET:LMain$Target;

    .line 611
    sget-object v1, LMain;->INNER_LIST:Ljava/util/ArrayList;

    .line 613
    :goto_4
    if-lez p0, :cond_1d

    .line 614
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 615
    iget v3, v0, LMain$Target;->value:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v0, LMain$Target;->value:I

    goto :goto_a

    .line 613
    :cond_1a
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 618
    :cond_1d
    return-void
.end method

.method public static testC0(I)V
    .registers 4
    .parameter

    .prologue
    .line 621
    sget-object v1, LMain;->INNER_ARRAY:[I

    .line 623
    :goto_2
    if-lez p0, :cond_14

    .line 624
    const/16 v0, 0x63

    :goto_6
    if-ltz v0, :cond_11

    .line 625
    aget v2, v1, v0

    add-int/lit8 v2, v2, 0x1

    aput v2, v1, v0

    .line 624
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 623
    :cond_11
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 628
    :cond_14
    return-void
.end method

.method public static testC1(I)V
    .registers 5
    .parameter

    .prologue
    .line 631
    sget-object v1, LMain;->INNER_ARRAY:[I

    .line 632
    const/16 v2, 0x64

    .line 634
    :goto_4
    if-lez p0, :cond_15

    .line 635
    const/4 v0, 0x0

    :goto_7
    if-ge v0, v2, :cond_12

    .line 636
    aget v3, v1, v0

    add-int/lit8 v3, v3, 0x1

    aput v3, v1, v0

    .line 635
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 634
    :cond_12
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 639
    :cond_15
    return-void
.end method

.method public static testC2(I)V
    .registers 4
    .parameter

    .prologue
    .line 642
    sget-object v1, LMain;->INNER_ARRAY:[I

    .line 644
    :goto_2
    if-lez p0, :cond_14

    .line 645
    const/4 v0, 0x0

    :goto_5
    array-length v2, v1

    if-ge v0, v2, :cond_11

    .line 646
    aget v2, v1, v0

    add-int/lit8 v2, v2, 0x1

    aput v2, v1, v0

    .line 645
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 644
    :cond_11
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 649
    :cond_14
    return-void
.end method

.method public static testC3(I)V
    .registers 6
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 652
    sget-object v2, LMain;->INNER_ARRAY:[I

    .line 654
    :goto_3
    if-lez p0, :cond_15

    .line 655
    array-length v3, v2

    move v0, v1

    :goto_7
    if-ge v0, v3, :cond_12

    aget v4, v2, v0

    .line 656
    add-int/lit8 v4, v4, 0x1

    aput v4, v2, v1

    .line 655
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 654
    :cond_12
    add-int/lit8 p0, p0, -0x1

    goto :goto_3

    .line 659
    :cond_15
    return-void
.end method

.method public static testC4(I)V
    .registers 5
    .parameter

    .prologue
    .line 662
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 663
    sget-object v2, LMain;->INNER_ARRAY:[I

    .line 665
    :goto_4
    if-lez p0, :cond_17

    .line 666
    const/4 v0, 0x0

    :goto_7
    iget v3, v1, LMain$Target;->size:I

    if-ge v0, v3, :cond_14

    .line 667
    aget v3, v2, v0

    add-int/lit8 v3, v3, 0x1

    aput v3, v2, v0

    .line 666
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 665
    :cond_14
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 670
    :cond_17
    return-void
.end method

.method public static testC5(I)V
    .registers 5
    .parameter

    .prologue
    .line 673
    sget-object v1, LMain;->INNER_ARRAY:[I

    .line 674
    sget-object v2, LMain;->TARGET:LMain$Target;

    .line 676
    :goto_4
    if-lez p0, :cond_19

    .line 677
    const/4 v0, 0x0

    :goto_7
    invoke-virtual {v2}, LMain$Target;->size()I

    move-result v3

    if-ge v0, v3, :cond_16

    .line 678
    aget v3, v1, v0

    add-int/lit8 v3, v3, 0x1

    aput v3, v1, v0

    .line 677
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 676
    :cond_16
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 681
    :cond_19
    return-void
.end method

.method public static testC6(I)V
    .registers 6
    .parameter

    .prologue
    .line 684
    sget-object v0, LMain;->INNER_ARRAY:[I

    .line 685
    sget-object v1, LMain;->INNER_LIST:Ljava/util/ArrayList;

    .line 687
    :goto_4
    if-lez p0, :cond_1e

    .line 688
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 689
    const/4 v3, 0x0

    aget v4, v0, v3

    add-int/lit8 v4, v4, 0x1

    aput v4, v0, v3

    goto :goto_a

    .line 687
    :cond_1b
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 692
    :cond_1e
    return-void
.end method

.method public static testD0(I)V
    .registers 3
    .parameter

    .prologue
    .line 695
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 697
    :goto_2
    if-lez p0, :cond_11

    .line 698
    const/16 v0, 0x64

    :goto_6
    if-lez v0, :cond_e

    .line 699
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 698
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 697
    :cond_e
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 702
    :cond_11
    return-void
.end method

.method public static testD1(I)V
    .registers 4
    .parameter

    .prologue
    .line 705
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 706
    const/16 v2, 0x64

    .line 708
    :goto_4
    if-lez p0, :cond_12

    .line 709
    const/4 v0, 0x0

    :goto_7
    if-ge v0, v2, :cond_f

    .line 710
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 709
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 708
    :cond_f
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 713
    :cond_12
    return-void
.end method

.method public static testD2(I)V
    .registers 5
    .parameter

    .prologue
    .line 716
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 717
    sget-object v2, LMain;->INNER_ARRAY:[I

    .line 719
    :goto_4
    if-lez p0, :cond_13

    .line 720
    const/4 v0, 0x0

    :goto_7
    array-length v3, v2

    if-ge v0, v3, :cond_10

    .line 721
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 720
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 719
    :cond_10
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 724
    :cond_13
    return-void
.end method

.method public static testD3(I)V
    .registers 6
    .parameter

    .prologue
    .line 727
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 728
    sget-object v2, LMain;->INNER_ARRAY:[I

    .line 730
    :goto_4
    if-lez p0, :cond_15

    .line 731
    array-length v3, v2

    const/4 v0, 0x0

    :goto_8
    if-ge v0, v3, :cond_12

    aget v4, v2, v0

    .line 732
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 731
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 730
    :cond_12
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 735
    :cond_15
    return-void
.end method

.method public static testD4(I)V
    .registers 4
    .parameter

    .prologue
    .line 738
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 740
    :goto_2
    if-lez p0, :cond_12

    .line 741
    const/4 v0, 0x0

    :goto_5
    iget v2, v1, LMain$Target;->size:I

    if-ge v0, v2, :cond_f

    .line 742
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 741
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 740
    :cond_f
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 745
    :cond_12
    return-void
.end method

.method public static testD5(I)V
    .registers 4
    .parameter

    .prologue
    .line 748
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 750
    :goto_2
    if-lez p0, :cond_14

    .line 751
    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1}, LMain$Target;->size()I

    move-result v2

    if-ge v0, v2, :cond_11

    .line 752
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 751
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 750
    :cond_11
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 755
    :cond_14
    return-void
.end method

.method public static testD6(I)V
    .registers 5
    .parameter

    .prologue
    .line 758
    sget-object v0, LMain;->TARGET:LMain$Target;

    .line 759
    sget-object v1, LMain;->INNER_LIST:Ljava/util/ArrayList;

    .line 761
    :goto_4
    if-lez p0, :cond_1a

    .line 762
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_17

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 763
    invoke-virtual {v0}, LMain$Target;->simple()V

    goto :goto_a

    .line 761
    :cond_17
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 766
    :cond_1a
    return-void
.end method

.method public static testE0(I)V
    .registers 3
    .parameter

    .prologue
    .line 769
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 771
    :goto_2
    if-lez p0, :cond_16

    .line 772
    const/16 v0, 0x64

    :goto_6
    if-lez v0, :cond_13

    .line 773
    monitor-enter v1

    .line 774
    :try_start_9
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 775
    monitor-exit v1

    .line 772
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 775
    :catchall_10
    move-exception v0

    monitor-exit v1
    :try_end_12
    .catchall {:try_start_9 .. :try_end_12} :catchall_10

    throw v0

    .line 771
    :cond_13
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 778
    :cond_16
    return-void
.end method

.method public static testE1(I)V
    .registers 4
    .parameter

    .prologue
    .line 781
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 782
    const/16 v2, 0x64

    .line 784
    :goto_4
    if-lez p0, :cond_17

    .line 785
    const/4 v0, 0x0

    :goto_7
    if-ge v0, v2, :cond_14

    .line 786
    monitor-enter v1

    .line 787
    :try_start_a
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 788
    monitor-exit v1

    .line 785
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 788
    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_a .. :try_end_13} :catchall_11

    throw v0

    .line 784
    :cond_14
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 791
    :cond_17
    return-void
.end method

.method public static testE2(I)V
    .registers 5
    .parameter

    .prologue
    .line 794
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 795
    sget-object v2, LMain;->INNER_ARRAY:[I

    .line 797
    :goto_4
    if-lez p0, :cond_18

    .line 798
    const/4 v0, 0x0

    :goto_7
    array-length v3, v2

    if-ge v0, v3, :cond_15

    .line 799
    monitor-enter v1

    .line 800
    :try_start_b
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 801
    monitor-exit v1

    .line 798
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 801
    :catchall_12
    move-exception v0

    monitor-exit v1
    :try_end_14
    .catchall {:try_start_b .. :try_end_14} :catchall_12

    throw v0

    .line 797
    :cond_15
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 804
    :cond_18
    return-void
.end method

.method public static testE3(I)V
    .registers 6
    .parameter

    .prologue
    .line 807
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 808
    sget-object v2, LMain;->INNER_ARRAY:[I

    .line 810
    :goto_4
    if-lez p0, :cond_1a

    .line 811
    array-length v3, v2

    const/4 v0, 0x0

    :goto_8
    if-ge v0, v3, :cond_17

    aget v4, v2, v0

    .line 812
    monitor-enter v1

    .line 813
    :try_start_d
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 814
    monitor-exit v1

    .line 811
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 814
    :catchall_14
    move-exception v0

    monitor-exit v1
    :try_end_16
    .catchall {:try_start_d .. :try_end_16} :catchall_14

    throw v0

    .line 810
    :cond_17
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 817
    :cond_1a
    return-void
.end method

.method public static testE4(I)V
    .registers 4
    .parameter

    .prologue
    .line 820
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 822
    :goto_2
    if-lez p0, :cond_17

    .line 823
    const/4 v0, 0x0

    :goto_5
    iget v2, v1, LMain$Target;->size:I

    if-ge v0, v2, :cond_14

    .line 824
    monitor-enter v1

    .line 825
    :try_start_a
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 826
    monitor-exit v1

    .line 823
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 826
    :catchall_11
    move-exception v0

    monitor-exit v1
    :try_end_13
    .catchall {:try_start_a .. :try_end_13} :catchall_11

    throw v0

    .line 822
    :cond_14
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 829
    :cond_17
    return-void
.end method

.method public static testE5(I)V
    .registers 4
    .parameter

    .prologue
    .line 832
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 834
    :goto_2
    if-lez p0, :cond_19

    .line 835
    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1}, LMain$Target;->size()I

    move-result v2

    if-ge v0, v2, :cond_16

    .line 836
    monitor-enter v1

    .line 837
    :try_start_c
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 838
    monitor-exit v1

    .line 835
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 838
    :catchall_13
    move-exception v0

    monitor-exit v1
    :try_end_15
    .catchall {:try_start_c .. :try_end_15} :catchall_13

    throw v0

    .line 834
    :cond_16
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 841
    :cond_19
    return-void
.end method

.method public static testE6(I)V
    .registers 5
    .parameter

    .prologue
    .line 844
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 845
    sget-object v0, LMain;->INNER_LIST:Ljava/util/ArrayList;

    .line 847
    :goto_4
    if-lez p0, :cond_1f

    .line 848
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 849
    monitor-enter v1

    .line 850
    :try_start_14
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 851
    monitor-exit v1

    goto :goto_a

    :catchall_19
    move-exception v0

    monitor-exit v1
    :try_end_1b
    .catchall {:try_start_14 .. :try_end_1b} :catchall_19

    throw v0

    .line 847
    :cond_1c
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 854
    :cond_1f
    return-void
.end method

.method public static testF0(I)V
    .registers 3
    .parameter

    .prologue
    .line 857
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 859
    :goto_2
    if-lez p0, :cond_1d

    .line 860
    const/16 v0, 0x64

    :goto_6
    if-lez v0, :cond_1a

    .line 861
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 862
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 863
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 864
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 865
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 860
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    .line 859
    :cond_1a
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 868
    :cond_1d
    return-void
.end method

.method public static testF1(I)V
    .registers 4
    .parameter

    .prologue
    .line 871
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 872
    const/16 v2, 0x64

    .line 874
    :goto_4
    if-lez p0, :cond_1e

    .line 875
    const/4 v0, 0x0

    :goto_7
    if-ge v0, v2, :cond_1b

    .line 876
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 877
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 878
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 879
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 880
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 875
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 874
    :cond_1b
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 883
    :cond_1e
    return-void
.end method

.method public static testF2(I)V
    .registers 5
    .parameter

    .prologue
    .line 886
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 887
    sget-object v2, LMain;->INNER_ARRAY:[I

    .line 889
    :goto_4
    if-lez p0, :cond_1f

    .line 890
    const/4 v0, 0x0

    :goto_7
    array-length v3, v2

    if-ge v0, v3, :cond_1c

    .line 891
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 892
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 893
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 894
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 895
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 890
    add-int/lit8 v0, v0, 0x1

    goto :goto_7

    .line 889
    :cond_1c
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 898
    :cond_1f
    return-void
.end method

.method public static testF3(I)V
    .registers 6
    .parameter

    .prologue
    .line 901
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 902
    sget-object v2, LMain;->INNER_ARRAY:[I

    .line 904
    :goto_4
    if-lez p0, :cond_21

    .line 905
    array-length v3, v2

    const/4 v0, 0x0

    :goto_8
    if-ge v0, v3, :cond_1e

    aget v4, v2, v0

    .line 906
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 907
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 908
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 909
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 910
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 905
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 904
    :cond_1e
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 913
    :cond_21
    return-void
.end method

.method public static testF4(I)V
    .registers 4
    .parameter

    .prologue
    .line 916
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 918
    :goto_2
    if-lez p0, :cond_1e

    .line 919
    const/4 v0, 0x0

    :goto_5
    iget v2, v1, LMain$Target;->size:I

    if-ge v0, v2, :cond_1b

    .line 920
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 921
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 922
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 923
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 924
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 919
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 918
    :cond_1b
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 927
    :cond_1e
    return-void
.end method

.method public static testF5(I)V
    .registers 4
    .parameter

    .prologue
    .line 930
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 932
    :goto_2
    if-lez p0, :cond_20

    .line 933
    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1}, LMain$Target;->size()I

    move-result v2

    if-ge v0, v2, :cond_1d

    .line 934
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 935
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 936
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 937
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 938
    invoke-virtual {v1}, LMain$Target;->simple()V

    .line 933
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 932
    :cond_1d
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 941
    :cond_20
    return-void
.end method

.method public static testF6(I)V
    .registers 5
    .parameter

    .prologue
    .line 944
    sget-object v0, LMain;->TARGET:LMain$Target;

    .line 945
    sget-object v1, LMain;->INNER_LIST:Ljava/util/ArrayList;

    .line 947
    :goto_4
    if-lez p0, :cond_26

    .line 948
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_23

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 949
    invoke-virtual {v0}, LMain$Target;->simple()V

    .line 950
    invoke-virtual {v0}, LMain$Target;->simple()V

    .line 951
    invoke-virtual {v0}, LMain$Target;->simple()V

    .line 952
    invoke-virtual {v0}, LMain$Target;->simple()V

    .line 953
    invoke-virtual {v0}, LMain$Target;->simple()V

    goto :goto_a

    .line 947
    :cond_23
    add-int/lit8 p0, p0, -0x1

    goto :goto_4

    .line 956
    :cond_26
    return-void
.end method

.method public static testG0(I)V
    .registers 3
    .parameter

    .prologue
    .line 959
    :goto_0
    if-lez p0, :cond_11

    .line 960
    const/16 v0, 0x64

    :goto_4
    if-lez v0, :cond_e

    .line 961
    new-instance v1, LMain$Target;

    invoke-direct {v1}, LMain$Target;-><init>()V

    .line 960
    add-int/lit8 v0, v0, -0x1

    goto :goto_4

    .line 959
    :cond_e
    add-int/lit8 p0, p0, -0x1

    goto :goto_0

    .line 964
    :cond_11
    return-void
.end method

.method public static testG1(I)V
    .registers 4
    .parameter

    .prologue
    .line 967
    const/16 v1, 0x64

    .line 969
    :goto_2
    if-lez p0, :cond_12

    .line 970
    const/4 v0, 0x0

    :goto_5
    if-ge v0, v1, :cond_f

    .line 971
    new-instance v2, LMain$Target;

    invoke-direct {v2}, LMain$Target;-><init>()V

    .line 970
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 969
    :cond_f
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 974
    :cond_12
    return-void
.end method

.method public static testG2(I)V
    .registers 4
    .parameter

    .prologue
    .line 977
    sget-object v1, LMain;->INNER_ARRAY:[I

    .line 979
    :goto_2
    if-lez p0, :cond_13

    .line 980
    const/4 v0, 0x0

    :goto_5
    array-length v2, v1

    if-ge v0, v2, :cond_10

    .line 981
    new-instance v2, LMain$Target;

    invoke-direct {v2}, LMain$Target;-><init>()V

    .line 980
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 979
    :cond_10
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 984
    :cond_13
    return-void
.end method

.method public static testG3(I)V
    .registers 5
    .parameter

    .prologue
    .line 987
    sget-object v1, LMain;->INNER_ARRAY:[I

    .line 989
    :goto_2
    if-lez p0, :cond_15

    .line 990
    array-length v2, v1

    const/4 v0, 0x0

    :goto_6
    if-ge v0, v2, :cond_12

    aget v3, v1, v0

    .line 991
    new-instance v3, LMain$Target;

    invoke-direct {v3}, LMain$Target;-><init>()V

    .line 990
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 989
    :cond_12
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 994
    :cond_15
    return-void
.end method

.method public static testG4(I)V
    .registers 4
    .parameter

    .prologue
    .line 997
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 999
    :goto_2
    if-lez p0, :cond_14

    .line 1000
    const/4 v0, 0x0

    :goto_5
    iget v2, v1, LMain$Target;->size:I

    if-ge v0, v2, :cond_11

    .line 1001
    new-instance v2, LMain$Target;

    invoke-direct {v2}, LMain$Target;-><init>()V

    .line 1000
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 999
    :cond_11
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 1004
    :cond_14
    return-void
.end method

.method public static testG5(I)V
    .registers 4
    .parameter

    .prologue
    .line 1007
    sget-object v1, LMain;->TARGET:LMain$Target;

    .line 1009
    :goto_2
    if-lez p0, :cond_16

    .line 1010
    const/4 v0, 0x0

    :goto_5
    invoke-virtual {v1}, LMain$Target;->size()I

    move-result v2

    if-ge v0, v2, :cond_13

    .line 1011
    new-instance v2, LMain$Target;

    invoke-direct {v2}, LMain$Target;-><init>()V

    .line 1010
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    .line 1009
    :cond_13
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 1014
    :cond_16
    return-void
.end method

.method public static testG6(I)V
    .registers 4
    .parameter

    .prologue
    .line 1017
    sget-object v0, LMain;->INNER_LIST:Ljava/util/ArrayList;

    .line 1019
    :goto_2
    if-lez p0, :cond_1a

    .line 1020
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_8
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_17

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1021
    new-instance v2, LMain$Target;

    invoke-direct {v2}, LMain$Target;-><init>()V

    goto :goto_8

    .line 1019
    :cond_17
    add-int/lit8 p0, p0, -0x1

    goto :goto_2

    .line 1024
    :cond_1a
    return-void
.end method

.method public static testH0(I)V
    .registers 6
    .parameter

    .prologue
    const/4 v4, 0x0

    .line 1027
    sget-object v1, LMain;->BYTES_1:[B

    .line 1028
    sget-object v2, LMain;->BYTES_2:[B

    .line 1030
    :goto_5
    if-lez p0, :cond_16

    .line 1031
    const/16 v0, 0x64

    :goto_9
    if-lez v0, :cond_13

    .line 1032
    const/16 v3, 0x2000

    invoke-static {v1, v4, v2, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1031
    add-int/lit8 v0, v0, -0x1

    goto :goto_9

    .line 1030
    :cond_13
    add-int/lit8 p0, p0, -0x1

    goto :goto_5

    .line 1035
    :cond_16
    return-void
.end method

.method public static testH1(I)V
    .registers 7
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 1038
    sget-object v2, LMain;->BYTES_1:[B

    .line 1039
    sget-object v3, LMain;->BYTES_2:[B

    .line 1040
    const/16 v4, 0x64

    .line 1042
    :goto_7
    if-lez p0, :cond_17

    move v0, v1

    .line 1043
    :goto_a
    if-ge v0, v4, :cond_14

    .line 1044
    const/16 v5, 0x2000

    invoke-static {v2, v1, v3, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1043
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 1042
    :cond_14
    add-int/lit8 p0, p0, -0x1

    goto :goto_7

    .line 1047
    :cond_17
    return-void
.end method

.method public static testH2(I)V
    .registers 7
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 1050
    sget-object v2, LMain;->BYTES_1:[B

    .line 1051
    sget-object v3, LMain;->BYTES_2:[B

    .line 1052
    sget-object v4, LMain;->INNER_ARRAY:[I

    .line 1054
    :goto_7
    if-lez p0, :cond_18

    move v0, v1

    .line 1055
    :goto_a
    array-length v5, v4

    if-ge v0, v5, :cond_15

    .line 1056
    const/16 v5, 0x2000

    invoke-static {v2, v1, v3, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1055
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 1054
    :cond_15
    add-int/lit8 p0, p0, -0x1

    goto :goto_7

    .line 1059
    :cond_18
    return-void
.end method

.method public static testH3(I)V
    .registers 8
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 1062
    sget-object v2, LMain;->BYTES_1:[B

    .line 1063
    sget-object v3, LMain;->BYTES_2:[B

    .line 1064
    sget-object v4, LMain;->INNER_ARRAY:[I

    .line 1066
    :goto_7
    if-lez p0, :cond_1a

    .line 1067
    array-length v5, v4

    move v0, v1

    :goto_b
    if-ge v0, v5, :cond_17

    aget v6, v4, v0

    .line 1068
    const/16 v6, 0x2000

    invoke-static {v2, v1, v3, v1, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1067
    add-int/lit8 v0, v0, 0x1

    goto :goto_b

    .line 1066
    :cond_17
    add-int/lit8 p0, p0, -0x1

    goto :goto_7

    .line 1071
    :cond_1a
    return-void
.end method

.method public static testH4(I)V
    .registers 7
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 1074
    sget-object v2, LMain;->TARGET:LMain$Target;

    .line 1075
    sget-object v3, LMain;->BYTES_1:[B

    .line 1076
    sget-object v4, LMain;->BYTES_2:[B

    .line 1078
    :goto_7
    if-lez p0, :cond_19

    move v0, v1

    .line 1079
    :goto_a
    iget v5, v2, LMain$Target;->size:I

    if-ge v0, v5, :cond_16

    .line 1080
    const/16 v5, 0x2000

    invoke-static {v3, v1, v4, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1079
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 1078
    :cond_16
    add-int/lit8 p0, p0, -0x1

    goto :goto_7

    .line 1083
    :cond_19
    return-void
.end method

.method public static testH5(I)V
    .registers 7
    .parameter

    .prologue
    const/4 v1, 0x0

    .line 1086
    sget-object v2, LMain;->TARGET:LMain$Target;

    .line 1087
    sget-object v3, LMain;->BYTES_1:[B

    .line 1088
    sget-object v4, LMain;->BYTES_2:[B

    .line 1090
    :goto_7
    if-lez p0, :cond_1b

    move v0, v1

    .line 1091
    :goto_a
    invoke-virtual {v2}, LMain$Target;->size()I

    move-result v5

    if-ge v0, v5, :cond_18

    .line 1092
    const/16 v5, 0x2000

    invoke-static {v3, v1, v4, v1, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1091
    add-int/lit8 v0, v0, 0x1

    goto :goto_a

    .line 1090
    :cond_18
    add-int/lit8 p0, p0, -0x1

    goto :goto_7

    .line 1095
    :cond_1b
    return-void
.end method

.method public static testH6(I)V
    .registers 7
    .parameter

    .prologue
    const/4 v5, 0x0

    .line 1098
    sget-object v0, LMain;->BYTES_1:[B

    .line 1099
    sget-object v1, LMain;->BYTES_2:[B

    .line 1100
    sget-object v2, LMain;->INNER_LIST:Ljava/util/ArrayList;

    .line 1102
    :goto_7
    if-lez p0, :cond_1f

    .line 1103
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_d
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1c

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1104
    const/16 v4, 0x2000

    invoke-static {v0, v5, v1, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    goto :goto_d

    .line 1102
    :cond_1c
    add-int/lit8 p0, p0, -0x1

    goto :goto_7

    .line 1107
    :cond_1f
    return-void
.end method
