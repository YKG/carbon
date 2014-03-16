.class public final enum Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;
.super Ljava/lang/Enum;
.source "AnnoFancyMethod.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/test/anno/AnnoFancyMethod;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AnnoFancyMethodEnum"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

.field public static final enum BAR:Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

.field public static final enum FOO:Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 9
    new-instance v0, Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

    const-string v1, "FOO"

    invoke-direct {v0, v1, v2}, Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;->FOO:Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

    new-instance v0, Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

    const-string v1, "BAR"

    invoke-direct {v0, v1, v3}, Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;-><init>(Ljava/lang/String;I)V

    sput-object v0, Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;->BAR:Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

    const/4 v0, 0x2

    new-array v0, v0, [Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

    sget-object v1, Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;->FOO:Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

    aput-object v1, v0, v2

    sget-object v1, Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;->BAR:Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

    aput-object v1, v0, v3

    sput-object v0, Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;->$VALUES:[Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 3
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;
    .registers 2
    .parameter

    .prologue
    .line 9
    const-class v0, Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

    return-object v0
.end method

.method public static values()[Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;
    .registers 1

    .prologue
    .line 9
    sget-object v0, Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;->$VALUES:[Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

    invoke-virtual {v0}, [Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;

    return-object v0
.end method
