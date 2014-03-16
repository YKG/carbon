.class LSuperTarget;
.super Ljava/lang/Object;
.source "Main.java"


# static fields
.field public static superClassInt:I


# instance fields
.field public superInt:I


# direct methods
.method public constructor <init>()V
    .registers 3

    .prologue
    .line 345
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 346
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "SuperTarget constructor ()V"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 347
    const v0, 0xf69b5

    iput v0, p0, LSuperTarget;->superInt:I

    .line 348
    const v0, 0xf69b6

    sput v0, LSuperTarget;->superClassInt:I

    .line 349
    return-void
.end method


# virtual methods
.method public myMethod(F)I
    .registers 5
    .parameter

    .prologue
    .line 352
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "myMethod (F)I "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 353
    const/4 v0, 0x6

    return v0
.end method
