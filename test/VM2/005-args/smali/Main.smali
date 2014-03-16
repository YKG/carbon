.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 9
    .parameter

    .prologue
    .line 22
    new-instance v0, LArgsTest;

    invoke-direct {v0}, LArgsTest;-><init>()V

    const/16 v1, 0x7b

    const/16 v2, 0x71

    const-wide v3, 0x400abf5a5332acfbL

    const-wide v5, 0x1122334455667788L

    const v7, 0x3dfcd35b

    invoke-virtual/range {v0 .. v7}, LArgsTest;->argTest(ICDJF)V

    .line 24
    return-void
.end method
