.class public LUnresStuff;
.super Ljava/lang/Object;
.source "UnresStuff.java"


# static fields
.field public static staticField:I

.field public static wideStaticField:D


# instance fields
.field public instField:I

.field public wideInstField:D


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static staticMethod()V
    .registers 2

    .prologue
    .line 20
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "unres!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 21
    return-void
.end method


# virtual methods
.method public virtualMethod()V
    .registers 3

    .prologue
    .line 16
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "unres!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 17
    return-void
.end method
