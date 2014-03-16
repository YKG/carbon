.class LIntSource;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getMagicInt()I
    .registers 2

    .prologue
    .line 23
    const/16 v0, 0x40

    return v0
.end method
