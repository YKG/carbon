.class LMethodCallBase;
.super Ljava/lang/Object;
.source "MethodCall.java"


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "  MethodCallBase ctor"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 77
    return-void
.end method


# virtual methods
.method tryThing()I
    .registers 2

    .prologue
    .line 80
    const/4 v0, 0x7

    return v0
.end method
