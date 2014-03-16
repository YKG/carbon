.class LMain$Blort;
.super Ljava/lang/Object;
.source "Main.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LMain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Blort"
.end annotation


# instance fields
.field final synthetic this$0:LMain;


# direct methods
.method private constructor <init>(LMain;)V
    .registers 2
    .parameter

    .prologue
    .line 21
    iput-object p1, p0, LMain$Blort;->this$0:LMain;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public repaint()V
    .registers 3

    .prologue
    .line 23
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "shouldn\'t see this"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 24
    return-void
.end method
