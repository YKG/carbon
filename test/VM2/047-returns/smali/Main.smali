.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 5
    .parameter

    .prologue
    const/4 v3, 0x2

    const/4 v2, 0x1

    .line 9
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "pick 1"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 10
    invoke-static {v2}, LMain;->pickOne(I)Ljava/lang/Runnable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 11
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v2}, LMain;->pickOne(I)Ljava/lang/Runnable;

    move-result-object v0

    check-cast v0, LCommonInterface;

    invoke-interface {v0}, LCommonInterface;->doStuff()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(I)V

    .line 13
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "pick 2"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 14
    invoke-static {v3}, LMain;->pickOne(I)Ljava/lang/Runnable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 15
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-static {v3}, LMain;->pickOne(I)Ljava/lang/Runnable;

    move-result-object v0

    check-cast v0, LCommonInterface;

    invoke-interface {v0}, LCommonInterface;->doStuff()I

    move-result v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(I)V

    .line 17
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "pick 3"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 18
    const/4 v0, 0x3

    invoke-static {v0}, LMain;->pickOne(I)Ljava/lang/Runnable;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 19
    return-void
.end method

.method public static pickOne(I)Ljava/lang/Runnable;
    .registers 2
    .parameter

    .prologue
    .line 24
    const/4 v0, 0x1

    if-ne p0, v0, :cond_9

    .line 25
    new-instance v0, LClassOne;

    invoke-direct {v0}, LClassOne;-><init>()V

    .line 33
    :goto_8
    return-object v0

    .line 26
    :cond_9
    const/4 v0, 0x2

    if-ne p0, v0, :cond_12

    .line 27
    new-instance v0, LClassTwo;

    invoke-direct {v0}, LClassTwo;-><init>()V

    goto :goto_8

    .line 28
    :cond_12
    const/4 v0, 0x3

    if-ne p0, v0, :cond_1b

    .line 29
    new-instance v0, LClassThree;

    invoke-direct {v0}, LClassThree;-><init>()V

    goto :goto_8

    .line 31
    :cond_1b
    const/4 v0, 0x0

    goto :goto_8
.end method
