.class LPrivvy;
.super Ljava/lang/Object;
.source "Privvy.java"

# interfaces
.implements Ljava/security/PrivilegedAction;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/security/PrivilegedAction",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field private mValue:Ljava/lang/Integer;


# direct methods
.method public constructor <init>(I)V
    .registers 4
    .parameter

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/lang/Integer;

    add-int/lit8 v1, p1, 0x1

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, LPrivvy;->mValue:Ljava/lang/Integer;

    .line 13
    return-void
.end method


# virtual methods
.method public run()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 16
    iget-object v0, p0, LPrivvy;->mValue:Ljava/lang/Integer;

    return-object v0
.end method

.method public bridge synthetic run()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 7
    invoke-virtual {p0}, LPrivvy;->run()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method
