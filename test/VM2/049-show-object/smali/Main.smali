.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# instance fields
.field mLong:J


# direct methods
.method public constructor <init>()V
    .registers 6

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const-wide v0, 0x1122334455667788L

    iput-wide v0, p0, LMain;->mLong:J

    .line 10
    const-wide v0, 0x400921cac083126fL

    .line 11
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "d is "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 12
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 4
    .parameter

    .prologue
    .line 24
    .line 25
    new-instance v0, LMain;

    invoke-direct {v0}, LMain;-><init>()V

    .line 27
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/Object;

    .line 28
    invoke-static {v0}, LMain;->showObject([Ljava/lang/Object;)V

    .line 30
    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "hey"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "you"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "there"

    aput-object v2, v0, v1

    .line 32
    invoke-static {v0}, LMain;->showObject([Ljava/lang/Object;)V

    .line 33
    return-void
.end method

.method public static showObject([Ljava/lang/Object;)V
    .registers 5
    .parameter

    .prologue
    .line 15
    .line 16
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "class: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 18
    const/4 v0, 0x0

    :goto_1d
    array-length v1, p0

    if-ge v0, v1, :cond_41

    .line 19
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p0, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 18
    add-int/lit8 v0, v0, 0x1

    goto :goto_1d

    .line 21
    :cond_41
    return-void
.end method
