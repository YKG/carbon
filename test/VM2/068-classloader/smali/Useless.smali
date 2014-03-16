.class public LUseless;
.super Ljava/lang/Object;
.source "Useless.java"

# interfaces
.implements LICommon;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getDoubledInstance()LDoubledImplement;
    .registers 2

    .prologue
    .line 3
    const/4 v0, 0x0

    return-object v0
.end method
