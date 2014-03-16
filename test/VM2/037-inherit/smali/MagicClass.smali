.class LMagicClass;
.super Ljava/lang/Object;
.source "Main.java"

# interfaces
.implements LIMagic;


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getSomeData()D
    .registers 3

    .prologue
    .line 35
    sget v0, LMagicClass;->MAGIC_INT:I

    int-to-double v0, v0

    return-wide v0
.end method
