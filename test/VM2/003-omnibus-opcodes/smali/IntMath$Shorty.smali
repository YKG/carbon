.class LIntMath$Shorty;
.super Ljava/lang/Object;
.source "IntMath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LIntMath;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Shorty"
.end annotation


# instance fields
.field public mByte:B

.field public mChar:C

.field public mShort:S


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 321
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
