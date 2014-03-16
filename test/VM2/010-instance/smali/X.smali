.class LX;
.super Ljava/lang/Object;
.source "X.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    return-void
.end method


# virtual methods
.method foo()I
    .registers 2

    .prologue
    .line 6
    const/4 v0, 0x0

    return v0
.end method
