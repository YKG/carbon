.class LMoreClasses;
.super LClasses;
.source "Classes.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field mMore:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 207
    const-class v0, LMoreClasses;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LMoreClasses;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 210
    invoke-direct {p0}, LClasses;-><init>()V

    return-void
.end method


# virtual methods
.method public subFunc(Z)V
    .registers 3
    .parameter

    .prologue
    .line 213
    sget-boolean v0, LMoreClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_c

    if-nez p1, :cond_c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 214
    :cond_c
    return-void
.end method

.method public superFunc(Z)V
    .registers 2
    .parameter

    .prologue
    .line 217
    invoke-super {p0, p1}, LClasses;->subFunc(Z)V

    .line 218
    return-void
.end method
