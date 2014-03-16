.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 7
    .parameter

    .prologue
    const/16 v0, 0x8

    const/4 v1, 0x0

    .line 22
    new-array v2, v0, [Ljava/lang/String;

    .line 23
    new-array v3, v0, [Ljava/lang/Object;

    move v0, v1

    .line 25
    :goto_8
    array-length v4, v2

    if-ge v0, v4, :cond_19

    .line 26
    new-instance v4, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    aput-object v4, v2, v0

    .line 25
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 28
    :cond_19
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "string -> object"

    invoke-virtual {v0, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 29
    array-length v0, v2

    invoke-static {v2, v1, v3, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 30
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "object -> string"

    invoke-virtual {v0, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 31
    array-length v0, v2

    invoke-static {v3, v1, v2, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 32
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "object -> string (modified)"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 33
    const/4 v0, 0x4

    new-instance v1, LImplA;

    invoke-direct {v1}, LImplA;-><init>()V

    aput-object v1, v3, v0

    .line 35
    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_40
    array-length v4, v2

    invoke-static {v3, v0, v2, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_44
    .catch Ljava/lang/ArrayStoreException; {:try_start_40 .. :try_end_44} :catch_45

    .line 40
    :goto_44
    return-void

    .line 37
    :catch_45
    move-exception v0

    .line 38
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "caught ArrayStoreException (expected)"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_44
.end method
