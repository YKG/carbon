.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LMain$Blort;,
        LMain$Special;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 2
    .parameter

    .prologue
    .line 5
    new-instance v0, LMain$Special;

    invoke-direct {v0}, LMain$Special;-><init>()V

    .line 6
    invoke-virtual {v0}, LMain$Special;->callInner()V

    .line 7
    return-void
.end method
