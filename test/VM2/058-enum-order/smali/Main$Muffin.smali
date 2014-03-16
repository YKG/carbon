.class public final enum LMain$Muffin;
.super Ljava/lang/Enum;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Muffin"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "LMain$Muffin;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[LMain$Muffin;

.field public static final enum BLACKBERRY:LMain$Muffin;

.field public static final enum BLUEBERRY:LMain$Muffin;

.field public static final enum BRAN:LMain$Muffin;

.field public static final enum CORN:LMain$Muffin;

.field public static final enum CRANBERRY:LMain$Muffin;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 22
    new-instance v0, LMain$Muffin;

    const-string v1, "CORN"

    invoke-direct {v0, v1, v2}, LMain$Muffin;-><init>(Ljava/lang/String;I)V

    sput-object v0, LMain$Muffin;->CORN:LMain$Muffin;

    new-instance v0, LMain$Muffin;

    const-string v1, "BLUEBERRY"

    invoke-direct {v0, v1, v3}, LMain$Muffin;-><init>(Ljava/lang/String;I)V

    sput-object v0, LMain$Muffin;->BLUEBERRY:LMain$Muffin;

    new-instance v0, LMain$Muffin;

    const-string v1, "CRANBERRY"

    invoke-direct {v0, v1, v4}, LMain$Muffin;-><init>(Ljava/lang/String;I)V

    sput-object v0, LMain$Muffin;->CRANBERRY:LMain$Muffin;

    new-instance v0, LMain$Muffin;

    const-string v1, "BRAN"

    invoke-direct {v0, v1, v5}, LMain$Muffin;-><init>(Ljava/lang/String;I)V

    sput-object v0, LMain$Muffin;->BRAN:LMain$Muffin;

    new-instance v0, LMain$Muffin;

    const-string v1, "BLACKBERRY"

    invoke-direct {v0, v1, v6}, LMain$Muffin;-><init>(Ljava/lang/String;I)V

    sput-object v0, LMain$Muffin;->BLACKBERRY:LMain$Muffin;

    .line 21
    const/4 v0, 0x5

    new-array v0, v0, [LMain$Muffin;

    sget-object v1, LMain$Muffin;->CORN:LMain$Muffin;

    aput-object v1, v0, v2

    sget-object v1, LMain$Muffin;->BLUEBERRY:LMain$Muffin;

    aput-object v1, v0, v3

    sget-object v1, LMain$Muffin;->CRANBERRY:LMain$Muffin;

    aput-object v1, v0, v4

    sget-object v1, LMain$Muffin;->BRAN:LMain$Muffin;

    aput-object v1, v0, v5

    sget-object v1, LMain$Muffin;->BLACKBERRY:LMain$Muffin;

    aput-object v1, v0, v6

    sput-object v0, LMain$Muffin;->$VALUES:[LMain$Muffin;

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
    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)LMain$Muffin;
    .registers 2
    .parameter

    .prologue
    .line 21
    const-class v0, LMain$Muffin;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, LMain$Muffin;

    return-object v0
.end method

.method public static values()[LMain$Muffin;
    .registers 1

    .prologue
    .line 21
    sget-object v0, LMain$Muffin;->$VALUES:[LMain$Muffin;

    invoke-virtual {v0}, [LMain$Muffin;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [LMain$Muffin;

    return-object v0
.end method
