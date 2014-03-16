.class final LMain$1;
.super Ljava/lang/Thread;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LMain;->makeRef()Ljava/lang/ref/WeakReference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$wimp:[Ljava/lang/ref/WeakReference;


# direct methods
.method constructor <init>([Ljava/lang/ref/WeakReference;)V
    .registers 2
    .parameter

    .prologue
    .line 28
    iput-object p1, p0, LMain$1;->val$wimp:[Ljava/lang/ref/WeakReference;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .prologue
    .line 30
    new-instance v0, LFinalizerTest;

    const-string v1, "wahoo"

    invoke-direct {v0, v1}, LFinalizerTest;-><init>(Ljava/lang/String;)V

    .line 31
    iget-object v1, p0, LMain$1;->val$wimp:[Ljava/lang/ref/WeakReference;

    const/4 v2, 0x0

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    aput-object v3, v1, v2

    .line 33
    return-void
.end method
