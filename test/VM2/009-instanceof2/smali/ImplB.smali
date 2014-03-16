.class public LImplB;
.super Ljava/lang/Object;
.source "ImplB.java"

# interfaces
.implements LIface1;
.implements LIface2;


# static fields
.field public static mWhoami:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 15
    new-instance v0, Ljava/lang/String;

    const-string v1, "ImplB!"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v0, LImplB;->mWhoami:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public iFunc1(I)I
    .registers 3
    .parameter

    .prologue
    .line 9
    add-int/lit8 v0, p1, 0xa

    return v0
.end method

.method public iFunc2(I)I
    .registers 3
    .parameter

    .prologue
    .line 12
    add-int/lit8 v0, p1, 0x14

    return v0
.end method
