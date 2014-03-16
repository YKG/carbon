.class LTarget;
.super LSuperTarget;
.source "Main.java"


# static fields
.field public static final constantString:Ljava/lang/String; = "a constant string"

.field public static staticDouble:D


# instance fields
.field private aPrivateInt:I

.field public anInt:I

.field public final cantTouchThis:I

.field public pubLong:J

.field public string1:Ljava/lang/String;

.field public string2:Ljava/lang/String;

.field public string3:Ljava/lang/String;

.field private string4:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .prologue
    .line 407
    const-wide v0, 0x400a666666666666L

    sput-wide v0, LTarget;->staticDouble:D

    return-void
.end method

.method public constructor <init>()V
    .registers 3

    .prologue
    .line 361
    invoke-direct {p0}, LSuperTarget;-><init>()V

    .line 396
    const-string v0, "hey"

    iput-object v0, p0, LTarget;->string1:Ljava/lang/String;

    .line 397
    const-string v0, "yo"

    iput-object v0, p0, LTarget;->string2:Ljava/lang/String;

    .line 398
    const-string v0, "there"

    iput-object v0, p0, LTarget;->string3:Ljava/lang/String;

    .line 399
    const-string v0, "naughty"

    iput-object v0, p0, LTarget;->string4:Ljava/lang/String;

    .line 403
    const/16 v0, 0x4d

    iput v0, p0, LTarget;->cantTouchThis:I

    .line 405
    const-wide v0, 0x1122334455667788L

    iput-wide v0, p0, LTarget;->pubLong:J

    .line 362
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "Target constructor ()V"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 363
    return-void
.end method

.method public constructor <init>(IF)V
    .registers 6
    .parameter
    .parameter

    .prologue
    .line 365
    invoke-direct {p0}, LSuperTarget;-><init>()V

    .line 396
    const-string v0, "hey"

    iput-object v0, p0, LTarget;->string1:Ljava/lang/String;

    .line 397
    const-string v0, "yo"

    iput-object v0, p0, LTarget;->string2:Ljava/lang/String;

    .line 398
    const-string v0, "there"

    iput-object v0, p0, LTarget;->string3:Ljava/lang/String;

    .line 399
    const-string v0, "naughty"

    iput-object v0, p0, LTarget;->string4:Ljava/lang/String;

    .line 403
    const/16 v0, 0x4d

    iput v0, p0, LTarget;->cantTouchThis:I

    .line 405
    const-wide v0, 0x1122334455667788L

    iput-wide v0, p0, LTarget;->pubLong:J

    .line 366
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Target constructor (IF)V : ii="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ff="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 368
    iput p1, p0, LTarget;->anInt:I

    .line 369
    return-void
.end method

.method public static myNoargMethod()V
    .registers 2

    .prologue
    .line 383
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "myNoargMethod ()V"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 384
    return-void
.end method


# virtual methods
.method public misc()V
    .registers 3

    .prologue
    .line 392
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "misc"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 393
    return-void
.end method

.method public myMethod(I)I
    .registers 5
    .parameter
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NullPointerException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 372
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "myMethod (I)I"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 373
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " arg="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " anInt="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, LTarget;->anInt:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 374
    const/4 v0, 0x5

    return v0
.end method

.method public myMethod([Ljava/lang/String;FC)I
    .registers 7
    .parameter
    .parameter
    .parameter

    .prologue
    .line 378
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "myMethod: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " !"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 379
    const/4 v0, 0x7

    return v0
.end method

.method public throwingMethod()V
    .registers 3

    .prologue
    .line 387
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "throwingMethod"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 388
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "gratuitous throw!"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
