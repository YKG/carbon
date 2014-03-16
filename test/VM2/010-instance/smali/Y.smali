.class LY;
.super LX;
.source "Y.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 2
    invoke-direct {p0}, LX;-><init>()V

    .line 3
    return-void
.end method


# virtual methods
.method bar()I
    .registers 2

    .prologue
    .line 6
    const/4 v0, 0x1

    return v0
.end method
