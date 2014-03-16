.class public LClasses;
.super Ljava/lang/Object;
.source "Classes.java"


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field mSome:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 9
    const-class v0, LClasses;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_c

    const/4 v0, 0x1

    :goto_9
    sput-boolean v0, LClasses;->$assertionsDisabled:Z

    return-void

    :cond_c
    const/4 v0, 0x0

    goto :goto_9
.end method

.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static arrayInstance()V
    .registers 15

    .prologue
    const/4 v1, 0x5

    const/4 v3, 0x3

    const/4 v14, 0x0

    const/4 v0, 0x2

    const/4 v5, 0x1

    .line 116
    sget-object v2, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v4, "Classes.arrayInstance"

    invoke-virtual {v2, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 118
    new-instance v8, LClasses;

    invoke-direct {v8}, LClasses;-><init>()V

    .line 119
    new-array v9, v5, [LClasses;

    .line 120
    filled-new-array {v5, v5}, [I

    move-result-object v2

    const-class v4, LClasses;

    invoke-static {v4, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[LClasses;

    .line 121
    filled-new-array {v5, v0, v3}, [I

    move-result-object v2

    const-class v4, LClasses;

    invoke-static {v4, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[[LClasses;

    .line 122
    new-instance v10, LMoreClasses;

    invoke-direct {v10}, LMoreClasses;-><init>()V

    .line 123
    new-array v11, v3, [LMoreClasses;

    .line 124
    filled-new-array {v0, v3}, [I

    move-result-object v4

    const-class v6, LMoreClasses;

    invoke-static {v6, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[LMoreClasses;

    .line 125
    filled-new-array {v5, v0, v3}, [I

    move-result-object v6

    const-class v7, LMoreClasses;

    invoke-static {v7, v6}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [[[LMoreClasses;

    .line 126
    new-array v12, v5, [I

    .line 127
    filled-new-array {v5, v5}, [I

    move-result-object v7

    sget-object v13, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    invoke-static {v13, v7}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, [[I

    .line 130
    invoke-static {v8}, LClasses;->xTests(Ljava/lang/Object;)V

    .line 131
    invoke-static {v10}, LClasses;->yTests(Ljava/lang/Object;)V

    .line 132
    invoke-static {v9}, LClasses;->xarTests(Ljava/lang/Object;)V

    .line 133
    invoke-static {v11}, LClasses;->yarTests(Ljava/lang/Object;)V

    .line 134
    invoke-static {v2}, LClasses;->xarararTests(Ljava/lang/Object;)V

    .line 135
    invoke-static {v6}, LClasses;->yarararTests(Ljava/lang/Object;)V

    .line 136
    invoke-static {v12}, LClasses;->iarTests(Ljava/lang/Object;)V

    .line 137
    invoke-static {v7}, LClasses;->iararTests(Ljava/lang/Object;)V

    .line 139
    aput-object v4, v6, v14

    .line 140
    aget-object v2, v6, v14

    aput-object v11, v2, v14

    .line 141
    aget-object v2, v6, v14

    aput-object v11, v2, v5

    .line 142
    aget-object v2, v6, v14

    aget-object v2, v2, v14

    aput-object v10, v2, v14

    .line 143
    aget-object v2, v6, v14

    aget-object v2, v2, v14

    aput-object v10, v2, v5

    .line 144
    aget-object v2, v6, v14

    aget-object v2, v2, v14

    aput-object v10, v2, v0

    .line 145
    aget-object v2, v6, v14

    aget-object v2, v2, v5

    aput-object v10, v2, v14

    .line 146
    aget-object v2, v6, v14

    aget-object v2, v2, v5

    aput-object v10, v2, v5

    .line 147
    aget-object v2, v6, v14

    aget-object v2, v2, v5

    aput-object v10, v2, v0

    .line 151
    filled-new-array {v0, v3, v0, v5}, [I

    move-result-object v2

    const-class v4, Ljava/lang/String;

    invoke-static {v4, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[[[Ljava/lang/String;

    .line 152
    filled-new-array {v0, v3, v0}, [I

    move-result-object v4

    const-class v6, Ljava/lang/String;

    invoke-static {v6, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[[Ljava/lang/String;

    aput-object v4, v2, v14

    .line 153
    aget-object v6, v2, v14

    filled-new-array {v3, v0}, [I

    move-result-object v4

    const-class v7, Ljava/lang/String;

    invoke-static {v7, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[Ljava/lang/String;

    aput-object v4, v6, v5

    .line 154
    aget-object v4, v2, v14

    aget-object v4, v4, v5

    new-array v6, v0, [Ljava/lang/String;

    aput-object v6, v4, v0

    .line 155
    aget-object v4, v2, v14

    aget-object v4, v4, v5

    aget-object v4, v4, v0

    const-string v6, "HELLO-1"

    aput-object v6, v4, v5

    .line 156
    invoke-static {v2}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    .line 158
    filled-new-array {v1, v0, v3, v0, v5}, [I

    move-result-object v2

    const-class v4, Ljava/lang/String;

    invoke-static {v4, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[[[[Ljava/lang/String;

    .line 159
    filled-new-array {v1, v0, v3, v0}, [I

    move-result-object v4

    const-class v6, Ljava/lang/String;

    invoke-static {v6, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[[[Ljava/lang/String;

    aput-object v4, v2, v14

    .line 160
    aget-object v6, v2, v14

    filled-new-array {v1, v0, v3}, [I

    move-result-object v4

    const-class v7, Ljava/lang/String;

    invoke-static {v7, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[[Ljava/lang/String;

    aput-object v4, v6, v5

    .line 161
    aget-object v4, v2, v14

    aget-object v6, v4, v5

    filled-new-array {v1, v0}, [I

    move-result-object v4

    const-class v7, Ljava/lang/String;

    invoke-static {v7, v4}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, [[Ljava/lang/String;

    aput-object v4, v6, v0

    .line 162
    aget-object v4, v2, v14

    aget-object v4, v4, v5

    aget-object v4, v4, v0

    new-array v6, v1, [Ljava/lang/String;

    aput-object v6, v4, v5

    .line 163
    aget-object v4, v2, v14

    aget-object v4, v4, v5

    aget-object v4, v4, v0

    aget-object v4, v4, v5

    const/4 v6, 0x4

    const-string v7, "HELLO-2"

    aput-object v7, v4, v6

    .line 164
    invoke-static {v2}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    move v2, v0

    move v4, v0

    .line 167
    filled-new-array/range {v0 .. v5}, [I

    move-result-object v2

    const-class v4, Ljava/lang/String;

    invoke-static {v4, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [[[[[[Ljava/lang/String;

    .line 168
    new-array v4, v0, [[[[[Ljava/lang/String;

    aput-object v4, v2, v14

    .line 169
    aget-object v4, v2, v14

    new-array v6, v3, [[[[Ljava/lang/String;

    aput-object v6, v4, v5

    .line 170
    aget-object v4, v2, v14

    aget-object v4, v4, v5

    new-array v6, v0, [[[Ljava/lang/String;

    aput-object v6, v4, v0

    .line 171
    aget-object v4, v2, v14

    aget-object v4, v4, v5

    aget-object v4, v4, v0

    new-array v6, v1, [[Ljava/lang/String;

    aput-object v6, v4, v5

    .line 172
    aget-object v4, v2, v14

    aget-object v4, v4, v5

    aget-object v4, v4, v0

    aget-object v4, v4, v5

    const/4 v6, 0x4

    new-array v7, v0, [Ljava/lang/String;

    aput-object v7, v4, v6

    .line 173
    aget-object v4, v2, v14

    aget-object v4, v4, v5

    aget-object v4, v4, v0

    aget-object v4, v4, v5

    const/4 v6, 0x4

    aget-object v4, v4, v6

    const-string v6, "HELLO-3"

    aput-object v6, v4, v5

    .line 174
    invoke-static {v2}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    .line 177
    new-array v2, v5, [[[[[[Ljava/lang/String;

    .line 178
    new-array v4, v0, [[[[[Ljava/lang/String;

    aput-object v4, v2, v14

    .line 179
    aget-object v4, v2, v14

    new-array v3, v3, [[[[Ljava/lang/String;

    aput-object v3, v4, v5

    .line 180
    aget-object v3, v2, v14

    aget-object v3, v3, v5

    new-array v4, v0, [[[Ljava/lang/String;

    aput-object v4, v3, v0

    .line 181
    aget-object v3, v2, v14

    aget-object v3, v3, v5

    aget-object v3, v3, v0

    new-array v1, v1, [[Ljava/lang/String;

    aput-object v1, v3, v5

    .line 182
    aget-object v1, v2, v14

    aget-object v1, v1, v5

    aget-object v1, v1, v0

    aget-object v1, v1, v5

    const/4 v3, 0x4

    new-array v4, v0, [Ljava/lang/String;

    aput-object v4, v1, v3

    .line 183
    aget-object v1, v2, v14

    aget-object v1, v1, v5

    aget-object v0, v1, v0

    aget-object v0, v0, v5

    const/4 v1, 0x4

    aget-object v0, v0, v1

    const-string v1, "HELLO-4"

    aput-object v1, v0, v5

    .line 184
    invoke-static {v2}, Ljava/util/Arrays;->deepToString([Ljava/lang/Object;)Ljava/lang/String;

    .line 188
    const/4 v0, 0x5

    const/4 v1, 0x2

    const/4 v2, 0x3

    const/4 v3, 0x2

    const v4, 0x4002be30

    :try_start_1c0
    filled-new-array {v0, v1, v2, v3, v4}, [I

    move-result-object v0

    const-class v1, Ljava/lang/String;

    invoke-static {v1, v0}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[[[[Ljava/lang/String;

    .line 189
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_1d7

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0
    :try_end_1d6
    .catch Ljava/lang/Error; {:try_start_1c0 .. :try_end_1d6} :catch_1d6

    .line 190
    :catch_1d6
    move-exception v0

    .line 194
    :cond_1d7
    return-void
.end method

.method static iarTests(Ljava/lang/Object;)V
    .registers 2
    .parameter

    .prologue
    .line 100
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    instance-of v0, p0, Ljava/lang/Object;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 101
    :cond_e
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_1c

    instance-of v0, p0, [Ljava/lang/Object;

    if-eqz v0, :cond_1c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 102
    :cond_1c
    return-void
.end method

.method static iararTests(Ljava/lang/Object;)V
    .registers 2
    .parameter

    .prologue
    .line 104
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    instance-of v0, p0, Ljava/lang/Object;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 105
    :cond_e
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_1c

    instance-of v0, p0, [Ljava/lang/Object;

    if-nez v0, :cond_1c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 106
    :cond_1c
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_2a

    instance-of v0, p0, [[Ljava/lang/Object;

    if-eqz v0, :cond_2a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 107
    :cond_2a
    return-void
.end method

.method public static run()V
    .registers 3

    .prologue
    .line 197
    new-instance v0, LClasses;

    invoke-direct {v0}, LClasses;-><init>()V

    .line 198
    new-instance v1, LMoreClasses;

    invoke-direct {v1}, LMoreClasses;-><init>()V

    .line 199
    const/4 v2, 0x0

    invoke-virtual {v0, v0, v1, v2}, LClasses;->checkCast(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 201
    const/4 v0, 0x1

    invoke-virtual {v1, v0}, LMoreClasses;->subFunc(Z)V

    .line 202
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, LMoreClasses;->superFunc(Z)V

    .line 203
    invoke-static {}, LClasses;->arrayInstance()V

    .line 204
    return-void
.end method

.method static xTests(Ljava/lang/Object;)V
    .registers 2
    .parameter

    .prologue
    .line 62
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    instance-of v0, p0, LClasses;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 63
    :cond_e
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_1c

    instance-of v0, p0, LMoreClasses;

    if-eqz v0, :cond_1c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 64
    :cond_1c
    return-void
.end method

.method static xarTests(Ljava/lang/Object;)V
    .registers 2
    .parameter

    .prologue
    .line 70
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    instance-of v0, p0, Ljava/lang/Object;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 71
    :cond_e
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_1c

    instance-of v0, p0, LClasses;

    if-eqz v0, :cond_1c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 72
    :cond_1c
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_2a

    instance-of v0, p0, [LClasses;

    if-nez v0, :cond_2a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 73
    :cond_2a
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_38

    instance-of v0, p0, [LMoreClasses;

    if-eqz v0, :cond_38

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 74
    :cond_38
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_46

    instance-of v0, p0, [Ljava/lang/Object;

    if-nez v0, :cond_46

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 75
    :cond_46
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_54

    instance-of v0, p0, [[Ljava/lang/Object;

    if-eqz v0, :cond_54

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 76
    :cond_54
    return-void
.end method

.method static xarararTests(Ljava/lang/Object;)V
    .registers 2
    .parameter

    .prologue
    .line 82
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    instance-of v0, p0, Ljava/lang/Object;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 83
    :cond_e
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_1c

    instance-of v0, p0, [Ljava/lang/Object;

    if-nez v0, :cond_1c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 84
    :cond_1c
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_2a

    instance-of v0, p0, LClasses;

    if-eqz v0, :cond_2a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 85
    :cond_2a
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_38

    instance-of v0, p0, [LClasses;

    if-eqz v0, :cond_38

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 86
    :cond_38
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_46

    instance-of v0, p0, [[LClasses;

    if-eqz v0, :cond_46

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 87
    :cond_46
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_54

    instance-of v0, p0, [[[LClasses;

    if-nez v0, :cond_54

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 88
    :cond_54
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_62

    instance-of v0, p0, [[[LMoreClasses;

    if-eqz v0, :cond_62

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 89
    :cond_62
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_70

    instance-of v0, p0, [[[Ljava/lang/Object;

    if-nez v0, :cond_70

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 90
    :cond_70
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_7e

    instance-of v0, p0, Ljava/io/Serializable;

    if-nez v0, :cond_7e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 91
    :cond_7e
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_8c

    instance-of v0, p0, [Ljava/io/Serializable;

    if-nez v0, :cond_8c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 92
    :cond_8c
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_9a

    instance-of v0, p0, [[Ljava/io/Serializable;

    if-nez v0, :cond_9a

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 93
    :cond_9a
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_a8

    instance-of v0, p0, [[[Ljava/io/Serializable;

    if-eqz v0, :cond_a8

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 94
    :cond_a8
    return-void
.end method

.method static yTests(Ljava/lang/Object;)V
    .registers 2
    .parameter

    .prologue
    .line 66
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    instance-of v0, p0, LClasses;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 67
    :cond_e
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_1c

    instance-of v0, p0, LMoreClasses;

    if-nez v0, :cond_1c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 68
    :cond_1c
    return-void
.end method

.method static yarTests(Ljava/lang/Object;)V
    .registers 2
    .parameter

    .prologue
    .line 78
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    instance-of v0, p0, [LClasses;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 79
    :cond_e
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_1c

    instance-of v0, p0, [LMoreClasses;

    if-nez v0, :cond_1c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 80
    :cond_1c
    return-void
.end method

.method static yarararTests(Ljava/lang/Object;)V
    .registers 2
    .parameter

    .prologue
    .line 96
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_e

    instance-of v0, p0, [[[LClasses;

    if-nez v0, :cond_e

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 97
    :cond_e
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_1c

    instance-of v0, p0, [[[LMoreClasses;

    if-nez v0, :cond_1c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 98
    :cond_1c
    return-void
.end method


# virtual methods
.method checkCast(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 11
    .parameter
    .parameter
    .parameter

    .prologue
    const/4 v6, 0x7

    const/4 v2, 0x0

    .line 17
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v3, "Classes.checkCast"

    invoke-virtual {v1, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    move-object v1, p1

    .line 22
    check-cast v1, LClasses;

    .line 23
    sget-boolean v1, LClasses;->$assertionsDisabled:Z

    if-nez v1, :cond_1a

    instance-of v1, p1, LClasses;

    if-nez v1, :cond_1a

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    :cond_1a
    move-object v1, p2

    .line 24
    check-cast v1, LClasses;

    .line 25
    sget-boolean v1, LClasses;->$assertionsDisabled:Z

    if-nez v1, :cond_2b

    instance-of v1, p2, LClasses;

    if-nez v1, :cond_2b

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    :cond_2b
    move-object v1, p2

    .line 27
    check-cast v1, LMoreClasses;

    .line 28
    sget-boolean v1, LClasses;->$assertionsDisabled:Z

    if-nez v1, :cond_3c

    instance-of v1, p2, LMoreClasses;

    if-nez v1, :cond_3c

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 29
    :cond_3c
    sget-boolean v1, LClasses;->$assertionsDisabled:Z

    if-nez v1, :cond_4a

    instance-of v1, p1, LMoreClasses;

    if-eqz v1, :cond_4a

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 32
    :cond_4a
    :try_start_4a
    move-object v0, p1

    check-cast v0, LMoreClasses;

    move-object v1, v0

    .line 33
    sget-boolean v1, LClasses;->$assertionsDisabled:Z

    if-nez v1, :cond_71

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_58
    .catch Ljava/lang/ClassCastException; {:try_start_4a .. :try_end_58} :catch_58

    .line 34
    :catch_58
    move-exception v1

    .line 37
    sget-boolean v3, LClasses;->$assertionsDisabled:Z

    if-nez v3, :cond_71

    invoke-virtual {v1}, Ljava/lang/ClassCastException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v4, "Classes"

    move v3, v2

    move v5, v2

    invoke-virtual/range {v1 .. v6}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v1

    if-nez v1, :cond_71

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 39
    :cond_71
    sget-boolean v1, LClasses;->$assertionsDisabled:Z

    if-nez v1, :cond_7f

    instance-of v1, p1, LMoreClasses;

    if-eqz v1, :cond_7f

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 43
    :cond_7f
    :try_start_7f
    move-object v0, p1

    check-cast v0, Ljava/math/RoundingMode;

    move-object v1, v0

    .line 44
    sget-boolean v1, LClasses;->$assertionsDisabled:Z

    if-nez v1, :cond_a6

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1
    :try_end_8d
    .catch Ljava/lang/ClassCastException; {:try_start_7f .. :try_end_8d} :catch_8d

    .line 45
    :catch_8d
    move-exception v1

    .line 48
    sget-boolean v3, LClasses;->$assertionsDisabled:Z

    if-nez v3, :cond_a6

    invoke-virtual {v1}, Ljava/lang/ClassCastException;->getMessage()Ljava/lang/String;

    move-result-object v1

    const-string v4, "Classes"

    move v3, v2

    move v5, v2

    invoke-virtual/range {v1 .. v6}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v1

    if-nez v1, :cond_a6

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 50
    :cond_a6
    sget-boolean v1, LClasses;->$assertionsDisabled:Z

    if-nez v1, :cond_b4

    instance-of v1, p1, Ljava/math/BigDecimal;

    if-eqz v1, :cond_b4

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    :cond_b4
    move-object v1, p3

    .line 53
    check-cast v1, LClasses;

    move-object v1, p3

    .line 54
    check-cast v1, LMoreClasses;

    move-object v1, p3

    .line 55
    check-cast v1, LMoreClasses;

    .line 56
    sget-boolean v1, LClasses;->$assertionsDisabled:Z

    if-nez v1, :cond_cb

    instance-of v1, p3, LClasses;

    if-eqz v1, :cond_cb

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 58
    :cond_cb
    return-void
.end method

.method public subFunc(Z)V
    .registers 3
    .parameter

    .prologue
    .line 13
    sget-boolean v0, LClasses;->$assertionsDisabled:Z

    if-nez v0, :cond_c

    if-eqz p1, :cond_c

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 14
    :cond_c
    return-void
.end method
