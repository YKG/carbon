.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# static fields
.field static final STORAGE_SIZE:I = 0x20000

.field static mStorage:[I

.field static timing:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 8
    const/4 v0, 0x0

    sput-boolean v0, LMain;->timing:Z

    .line 11
    const/high16 v0, 0x2

    new-array v0, v0, [I

    sput-object v0, LMain;->mStorage:[I

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static copyTest()V
    .registers 7

    .prologue
    const/4 v6, 0x0

    const/high16 v5, 0x1

    .line 45
    sget-object v0, LMain;->mStorage:[I

    sget-object v1, LMain;->mStorage:[I

    invoke-static {v0, v6, v1, v5, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 48
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Running copyTest..."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 49
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    .line 50
    const/4 v0, 0x1

    :goto_16
    const/16 v3, 0x23

    if-ge v0, v3, :cond_24

    .line 51
    sget-object v3, LMain;->mStorage:[I

    sget-object v4, LMain;->mStorage:[I

    invoke-static {v3, v6, v4, v5, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 50
    add-int/lit8 v0, v0, 0x1

    goto :goto_16

    .line 54
    :cond_24
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    .line 56
    invoke-static {v1, v2, v3, v4}, LMain;->report(JJ)V

    .line 57
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 4
    .parameter

    .prologue
    const/4 v2, 0x1

    .line 60
    array-length v0, p0

    if-lt v0, v2, :cond_11

    const/4 v0, 0x0

    aget-object v0, p0, v0

    const-string v1, "--timing"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    .line 61
    sput-boolean v2, LMain;->timing:Z

    .line 64
    :cond_11
    invoke-static {}, LMain;->writeTest()V

    .line 65
    invoke-static {}, LMain;->copyTest()V

    .line 66
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Done!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method public static report(JJ)V
    .registers 10
    .parameter
    .parameter

    .prologue
    .line 14
    sget-boolean v0, LMain;->timing:Z

    if-nez v0, :cond_5

    .line 20
    :goto_4
    return-void

    .line 18
    :cond_5
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Finished in "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sub-long v2, p2, p0

    long-to-double v2, v2

    const-wide v4, 0x412e848000000000L

    div-double/2addr v2, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " msec"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_4
.end method

.method static writeArray(I)V
    .registers 3
    .parameter

    .prologue
    .line 23
    const v0, 0x1ffff

    :goto_3
    if-ltz v0, :cond_c

    .line 24
    sget-object v1, LMain;->mStorage:[I

    aput p0, v1, v0

    .line 23
    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    .line 25
    :cond_c
    return-void
.end method

.method static writeTest()V
    .registers 5

    .prologue
    .line 30
    const/4 v0, 0x0

    invoke-static {v0}, LMain;->writeArray(I)V

    .line 32
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Running writeTest..."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 33
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    .line 34
    const/4 v0, 0x1

    :goto_10
    const/16 v3, 0x14

    if-ge v0, v3, :cond_1a

    .line 35
    invoke-static {v0}, LMain;->writeArray(I)V

    .line 34
    add-int/lit8 v0, v0, 0x1

    goto :goto_10

    .line 36
    :cond_1a
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    .line 38
    invoke-static {v1, v2, v3, v4}, LMain;->report(JJ)V

    .line 39
    return-void
.end method
