.class LMain$Helper;
.super Ljava/lang/Thread;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Helper"
.end annotation


# instance fields
.field private which:I


# direct methods
.method public constructor <init>(I)V
    .registers 2
    .parameter

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 56
    iput p1, p0, LMain$Helper;->which:I

    .line 57
    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    .prologue
    .line 60
    iget v0, p0, LMain$Helper;->which:I

    invoke-static {v0}, LMain;->catchTheUncaught(I)V

    .line 61
    return-void
.end method
