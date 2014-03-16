.class public LInternedString;
.super Ljava/lang/Object;
.source "InternedString.java"


# static fields
#the value of this static final field might be set in the static constructor
.field static final synthetic $assertionsDisabled:Z = false

.field public static final CONST:Ljava/lang/String; = "Class InternedString"


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 19
    const-class v0, LInternedString;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LInternedString;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static run()V
    .registers 2

    .prologue
    .line 23
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "InternedString.run"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 24
    invoke-static {}, LInternedString;->testImmortalInternedString()V

    .line 25
    invoke-static {}, LInternedString;->testDeadInternedString()V

    .line 26
    return-void
.end method

.method private static testDeadInternedString()V
    .registers 2

    .prologue
    .line 29
    const-string v0, "blah"

    .line 30
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 31
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 33
    const-string v0, "Class InternedString"

    .line 34
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 36
    sget-boolean v0, LInternedString;->$assertionsDisabled:Z

    if-nez v0, :cond_31

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_31

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 37
    :cond_31
    return-void
.end method

.method private static testImmortalInternedString()V
    .registers 3

    .prologue
    .line 40
    new-instance v0, Ljava/lang/ref/WeakReference;

    const-string v1, "Class InternedString"

    invoke-virtual {v1}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 41
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 44
    sget-boolean v1, LInternedString;->$assertionsDisabled:Z

    if-nez v1, :cond_22

    const-string v1, "Class InternedString"

    const-string v2, "Class InternedString"

    invoke-virtual {v2}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v2

    if-eq v1, v2, :cond_22

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 46
    :cond_22
    sget-boolean v1, LInternedString;->$assertionsDisabled:Z

    if-nez v1, :cond_32

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-nez v0, :cond_32

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 48
    :cond_32
    const-string v0, "Class InternedString"

    .line 50
    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/String;->intern()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 52
    const-string v0, ""

    .line 53
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 54
    sget-boolean v0, LInternedString;->$assertionsDisabled:Z

    if-nez v0, :cond_54

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    const-string v1, "Class InternedString"

    if-eq v0, v1, :cond_54

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 55
    :cond_54
    return-void
.end method
