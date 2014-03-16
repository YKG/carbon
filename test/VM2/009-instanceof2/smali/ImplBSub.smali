.class public LImplBSub;
.super LImplB;
.source "ImplBSub.java"

# interfaces
.implements LIface2Sub1;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, LImplB;-><init>()V

    return-void
.end method


# virtual methods
.method public iFunc1(I)I
    .registers 3
    .parameter

    .prologue
    .line 9
    add-int/lit8 v0, p1, 0x64

    return v0
.end method

.method public iFunc2(I)I
    .registers 3
    .parameter

    .prologue
    .line 12
    add-int/lit16 v0, p1, 0xc8

    return v0
.end method
