.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static arrayCluster([LIMagic;)V
    .registers 6
    .parameter

    .prologue
    .line 5
    const/4 v0, 0x0

    :goto_1
    array-length v1, p0

    if-ge v0, v1, :cond_2f

    .line 6
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p0, v0

    invoke-interface {v3}, LIMagic;->getSomeData()D

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 5
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 7
    :cond_2f
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5
    .parameter

    .prologue
    .line 10
    new-instance v0, LMagicClass;

    invoke-direct {v0}, LMagicClass;-><init>()V

    .line 12
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "magic is "

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 13
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0}, LMagicClass;->getSomeData()D

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/io/PrintStream;->println(D)V

    .line 15
    const/4 v0, 0x2

    new-array v0, v0, [LMagicClass;

    .line 16
    const/4 v1, 0x0

    new-instance v2, LMagicClass;

    invoke-direct {v2}, LMagicClass;-><init>()V

    aput-object v2, v0, v1

    .line 17
    const/4 v1, 0x1

    new-instance v2, LMagicClass;

    invoke-direct {v2}, LMagicClass;-><init>()V

    aput-object v2, v0, v1

    .line 18
    invoke-static {v0}, LMain;->arrayCluster([LIMagic;)V

    .line 19
    return-void
.end method
