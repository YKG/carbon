.class public Landroid/test/anno/SimplyNoted;
.super Ljava/lang/Object;
.source "SimplyNoted.java"


# annotations
.annotation runtime Landroid/test/anno/AnnoSimpleType2;
.end annotation

.annotation runtime Landroid/test/anno/AnnoSimpleType;
.end annotation

.annotation build Landroid/test/anno/AnnoSimpleTypeInvis;
.end annotation


# static fields
.field public static mOneFoo:I
    .annotation runtime Landroid/test/anno/AnnoSimpleField;
    .end annotation
.end field


# instance fields
.field public mFoo:I
    .annotation runtime Landroid/test/anno/AnnoSimpleField;
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .registers 2
    .annotation runtime Landroid/test/anno/AnnoSimpleConstructor;
    .end annotation

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const/4 v0, 0x0

    iput v0, p0, Landroid/test/anno/SimplyNoted;->mFoo:I

    .line 16
    return-void
.end method

.method constructor <init>(I)V
    .registers 2
    .parameter
        .annotation runtime Landroid/test/anno/AnnoSimpleParameter;
        .end annotation
    .end parameter
    .annotation runtime Landroid/test/anno/AnnoSimpleConstructor;
    .end annotation

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput p1, p0, Landroid/test/anno/SimplyNoted;->mFoo:I

    .line 21
    return-void
.end method


# virtual methods
.method public foo()I
    .registers 2
    .annotation runtime Landroid/test/anno/AnnoSimpleMethod;
    .end annotation

    .prologue
    .line 26
    const/4 v0, 0x5

    .line 28
    return v0
.end method
