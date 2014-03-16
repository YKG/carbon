.class LClassAttrs$MemberClass;
.super Ljava/lang/Object;
.source "ClassAttrs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LClassAttrs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "MemberClass"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<XYZ:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public mWha:LClassAttrs$MemberClass;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LClassAttrs$MemberClass",
            "<TXYZ;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(LClassAttrs$MemberClass;)V
    .registers 2
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LClassAttrs$MemberClass",
            "<TXYZ;>;)V"
        }
    .end annotation

    .prologue
    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 104
    iput-object p1, p0, LClassAttrs$MemberClass;->mWha:LClassAttrs$MemberClass;

    .line 105
    return-void
.end method


# virtual methods
.method public foo()Ljava/lang/Class;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/lang/Class",
            "<TXYZ;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;
        }
    .end annotation

    .prologue
    .line 108
    const/4 v0, 0x0

    return-object v0
.end method
