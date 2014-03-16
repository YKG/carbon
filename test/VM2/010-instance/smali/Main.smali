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
    .registers 2
    .parameter

    .prologue
    .line 22
    const/4 v0, 0x0

    invoke-static {v0}, LInstanceTest;->main([Ljava/lang/String;)V

    .line 23
    return-void
.end method
