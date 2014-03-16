.class public abstract LMirandaAbstract;
.super Ljava/lang/Object;
.source "MirandaAbstract.java"

# interfaces
.implements LMirandaInterface;
.implements LMirandaInterface2;


# direct methods
.method protected constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public inAbstract()Z
    .registers 2

    .prologue
    .line 14
    const/4 v0, 0x1

    return v0
.end method
