.class LUnresTest1;
.super Ljava/lang/Object;
.source "UnresTest1.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 4
    const-class v0, LUnresTest1;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LUnresTest1;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method constructor <init>()V
    .registers 1

    .prologue
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static run()V
    .registers 3

    .prologue
    .line 6
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "UnresTest1..."

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 8
    new-instance v0, LUnresStuff;

    invoke-direct {v0}, LUnresStuff;-><init>()V

    .line 10
    :try_start_c
    iget v1, v0, LUnresStuff;->instField:I

    .line 11
    sget-boolean v1, LUnresTest1;->$assertionsDisabled:Z

    if-nez v1, :cond_19

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_18
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_18} :catch_18

    .line 12
    :catch_18
    move-exception v1

    .line 16
    :cond_19
    :try_start_19
    iget v1, v0, LUnresStuff;->instField:I

    .line 17
    sget-boolean v1, LUnresTest1;->$assertionsDisabled:Z

    if-nez v1, :cond_26

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_25
    .catch Ljava/lang/NoSuchFieldError; {:try_start_19 .. :try_end_25} :catch_25

    .line 18
    :catch_25
    move-exception v1

    .line 22
    :cond_26
    const/4 v1, 0x5

    :try_start_27
    iput v1, v0, LUnresStuff;->instField:I

    .line 23
    sget-boolean v1, LUnresTest1;->$assertionsDisabled:Z

    if-nez v1, :cond_34

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_33
    .catch Ljava/lang/NoSuchFieldError; {:try_start_27 .. :try_end_33} :catch_33

    .line 24
    :catch_33
    move-exception v1

    .line 29
    :cond_34
    :try_start_34
    iget-wide v1, v0, LUnresStuff;->wideInstField:D

    .line 30
    sget-boolean v1, LUnresTest1;->$assertionsDisabled:Z

    if-nez v1, :cond_41

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_40
    .catch Ljava/lang/NoSuchFieldError; {:try_start_34 .. :try_end_40} :catch_40

    .line 31
    :catch_40
    move-exception v1

    .line 35
    :cond_41
    const-wide/16 v1, 0x0

    :try_start_43
    iput-wide v1, v0, LUnresStuff;->wideInstField:D

    .line 36
    sget-boolean v1, LUnresTest1;->$assertionsDisabled:Z

    if-nez v1, :cond_50

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_4f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_43 .. :try_end_4f} :catch_4f

    .line 37
    :catch_4f
    move-exception v1

    .line 42
    :cond_50
    :try_start_50
    sget v1, LUnresStuff;->staticField:I

    .line 43
    sget-boolean v1, LUnresTest1;->$assertionsDisabled:Z

    if-nez v1, :cond_5d

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_5c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_50 .. :try_end_5c} :catch_5c

    .line 44
    :catch_5c
    move-exception v1

    .line 48
    :cond_5d
    const/16 v1, 0x11

    :try_start_5f
    sput v1, LUnresStuff;->staticField:I

    .line 49
    sget-boolean v1, LUnresTest1;->$assertionsDisabled:Z

    if-nez v1, :cond_6c

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_6b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5f .. :try_end_6b} :catch_6b

    .line 50
    :catch_6b
    move-exception v1

    .line 55
    :cond_6c
    :try_start_6c
    sget-wide v1, LUnresStuff;->wideStaticField:D

    .line 56
    sget-boolean v1, LUnresTest1;->$assertionsDisabled:Z

    if-nez v1, :cond_79

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_78
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6c .. :try_end_78} :catch_78

    .line 57
    :catch_78
    move-exception v1

    .line 61
    :cond_79
    const-wide/high16 v1, 0x3ff0

    :try_start_7b
    sput-wide v1, LUnresStuff;->wideStaticField:D

    .line 62
    sget-boolean v1, LUnresTest1;->$assertionsDisabled:Z

    if-nez v1, :cond_88

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_87
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7b .. :try_end_87} :catch_87

    .line 63
    :catch_87
    move-exception v1

    .line 68
    :cond_88
    :try_start_88
    invoke-virtual {v0}, LUnresStuff;->virtualMethod()V

    .line 69
    sget-boolean v0, LUnresTest1;->$assertionsDisabled:Z

    if-nez v0, :cond_96

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_95
    .catch Ljava/lang/NoSuchMethodError; {:try_start_88 .. :try_end_95} :catch_95

    .line 70
    :catch_95
    move-exception v0

    .line 74
    :cond_96
    :try_start_96
    invoke-static {}, LUnresStuff;->staticMethod()V

    .line 75
    sget-boolean v0, LUnresTest1;->$assertionsDisabled:Z

    if-nez v0, :cond_a4

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_a3
    .catch Ljava/lang/NoSuchMethodError; {:try_start_96 .. :try_end_a3} :catch_a3

    .line 76
    :catch_a3
    move-exception v0

    .line 79
    :cond_a4
    return-void
.end method
