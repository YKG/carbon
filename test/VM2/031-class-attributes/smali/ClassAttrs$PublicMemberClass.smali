.class public LClassAttrs$PublicMemberClass;
.super Ljava/lang/Object;
.source "ClassAttrs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LClassAttrs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PublicMemberClass"
.end annotation


# instance fields
.field mBlah:F


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
