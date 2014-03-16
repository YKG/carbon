.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 1
    .parameter

    .prologue
    .line 5
    invoke-static {p0}, Landroid/test/anno/TestAnnotations;->main([Ljava/lang/String;)V

    .line 6
    return-void
.end method
