.class public LSemiPrivate;
.super Ljava/lang/Object;
.source "SemiPrivate.java"


# static fields
.field static mPrivvy:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 7
    const-string v0, "stuff"

    sput-object v0, LSemiPrivate;->mPrivvy:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
