.class public final enum LMain$Shubbery;
.super Ljava/lang/Enum;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Shubbery"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "LMain$Shubbery;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[LMain$Shubbery;

.field public static final enum CRAWLING:LMain$Shubbery;

.field public static final enum GROUND:LMain$Shubbery;

.field public static final enum HANGING:LMain$Shubbery;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 9
    new-instance v0, LMain$Shubbery;

    const-string v1, "GROUND"

    invoke-direct {v0, v1, v2}, LMain$Shubbery;-><init>(Ljava/lang/String;I)V

    sput-object v0, LMain$Shubbery;->GROUND:LMain$Shubbery;

    new-instance v0, LMain$Shubbery;

    const-string v1, "CRAWLING"

    invoke-direct {v0, v1, v3}, LMain$Shubbery;-><init>(Ljava/lang/String;I)V

    sput-object v0, LMain$Shubbery;->CRAWLING:LMain$Shubbery;

    new-instance v0, LMain$Shubbery;

    const-string v1, "HANGING"

    invoke-direct {v0, v1, v4}, LMain$Shubbery;-><init>(Ljava/lang/String;I)V

    sput-object v0, LMain$Shubbery;->HANGING:LMain$Shubbery;

    const/4 v0, 0x3

    new-array v0, v0, [LMain$Shubbery;

    sget-object v1, LMain$Shubbery;->GROUND:LMain$Shubbery;

    aput-object v1, v0, v2

    sget-object v1, LMain$Shubbery;->CRAWLING:LMain$Shubbery;

    aput-object v1, v0, v3

    sget-object v1, LMain$Shubbery;->HANGING:LMain$Shubbery;

    aput-object v1, v0, v4

    sput-object v0, LMain$Shubbery;->$VALUES:[LMain$Shubbery;

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
    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)LMain$Shubbery;
    .registers 2
    .parameter

    .prologue
    .line 9
    const-class v0, LMain$Shubbery;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, LMain$Shubbery;

    return-object v0
.end method

.method public static values()[LMain$Shubbery;
    .registers 1

    .prologue
    .line 9
    sget-object v0, LMain$Shubbery;->$VALUES:[LMain$Shubbery;

    invoke-virtual {v0}, [LMain$Shubbery;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [LMain$Shubbery;

    return-object v0
.end method
