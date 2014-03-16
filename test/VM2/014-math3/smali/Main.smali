.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 9
    .parameter

    .prologue
    .line 22
    const/4 v0, 0x2

    .line 25
    const/4 v1, 0x0

    .line 26
    const-wide/16 v2, 0x0

    .line 28
    const/16 v4, 0xa

    :try_start_6
    div-int/lit8 v4, v4, 0x0
    :try_end_8
    .catch Ljava/lang/ArithmeticException; {:try_start_6 .. :try_end_8} :catch_30

    .line 33
    :goto_8
    const-wide/16 v4, 0xa

    const-wide/16 v6, 0x0

    :try_start_c
    div-long/2addr v4, v6
    :try_end_d
    .catch Ljava/lang/ArithmeticException; {:try_start_c .. :try_end_d} :catch_33

    .line 42
    :goto_d
    const/high16 v4, 0x4120

    div-float v1, v4, v1

    .line 47
    const-wide/high16 v4, 0x4024

    div-double v1, v4, v2

    .line 52
    if-eqz v0, :cond_37

    .line 53
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "HEY: expected throws is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 56
    :goto_2f
    return-void

    .line 29
    :catch_30
    move-exception v0

    .line 30
    const/4 v0, 0x1

    goto :goto_8

    .line 34
    :catch_33
    move-exception v4

    .line 35
    add-int/lit8 v0, v0, -0x1

    goto :goto_d

    .line 55
    :cond_37
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "testMath3 success"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_2f
.end method
