.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LMain$1;,
        LMain$ParkTester;
    }
.end annotation


# static fields
.field private static UNSAFE:Lsun/misc/Unsafe;


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    return-void
.end method

.method static synthetic access$100()Lsun/misc/Unsafe;
    .registers 1

    .prologue
    .line 5
    sget-object v0, LMain;->UNSAFE:Lsun/misc/Unsafe;

    return-object v0
.end method

.method private static clearStack(I)V
    .registers 2
    .parameter

    .prologue
    .line 65
    .line 76
    if-lez p0, :cond_7

    .line 77
    add-int/lit8 v0, p0, -0x1

    invoke-static {v0}, LMain;->clearStack(I)V

    .line 79
    :cond_7
    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 4
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 9
    invoke-static {}, LMain;->setUp()V

    .line 11
    new-instance v0, LMain$ParkTester;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, LMain$ParkTester;-><init>(LMain$1;)V

    .line 13
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Test starting"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 15
    invoke-virtual {v0}, LMain$ParkTester;->start()V

    .line 16
    sget-object v1, LMain;->UNSAFE:Lsun/misc/Unsafe;

    invoke-virtual {v1, v0}, Lsun/misc/Unsafe;->unpark(Ljava/lang/Object;)V

    .line 17
    const/16 v1, 0xa

    invoke-static {v1}, LMain;->clearStack(I)V

    .line 19
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "GC\'ing"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 20
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 21
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 23
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "Asking thread to park"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 24
    const/4 v1, 0x1

    iput-boolean v1, v0, LMain$ParkTester;->parkNow:Z

    .line 27
    const-wide/16 v1, 0x5dc

    :try_start_36
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_39
    .catch Ljava/lang/InterruptedException; {:try_start_36 .. :try_end_39} :catch_4d

    .line 32
    :goto_39
    iget-boolean v0, v0, LMain$ParkTester;->success:Z

    if-eqz v0, :cond_45

    .line 33
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Test succeeded!"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 37
    :goto_44
    return-void

    .line 35
    :cond_45
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Test failed."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_44

    .line 28
    :catch_4d
    move-exception v1

    goto :goto_39
.end method

.method public static setUp()V
    .registers 2

    .prologue
    .line 49
    :try_start_0
    const-class v0, Lsun/misc/Unsafe;

    const-string v1, "THE_ONE"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 50
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 52
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsun/misc/Unsafe;

    sput-object v0, LMain;->UNSAFE:Lsun/misc/Unsafe;
    :try_end_15
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_15} :catch_16
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_15} :catch_1d

    .line 58
    return-void

    .line 53
    :catch_16
    move-exception v0

    .line 54
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    .line 55
    :catch_1d
    move-exception v0

    .line 56
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method
