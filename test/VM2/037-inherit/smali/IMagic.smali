.class interface abstract LIMagic;
.super Ljava/lang/Object;
.source "Main.java"


# static fields
.field public static final MAGIC_INT:I

.field public static final mIntSource:LIntSource;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 29
    new-instance v0, LIntSource;

    invoke-direct {v0}, LIntSource;-><init>()V

    sput-object v0, LIMagic;->mIntSource:LIntSource;

    .line 30
    sget-object v0, LIMagic;->mIntSource:LIntSource;

    invoke-virtual {v0}, LIntSource;->getMagicInt()I

    move-result v0

    sput v0, LIMagic;->MAGIC_INT:I

    return-void
.end method


# virtual methods
.method public abstract getSomeData()D
.end method
