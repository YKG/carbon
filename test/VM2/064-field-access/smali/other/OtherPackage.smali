.class public Lother/OtherPackage;
.super Ljava/lang/Object;
.source "OtherPackage.java"


# instance fields
.field pkgDoubleField:D

.field protected protObjectField:Ljava/lang/Object;

.field protected protShortField:S

.field public pubCharField:C


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    const v0, 0x8765

    iput-char v0, p0, Lother/OtherPackage;->pubCharField:C

    .line 11
    const/16 v0, 0x1234

    iput-short v0, p0, Lother/OtherPackage;->protShortField:S

    .line 12
    const-string v0, "blah"

    iput-object v0, p0, Lother/OtherPackage;->protObjectField:Ljava/lang/Object;

    .line 14
    const-wide v0, 0x400921fb54524550L

    iput-wide v0, p0, Lother/OtherPackage;->pkgDoubleField:D

    return-void
.end method
