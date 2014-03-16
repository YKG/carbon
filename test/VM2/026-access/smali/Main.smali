.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 3
    .parameter

    .prologue
    .line 7
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "access test"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 9
    new-instance v0, Lotherpackage/PublicAccess;

    invoke-direct {v0}, Lotherpackage/PublicAccess;-><init>()V

    .line 10
    invoke-static {}, Lotherpackage/PublicAccess;->main()V

    .line 11
    return-void
.end method
