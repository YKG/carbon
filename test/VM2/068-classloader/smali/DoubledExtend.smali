.class public LDoubledExtend;
.super LBase;
.source "DoubledExtend.java"


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 7
    invoke-direct {p0}, LBase;-><init>()V

    .line 8
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Ctor: doubled extend, type 1"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 9
    return-void
.end method


# virtual methods
.method public getExtended()LDoubledExtend;
    .registers 3

    .prologue
    .line 13
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "getExtended 1"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 14
    new-instance v0, LDoubledExtend;

    invoke-direct {v0}, LDoubledExtend;-><init>()V

    return-object v0
.end method

.method public getStr()Ljava/lang/String;
    .registers 2

    .prologue
    .line 18
    const-string v0, "DoubledExtend 1"

    return-object v0
.end method
