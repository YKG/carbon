.class public Landroid/test/anno/SubNoted;
.super Landroid/test/anno/SimplyNoted;
.source "SubNoted.java"

# interfaces
.implements Landroid/test/anno/INoted;


# annotations
.annotation runtime Landroid/test/anno/AnnoFancyType;
    num = 0x5
.end annotation

.annotation runtime Landroid/test/anno/AnnoSimpleType2;
.end annotation


# instance fields
.field mBar:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Landroid/test/anno/SimplyNoted;-><init>()V

    return-void
.end method


# virtual methods
.method public bar()I
    .registers 2

    .prologue
    .line 10
    const/4 v0, 0x0

    return v0
.end method
