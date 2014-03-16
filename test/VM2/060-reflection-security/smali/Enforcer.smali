.class public LEnforcer;
.super Ljava/lang/SecurityManager;
.source "Enforcer.java"


# static fields
.field public static final THE_ONE:LEnforcer;


# instance fields
.field private deny:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 5
    new-instance v0, LEnforcer;

    invoke-direct {v0}, LEnforcer;-><init>()V

    sput-object v0, LEnforcer;->THE_ONE:LEnforcer;

    return-void
.end method

.method private constructor <init>()V
    .registers 2

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/SecurityManager;-><init>()V

    .line 14
    const/4 v0, 0x0

    iput-boolean v0, p0, LEnforcer;->deny:Z

    .line 15
    return-void
.end method

.method private denyIfAppropriate()V
    .registers 3

    .prologue
    .line 28
    iget-boolean v0, p0, LEnforcer;->deny:Z

    if-eqz v0, :cond_f

    .line 29
    const/4 v0, 0x0

    iput-boolean v0, p0, LEnforcer;->deny:Z

    .line 30
    new-instance v0, Ljava/lang/SecurityException;

    const-string v1, "Denied!"

    invoke-direct {v0, v1}, Ljava/lang/SecurityException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_f
    return-void
.end method


# virtual methods
.method public checkMemberAccess(Ljava/lang/Class;I)V
    .registers 7
    .parameter
    .parameter

    .prologue
    .line 43
    packed-switch p2, :pswitch_data_50

    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ">?"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 49
    :goto_1c
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "checkMemberAccess: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 51
    invoke-direct {p0}, LEnforcer;->denyIfAppropriate()V

    .line 52
    invoke-super {p0, p1, p2}, Ljava/lang/SecurityManager;->checkMemberAccess(Ljava/lang/Class;I)V

    .line 53
    return-void

    .line 44
    :pswitch_49
    const-string v0, "DECLARED"

    goto :goto_1c

    .line 45
    :pswitch_4c
    const-string v0, "PUBLIC"

    goto :goto_1c

    .line 43
    nop

    :pswitch_data_50
    .packed-switch 0x0
        :pswitch_4c
        :pswitch_49
    .end packed-switch
.end method

.method public checkPackageAccess(Ljava/lang/String;)V
    .registers 5
    .parameter

    .prologue
    .line 35
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "checkPackageAccess: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 36
    invoke-direct {p0}, LEnforcer;->denyIfAppropriate()V

    .line 37
    invoke-super {p0, p1}, Ljava/lang/SecurityManager;->checkPackageAccess(Ljava/lang/String;)V

    .line 38
    return-void
.end method

.method public checkPermission(Ljava/security/Permission;)V
    .registers 5
    .parameter

    .prologue
    .line 56
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "checkPermission: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 57
    invoke-direct {p0}, LEnforcer;->denyIfAppropriate()V

    .line 58
    invoke-super {p0, p1}, Ljava/lang/SecurityManager;->checkPermission(Ljava/security/Permission;)V

    .line 59
    return-void
.end method

.method public checkPermission(Ljava/security/Permission;Ljava/lang/Object;)V
    .registers 6
    .parameter
    .parameter

    .prologue
    .line 62
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "checkPermission: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 63
    invoke-direct {p0}, LEnforcer;->denyIfAppropriate()V

    .line 64
    invoke-super {p0, p1, p2}, Ljava/lang/SecurityManager;->checkPermission(Ljava/security/Permission;Ljava/lang/Object;)V

    .line 65
    return-void
.end method

.method public denyNext()V
    .registers 2

    .prologue
    .line 21
    const/4 v0, 0x1

    iput-boolean v0, p0, LEnforcer;->deny:Z

    .line 22
    return-void
.end method
