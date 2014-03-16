.class LDoubledImplement;
.super Ljava/lang/Object;
.source "DoubledImplement.java"

# interfaces
.implements LICommon;


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Ctor: doubled implement, type 1"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 9
    return-void
.end method


# virtual methods
.method public getDoubledInstance()LDoubledImplement;
    .registers 2

    .prologue
    .line 12
    new-instance v0, LDoubledImplement;

    invoke-direct {v0}, LDoubledImplement;-><init>()V

    return-object v0
.end method

.method public one()V
    .registers 3

    .prologue
    .line 16
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "DoubledImplement one"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 17
    return-void
.end method
