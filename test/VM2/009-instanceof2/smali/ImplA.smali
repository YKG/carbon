.class public LImplA;
.super Ljava/lang/Object;
.source "ImplA.java"

# interfaces
.implements LIface1;
.implements LIface2;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public iFunc1(I)I
    .registers 3
    .parameter

    .prologue
    .line 9
    add-int/lit8 v0, p1, 0x1

    return v0
.end method

.method public iFunc2(I)I
    .registers 3
    .parameter

    .prologue
    .line 12
    add-int/lit8 v0, p1, 0x2

    return v0
.end method
