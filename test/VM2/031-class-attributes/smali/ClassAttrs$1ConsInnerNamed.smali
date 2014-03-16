.class LClassAttrs$1ConsInnerNamed;
.super Ljava/lang/Object;
.source "ClassAttrs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LClassAttrs;-><init>()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ConsInnerNamed"
.end annotation


# instance fields
.field final synthetic this$0:LClassAttrs;


# direct methods
.method constructor <init>(LClassAttrs;)V
    .registers 2
    .parameter

    .prologue
    .line 13
    iput-object p1, p0, LClassAttrs$1ConsInnerNamed;->this$0:LClassAttrs;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public showMe()V
    .registers 2

    .prologue
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, LClassAttrs;->printClassAttrs(Ljava/lang/Class;)V

    .line 16
    return-void
.end method
