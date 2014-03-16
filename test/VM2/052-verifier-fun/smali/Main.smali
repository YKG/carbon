.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static arrayCheck1(I)[Ljava/lang/Object;
    .registers 3
    .parameter

    .prologue
    const/4 v1, 0x1

    .line 23
    new-array v0, v1, [Ljava/lang/String;

    .line 24
    new-array v1, v1, [Ljava/lang/Integer;

    .line 26
    packed-switch p0, :pswitch_data_c

    .line 29
    const/4 v0, 0x0

    :goto_9
    :pswitch_9
    return-object v0

    :pswitch_a
    move-object v0, v1

    .line 28
    goto :goto_9

    .line 26
    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method static arrayCheck1b(I)Ljava/lang/Object;
    .registers 4
    .parameter

    .prologue
    const/4 v2, 0x1

    .line 38
    new-array v0, v2, [Ljava/lang/String;

    .line 39
    new-array v1, v2, [Ljava/lang/Integer;

    .line 40
    new-array v2, v2, [I

    .line 42
    packed-switch p0, :pswitch_data_10

    .line 46
    const/4 v0, 0x0

    :goto_b
    :pswitch_b
    return-object v0

    :pswitch_c
    move-object v0, v1

    .line 44
    goto :goto_b

    :pswitch_e
    move-object v0, v2

    .line 45
    goto :goto_b

    .line 42
    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
        :pswitch_c
        :pswitch_e
    .end packed-switch
.end method

.method static arrayCheck2(I)[Ljava/lang/Object;
    .registers 4
    .parameter

    .prologue
    const/4 v2, 0x1

    .line 55
    new-array v0, v2, [[Ljava/lang/String;

    .line 56
    new-array v1, v2, [[Ljava/lang/String;

    .line 57
    new-array v2, v2, [[Ljava/lang/Integer;

    .line 59
    packed-switch p0, :pswitch_data_10

    .line 63
    const/4 v0, 0x0

    :goto_b
    :pswitch_b
    return-object v0

    :pswitch_c
    move-object v0, v1

    .line 61
    goto :goto_b

    :pswitch_e
    move-object v0, v2

    .line 62
    goto :goto_b

    .line 59
    :pswitch_data_10
    .packed-switch 0x0
        :pswitch_b
        :pswitch_c
        :pswitch_e
    .end packed-switch
.end method

.method static arrayCheck3(I)[Ljava/lang/Object;
    .registers 3
    .parameter

    .prologue
    const/4 v1, 0x1

    .line 71
    new-array v0, v1, [[Ljava/lang/String;

    .line 72
    new-array v1, v1, [[[[Ljava/lang/String;

    .line 74
    packed-switch p0, :pswitch_data_c

    .line 77
    const/4 v0, 0x0

    :goto_9
    :pswitch_9
    return-object v0

    :pswitch_a
    move-object v0, v1

    .line 76
    goto :goto_9

    .line 74
    :pswitch_data_c
    .packed-switch 0x0
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method public static main([Ljava/lang/String;)V
    .registers 3
    .parameter

    .prologue
    .line 10
    const/4 v0, 0x1

    invoke-static {v0}, LMain;->tryBlah(I)V

    .line 12
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Zorch."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 13
    return-void
.end method

.method static tryBlah(I)V
    .registers 2
    .parameter

    .prologue
    .line 96
    .line 98
    packed-switch p0, :pswitch_data_12

    .line 103
    new-instance v0, LBlahTwo;

    invoke-direct {v0}, LBlahTwo;-><init>()V

    .line 107
    :goto_8
    invoke-interface {v0}, LBlahFeature;->doStuff()V

    .line 108
    return-void

    .line 100
    :pswitch_c
    new-instance v0, LBlahOne;

    invoke-direct {v0}, LBlahOne;-><init>()V

    goto :goto_8

    .line 98
    :pswitch_data_12
    .packed-switch 0x1
        :pswitch_c
    .end packed-switch
.end method

.method private typeTest()[Ljava/lang/reflect/Type;
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 85
    if-nez p0, :cond_6

    .line 86
    check-cast v0, [Ljava/lang/Class;

    .line 88
    :goto_5
    return-object v0

    :cond_6
    check-cast v0, [Ljava/lang/reflect/Type;

    goto :goto_5
.end method
