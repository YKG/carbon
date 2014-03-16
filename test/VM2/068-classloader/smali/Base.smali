.class public LBase;
.super Ljava/lang/Object;
.source "Base.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static doStuff(LDoubledExtend;)Ljava/lang/String;
    .registers 2
    .parameter

    .prologue
    .line 14
    invoke-virtual {p0}, LDoubledExtend;->getStr()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getExtended()LDoubledExtend;
    .registers 2

    .prologue
    .line 10
    new-instance v0, LDoubledExtend;

    invoke-direct {v0}, LDoubledExtend;-><init>()V

    return-object v0
.end method
