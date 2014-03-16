.class final LClassAttrs$1;
.super LOtherClass;
.source "ClassAttrs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LClassAttrs;->main()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field i:I


# direct methods
.method constructor <init>()V
    .registers 2

    .prologue
    .line 40
    invoke-direct {p0}, LOtherClass;-><init>()V

    const/4 v0, 0x5

    iput v0, p0, LClassAttrs$1;->i:I

    return-void
.end method
