.class public LBlahTwo;
.super LBlah;
.source "BlahTwo.java"

# interfaces
.implements LBlahFeature;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 1
    invoke-direct {p0}, LBlah;-><init>()V

    return-void
.end method


# virtual methods
.method public doStuff()V
    .registers 3

    .prologue
    .line 3
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "BlahTwo"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 4
    return-void
.end method
