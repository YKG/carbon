.class LClassAttrs$1InnerNamed;
.super Ljava/lang/Object;
.source "ClassAttrs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LClassAttrs;->main()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "InnerNamed"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public showMe()V
    .registers 2

    .prologue
    .line 31
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, LClassAttrs;->printClassAttrs(Ljava/lang/Class;)V

    .line 32
    return-void
.end method
