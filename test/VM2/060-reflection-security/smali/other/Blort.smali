.class public Lother/Blort;
.super Ljava/lang/Object;
.source "Blort.java"


# instance fields
.field packageField:I

.field private privateField:I

.field protected protectedField:I

.field public publicField:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private privateMethod()V
    .registers 1

    .prologue
    .line 11
    return-void
.end method


# virtual methods
.method packageMethod()V
    .registers 1

    .prologue
    .line 15
    return-void
.end method

.method protected protectedMethod()V
    .registers 1

    .prologue
    .line 19
    return-void
.end method

.method public publicMethod()V
    .registers 1

    .prologue
    .line 23
    return-void
.end method
