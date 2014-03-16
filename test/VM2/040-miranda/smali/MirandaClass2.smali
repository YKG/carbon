.class LMirandaClass2;
.super LMirandaAbstract;
.source "MirandaClass2.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 1
    invoke-direct {p0}, LMirandaAbstract;-><init>()V

    return-void
.end method


# virtual methods
.method public inInterface()Z
    .registers 2

    .prologue
    .line 3
    const/4 v0, 0x1

    return v0
.end method

.method public inInterface2()I
    .registers 2

    .prologue
    .line 7
    const/16 v0, 0x1c

    return v0
.end method
