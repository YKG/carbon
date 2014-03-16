.class public interface abstract LIface1;
.super Ljava/lang/Object;
.source "Iface1.java"


# static fields
.field public static final mFloaty:F = 5.0f

.field public static final mWahoo:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 12
    new-instance v0, Ljava/lang/String;

    const-string v1, "wahoo"

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    sput-object v0, LIface1;->mWahoo:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public abstract iFunc1(I)I
.end method
