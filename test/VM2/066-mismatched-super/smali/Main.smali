.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 2
    .parameter

    .prologue
    .line 8
    new-instance v0, LBase;

    invoke-direct {v0}, LBase;-><init>()V

    .line 9
    return-void
.end method
