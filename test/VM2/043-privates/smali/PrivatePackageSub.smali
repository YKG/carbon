.class LPrivatePackageSub;
.super LPrivatePackage;
.source "Main.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 37
    invoke-direct {p0}, LPrivatePackage;-><init>()V

    return-void
.end method

.method private privGetStr()Ljava/lang/String;
    .registers 2

    .prologue
    .line 43
    const-string v0, "PrivatePackageSub!"

    return-object v0
.end method


# virtual methods
.method public getStrSub()Ljava/lang/String;
    .registers 2

    .prologue
    .line 39
    invoke-direct {p0}, LPrivatePackageSub;->privGetStr()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
