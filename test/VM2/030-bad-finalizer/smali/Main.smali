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
    const/4 v1, 0x0

    .line 8
    new-instance v0, LBadFinalizer;

    invoke-direct {v0}, LBadFinalizer;-><init>()V

    .line 10
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Constructed object."

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 13
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Nulled. Requestion gc."

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 14
    invoke-static {}, Ljava/lang/System;->gc()V

    move v0, v1

    .line 16
    :goto_18
    const/16 v2, 0x8

    if-ge v0, v2, :cond_2e

    .line 17
    const/16 v2, 0x1388

    invoke-static {v2}, LBadFinalizer;->snooze(I)V

    .line 18
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Requesting another GC."

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 19
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 16
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    .line 22
    :cond_2e
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Done waiting."

    invoke-virtual {v0, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 23
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    .line 24
    return-void
.end method
