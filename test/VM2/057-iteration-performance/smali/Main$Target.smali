.class public LMain$Target;
.super Ljava/lang/Object;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Target"
.end annotation


# instance fields
.field public size:I

.field public value:I


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 463
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 465
    const/16 v0, 0x64

    iput v0, p0, LMain$Target;->size:I

    return-void
.end method


# virtual methods
.method public simple()V
    .registers 1

    .prologue
    .line 469
    return-void
.end method

.method public size()I
    .registers 2

    .prologue
    .line 472
    iget v0, p0, LMain$Target;->size:I

    return v0
.end method
