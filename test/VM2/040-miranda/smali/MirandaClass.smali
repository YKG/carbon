.class public LMirandaClass;
.super LMirandaAbstract;
.source "MirandaClass.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 8
    invoke-direct {p0}, LMirandaAbstract;-><init>()V

    return-void
.end method


# virtual methods
.method public inAbstract()Z
    .registers 2

    .prologue
    .line 22
    const/4 v0, 0x0

    return v0
.end method

.method public inInterface()Z
    .registers 2

    .prologue
    .line 12
    const/4 v0, 0x1

    return v0
.end method

.method public inInterface2()I
    .registers 2

    .prologue
    .line 17
    const/16 v0, 0x1b

    return v0
.end method
