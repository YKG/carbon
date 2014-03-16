.class public Landroid/test/anno/FullyNoted;
.super Ljava/lang/Object;
.source "FullyNoted.java"


# annotations
.annotation runtime Landroid/test/anno/AnnoFancyType;
    name = "full"
    num = 0x5
.end annotation


# instance fields
.field mBar:I
    .annotation runtime Landroid/test/anno/AnnoFancyField;
        nombre = "fubar"
    .end annotation
.end field


# direct methods
.method constructor <init>(I)V
    .registers 2
    .parameter
        .annotation runtime Landroid/test/anno/AnnoFancyParameter;
            factor = 0.5
        .end annotation
    .end parameter
    .annotation runtime Landroid/test/anno/AnnoFancyConstructor;
        numArgs = 0x1
    .end annotation

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput p1, p0, Landroid/test/anno/FullyNoted;->mBar:I

    .line 16
    return-void
.end method


# virtual methods
.method public bar(IJ)I
    .registers 5
    .parameter
        .annotation runtime Landroid/test/anno/AnnoSimpleParameter;
        .end annotation
    .end parameter
    .parameter
        .annotation runtime Landroid/test/anno/AnnoFancyParameter;
            factor = 3.7879912899761
        .end annotation
    .end parameter
    .annotation runtime Landroid/test/anno/AnnoFancyMethod;
        biteMe = false
        callMe = true
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/io/EOFException;
        }
    .end annotation

    .prologue
    .line 24
    const/4 v0, 0x0

    return v0
.end method

.method public bar1(IJ)I
    .registers 5
    .parameter
        .annotation runtime Landroid/test/anno/AnnoSimpleParameter;
        .end annotation
    .end parameter
    .parameter
        .annotation runtime Landroid/test/anno/AnnoFancyParameter;
            factor = 3.7879912899761
        .end annotation
    .end parameter
    .annotation runtime Landroid/test/anno/AnnoFancyMethod;
        biteMe = true
        enumerated = .enum Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;->BAR:Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 33
    const/4 v0, 0x0

    return v0
.end method

.method public notAnnotated()I
    .registers 2

    .prologue
    .line 37
    const/4 v0, 0x0

    return v0
.end method
