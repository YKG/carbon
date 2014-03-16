.class public LFinalizerTest;
.super Ljava/lang/Object;
.source "FinalizerTest.java"


# static fields
.field public static mNothing:LFinalizerTest;

.field public static mReborn:LFinalizerTest;


# instance fields
.field public mMsg:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 6
    new-instance v0, LFinalizerTest;

    const-string v1, "nothing"

    invoke-direct {v0, v1}, LFinalizerTest;-><init>(Ljava/lang/String;)V

    sput-object v0, LFinalizerTest;->mNothing:LFinalizerTest;

    .line 7
    sget-object v0, LFinalizerTest;->mNothing:LFinalizerTest;

    sput-object v0, LFinalizerTest;->mReborn:LFinalizerTest;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .parameter

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    const-string v0, "default"

    iput-object v0, p0, LFinalizerTest;->mMsg:Ljava/lang/String;

    .line 12
    iput-object p1, p0, LFinalizerTest;->mMsg:Ljava/lang/String;

    .line 13
    return-void
.end method


# virtual methods
.method protected finalize()V
    .registers 4

    .prologue
    .line 20
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "finalizer executed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, LFinalizerTest;->mMsg:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 21
    sput-object p0, LFinalizerTest;->mReborn:LFinalizerTest;

    .line 22
    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 16
    iget-object v0, p0, LFinalizerTest;->mMsg:Ljava/lang/String;

    return-object v0
.end method
