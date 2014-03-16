.class final LMain$2;
.super Ljava/lang/Thread;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LMain;->wimpString(Ljava/lang/ref/WeakReference;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$s:[Ljava/lang/String;

.field final synthetic val$wimp:Ljava/lang/ref/WeakReference;


# direct methods
.method constructor <init>(Ljava/lang/ref/WeakReference;[Ljava/lang/String;)V
    .registers 3
    .parameter
    .parameter

    .prologue
    .line 55
    iput-object p1, p0, LMain$2;->val$wimp:Ljava/lang/ref/WeakReference;

    iput-object p2, p0, LMain$2;->val$s:[Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 4

    .prologue
    .line 57
    iget-object v0, p0, LMain$2;->val$wimp:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    .line 58
    if-eqz v0, :cond_11

    .line 59
    iget-object v1, p0, LMain$2;->val$s:[Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v2

    .line 61
    :cond_11
    return-void
.end method
