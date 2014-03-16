.class public LMain$Special;
.super Ljava/lang/Object;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Special"
.end annotation


# instance fields
.field mBlort:LMain$Blort;


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    const/4 v0, 0x0

    iput-object v0, p0, LMain$Special;->mBlort:LMain$Blort;

    .line 13
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "new Special()"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 14
    return-void
.end method


# virtual methods
.method public callInner()V
    .registers 2

    .prologue
    .line 17
    iget-object v0, p0, LMain$Special;->mBlort:LMain$Blort;

    invoke-virtual {v0}, LMain$Blort;->repaint()V

    .line 18
    return-void
.end method
