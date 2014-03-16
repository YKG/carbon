.class public abstract LBlah;
.super Ljava/lang/Object;
.source "Blah.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public unrelatedStuff()V
    .registers 1

    .prologue
    .line 3
    return-void
.end method
