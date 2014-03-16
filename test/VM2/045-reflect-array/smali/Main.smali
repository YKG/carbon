.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 3
    .parameter

    .prologue
    .line 12
    invoke-static {}, LMain;->testSingleInt()V

    .line 13
    invoke-static {}, LMain;->testSingle()V

    .line 14
    invoke-static {}, LMain;->testMultiInt()V

    .line 15
    invoke-static {}, LMain;->testMulti()V

    .line 17
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "ReflectArrayTest passed"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 18
    return-void
.end method

.method static testMulti()V
    .registers 9

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 104
    new-array v0, v8, [I

    fill-array-data v0, :array_94

    .line 106
    const-class v1, Ljava/lang/String;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    .line 107
    check-cast v0, [[[Ljava/lang/String;

    check-cast v0, [[[Ljava/lang/String;

    .line 109
    aget-object v2, v0, v5

    aget-object v2, v2, v5

    const-string v3, "zero zero zero"

    aput-object v3, v2, v5

    .line 110
    aget-object v2, v0, v5

    aget-object v2, v2, v6

    const-string v3, "zero one two"

    aput-object v3, v2, v7

    .line 113
    const/4 v2, 0x1

    :try_start_25
    aget-object v2, v0, v2

    const/4 v3, 0x0

    aget-object v2, v2, v3

    const/4 v3, 0x0

    const-string v4, "bad store"

    aput-object v4, v2, v3

    .line 114
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "store should have failed"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_37
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_25 .. :try_end_37} :catch_37

    .line 116
    :catch_37
    move-exception v2

    .line 120
    :try_start_38
    check-cast v1, [[Ljava/lang/String;

    check-cast v1, [[Ljava/lang/String;

    .line 121
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "expecting bad cast"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_44
    .catch Ljava/lang/ClassCastException; {:try_start_38 .. :try_end_44} :catch_44

    .line 123
    :catch_44
    move-exception v1

    .line 126
    const/4 v1, 0x4

    new-array v1, v1, [Ljava/lang/String;

    .line 127
    const-string v2, "zero one two ++"

    aput-object v2, v1, v7

    .line 128
    aget-object v2, v0, v5

    aput-object v1, v2, v6

    .line 129
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    aget-object v0, v0, v5

    aget-object v0, v0, v6

    aget-object v0, v0, v7

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 133
    new-array v0, v7, [I

    fill-array-data v0, :array_9e

    .line 134
    const-class v1, [Ljava/lang/String;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    .line 135
    check-cast v0, [[[Ljava/lang/String;

    check-cast v0, [[[Ljava/lang/String;

    .line 137
    aget-object v1, v0, v5

    new-array v2, v8, [Ljava/lang/String;

    aput-object v2, v1, v6

    .line 138
    aget-object v1, v0, v5

    aget-object v1, v1, v6

    const-string v2, "zero one two"

    aput-object v2, v1, v7

    .line 140
    const/4 v1, 0x1

    :try_start_79
    aget-object v0, v0, v1

    const/4 v1, 0x0

    aget-object v0, v0, v1

    const/4 v1, 0x0

    const-string v2, "bad store"

    aput-object v2, v0, v1

    .line 141
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "store should have failed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_8b
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_79 .. :try_end_8b} :catch_8b

    .line 143
    :catch_8b
    move-exception v0

    .line 145
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "ReflectArrayTest.testMulti passed"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 146
    return-void

    .line 104
    :array_94
    .array-data 0x4
        0x1t 0x0t 0x0t 0x0t
        0x2t 0x0t 0x0t 0x0t
        0x3t 0x0t 0x0t 0x0t
    .end array-data

    .line 133
    :array_9e
    .array-data 0x4
        0x1t 0x0t 0x0t 0x0t
        0x2t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method static testMultiInt()V
    .registers 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 85
    const/4 v0, 0x3

    new-array v0, v0, [I

    fill-array-data v0, :array_40

    .line 87
    sget-object v1, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    .line 88
    check-cast v0, [[[I

    check-cast v0, [[[I

    .line 90
    aget-object v1, v0, v3

    aget-object v1, v1, v3

    const/16 v2, 0x7b

    aput v2, v1, v3

    .line 91
    aget-object v1, v0, v5

    aget-object v1, v1, v4

    const/16 v2, 0x1c8

    aput v2, v1, v3

    .line 94
    const/4 v1, 0x2

    :try_start_24
    aget-object v0, v0, v1

    const/4 v1, 0x1

    aget-object v0, v0, v1

    const/4 v1, 0x1

    const/16 v2, 0x300

    aput v2, v0, v1

    .line 95
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "store should have failed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_36
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_24 .. :try_end_36} :catch_36

    .line 97
    :catch_36
    move-exception v0

    .line 99
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "ReflectArrayTest.testMultiInt passed"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 100
    return-void

    .line 85
    nop

    :array_40
    .array-data 0x4
        0x3t 0x0t 0x0t 0x0t
        0x2t 0x0t 0x0t 0x0t
        0x1t 0x0t 0x0t 0x0t
    .end array-data
.end method

.method static testSingle()V
    .registers 6

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 62
    const-class v0, Ljava/lang/String;

    invoke-static {v0, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    .line 64
    check-cast v0, [Ljava/lang/String;

    check-cast v0, [Ljava/lang/String;

    .line 65
    const-string v2, "entry zero"

    aput-object v2, v0, v3

    .line 66
    const-string v2, "entry one"

    invoke-static {v1, v4, v2}, Ljava/lang/reflect/Array;->set(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 70
    const-string v2, "entry zero"

    invoke-static {v1, v3}, Ljava/lang/reflect/Array;->get(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_29

    .line 71
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0

    .line 72
    :cond_29
    const-string v2, "entry one"

    aget-object v3, v0, v4

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_39

    .line 73
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0

    .line 75
    :cond_39
    array-length v2, v0

    invoke-static {v1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v1

    if-ne v2, v1, :cond_43

    array-length v0, v0

    if-eq v0, v5, :cond_4b

    .line 78
    :cond_43
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "bad len"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_4b
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "ReflectArrayTest.testSingle passed"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 81
    return-void
.end method

.method static testSingleInt()V
    .registers 8

    .prologue
    const/4 v7, 0x6

    const/4 v6, 0x5

    const/4 v3, 0x1

    const/4 v5, 0x2

    const/4 v4, 0x0

    .line 23
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v0, v5}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v1

    move-object v0, v1

    .line 25
    check-cast v0, [I

    check-cast v0, [I

    .line 26
    aput v6, v0, v4

    .line 27
    invoke-static {v1, v3, v7}, Ljava/lang/reflect/Array;->setInt(Ljava/lang/Object;II)V

    .line 29
    invoke-static {v1, v4}, Ljava/lang/reflect/Array;->getInt(Ljava/lang/Object;I)I

    move-result v2

    if-eq v2, v6, :cond_21

    .line 30
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0

    .line 31
    :cond_21
    aget v2, v0, v3

    if-eq v2, v7, :cond_2b

    .line 32
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0

    .line 34
    :cond_2b
    const/4 v2, 0x2

    const/16 v3, 0x1b

    :try_start_2e
    aput v3, v0, v2

    .line 35
    new-instance v2, Ljava/lang/RuntimeException;

    const-string v3, "store should have failed"

    invoke-direct {v2, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_38
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2e .. :try_end_38} :catch_38

    .line 37
    :catch_38
    move-exception v2

    .line 39
    array-length v2, v0

    invoke-static {v1}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v3

    if-ne v2, v3, :cond_43

    array-length v0, v0

    if-eq v0, v5, :cond_4b

    .line 42
    :cond_43
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "bad len"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_4b
    :try_start_4b
    check-cast v1, [[I

    check-cast v1, [[I

    .line 48
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "cast should have failed"

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_57
    .catch Ljava/lang/ClassCastException; {:try_start_4b .. :try_end_57} :catch_57

    .line 50
    :catch_57
    move-exception v0

    .line 53
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v0, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v0

    .line 54
    invoke-static {v0}, Ljava/lang/reflect/Array;->getLength(Ljava/lang/Object;)I

    move-result v0

    if-eqz v0, :cond_6a

    .line 55
    new-instance v0, Ljava/lang/RuntimeException;

    invoke-direct {v0}, Ljava/lang/RuntimeException;-><init>()V

    throw v0

    .line 56
    :cond_6a
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "ReflectArrayTest.testSingleInt passed"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 57
    return-void
.end method
