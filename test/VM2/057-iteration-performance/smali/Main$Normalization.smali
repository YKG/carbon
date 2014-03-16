.class final enum LMain$Normalization;
.super Ljava/lang/Enum;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "Normalization"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "LMain$Normalization;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[LMain$Normalization;

.field public static final enum NONE:LMain$Normalization;

.field public static final enum PER_COLUMN:LMain$Normalization;

.field public static final enum TOP_LEFT:LMain$Normalization;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 78
    new-instance v0, LMain$Normalization;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, LMain$Normalization;-><init>(Ljava/lang/String;I)V

    sput-object v0, LMain$Normalization;->NONE:LMain$Normalization;

    new-instance v0, LMain$Normalization;

    const-string v1, "PER_COLUMN"

    invoke-direct {v0, v1, v3}, LMain$Normalization;-><init>(Ljava/lang/String;I)V

    sput-object v0, LMain$Normalization;->PER_COLUMN:LMain$Normalization;

    new-instance v0, LMain$Normalization;

    const-string v1, "TOP_LEFT"

    invoke-direct {v0, v1, v4}, LMain$Normalization;-><init>(Ljava/lang/String;I)V

    sput-object v0, LMain$Normalization;->TOP_LEFT:LMain$Normalization;

    .line 77
    const/4 v0, 0x3

    new-array v0, v0, [LMain$Normalization;

    sget-object v1, LMain$Normalization;->NONE:LMain$Normalization;

    aput-object v1, v0, v2

    sget-object v1, LMain$Normalization;->PER_COLUMN:LMain$Normalization;

    aput-object v1, v0, v3

    sget-object v1, LMain$Normalization;->TOP_LEFT:LMain$Normalization;

    aput-object v1, v0, v4

    sput-object v0, LMain$Normalization;->$VALUES:[LMain$Normalization;

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
    .line 77
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)LMain$Normalization;
    .registers 2
    .parameter

    .prologue
    .line 77
    const-class v0, LMain$Normalization;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, LMain$Normalization;

    return-object v0
.end method

.method public static values()[LMain$Normalization;
    .registers 1

    .prologue
    .line 77
    sget-object v0, LMain$Normalization;->$VALUES:[LMain$Normalization;

    invoke-virtual {v0}, [LMain$Normalization;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [LMain$Normalization;

    return-object v0
.end method
