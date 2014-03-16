.class LSubOther;
.super Lother/OtherPackage;
.source "Main.java"


# instance fields
.field protected protLongField:J


# direct methods
.method constructor <init>()V
    .registers 3

    .prologue
    .line 105
    invoke-direct {p0}, Lother/OtherPackage;-><init>()V

    .line 107
    const-wide v0, 0x1122334455667788L

    iput-wide v0, p0, LSubOther;->protLongField:J

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 2
    .parameter

    .prologue
    .line 117
    new-instance v0, LSubOther;

    invoke-direct {v0}, LSubOther;-><init>()V

    .line 118
    invoke-virtual {v0}, LSubOther;->doTests()V

    .line 119
    return-void
.end method


# virtual methods
.method public doTests()V
    .registers 14

    .prologue
    .line 122
    const-class v0, LSamePackage;

    .line 123
    const-class v1, Lother/OtherPackage;

    .line 129
    new-instance v2, LMain;

    invoke-direct {v2}, LMain;-><init>()V

    .line 130
    new-instance v3, LSamePackage;

    invoke-direct {v3}, LSamePackage;-><init>()V

    .line 131
    new-instance v4, Lother/OtherPackage;

    invoke-direct {v4}, Lother/OtherPackage;-><init>()V

    .line 132
    new-instance v5, Ljava/lang/Object;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    .line 138
    :try_start_18
    const-string v6, "pubByteField"

    invoke-virtual {v0, v6}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 139
    const-string v7, "protByteField"

    invoke-virtual {v0, v7}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 140
    const-string v8, "protObjectField"

    invoke-virtual {v0, v8}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 141
    const-string v8, "privFloatField"

    invoke-virtual {v0, v8}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 143
    const-string v8, "pubCharField"

    invoke-virtual {v1, v8}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 144
    const-string v8, "protShortField"

    invoke-virtual {v1, v8}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v8

    .line 145
    const-string v9, "protObjectField"

    invoke-virtual {v1, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 146
    const-string v9, "pkgDoubleField"

    invoke-virtual {v1, v9}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 148
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v9

    const-string v10, "protLongField"

    invoke-virtual {v9, v10}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;
    :try_end_4e
    .catch Ljava/lang/NoSuchFieldException; {:try_start_18 .. :try_end_4e} :catch_109

    move-result-object v9

    .line 156
    const/16 v10, 0x42

    const/4 v11, 0x0

    invoke-virtual {v2, v6, v3, v10, v11}, LMain;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 161
    const/16 v10, 0x42

    const/4 v11, 0x0

    invoke-virtual {p0, v7, v3, v10, v11}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 166
    const/16 v10, 0x46

    const-class v11, Ljava/lang/IllegalAccessException;

    invoke-virtual {p0, v0, v3, v10, v11}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 178
    const/16 v10, 0x53

    const/4 v11, 0x0

    invoke-virtual {p0, v8, p0, v10, v11}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 180
    const/16 v10, 0x53

    const-class v11, Ljava/lang/IllegalAccessException;

    invoke-virtual {p0, v8, v4, v10, v11}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 182
    const/16 v10, 0x44

    const-class v11, Ljava/lang/IllegalAccessException;

    invoke-virtual {p0, v1, v4, v10, v11}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 190
    const/4 v10, 0x0

    const/16 v11, 0x42

    const-class v12, Ljava/lang/NullPointerException;

    invoke-virtual {v2, v6, v10, v11, v12}, LMain;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 193
    const/4 v6, 0x0

    const/16 v10, 0x4a

    const-class v11, Ljava/lang/NullPointerException;

    invoke-virtual {p0, v9, v6, v10, v11}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 196
    const/4 v6, 0x0

    const/16 v10, 0x46

    const-class v11, Ljava/lang/IllegalAccessException;

    invoke-virtual {p0, v0, v6, v10, v11}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 199
    const/4 v6, 0x0

    const/16 v10, 0x53

    const-class v11, Ljava/lang/IllegalAccessException;

    invoke-virtual {v2, v8, v6, v10, v11}, LMain;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 201
    const/4 v6, 0x0

    const/16 v10, 0x53

    const-class v11, Ljava/lang/IllegalAccessException;

    invoke-virtual {p0, v8, v6, v10, v11}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 203
    const/4 v6, 0x0

    const/16 v10, 0x44

    const-class v11, Ljava/lang/IllegalAccessException;

    invoke-virtual {p0, v1, v6, v10, v11}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 206
    const/4 v1, 0x0

    const/16 v6, 0x5a

    const-class v10, Ljava/lang/IllegalAccessException;

    invoke-virtual {v2, v8, v1, v6, v10}, LMain;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 216
    const/16 v1, 0x4a

    const/4 v6, 0x0

    invoke-virtual {p0, v9, p0, v1, v6}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 218
    const/16 v1, 0x5a

    const-class v6, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0, v7, v3, v1, v6}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 220
    const/16 v1, 0x5a

    const-class v3, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0, v9, p0, v1, v3}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 222
    const/16 v1, 0x5a

    const-class v3, Ljava/lang/IllegalAccessException;

    invoke-virtual {p0, v0, p0, v1, v3}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 224
    const/16 v1, 0x5a

    const-class v3, Ljava/lang/IllegalAccessException;

    invoke-virtual {p0, v0, p0, v1, v3}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 226
    const/16 v1, 0x5a

    const-class v3, Ljava/lang/IllegalAccessException;

    invoke-virtual {v2, v8, v4, v1, v3}, LMain;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 228
    const/16 v1, 0x5a

    const-class v3, Ljava/lang/IllegalAccessException;

    invoke-virtual {p0, v8, v4, v1, v3}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 234
    const/16 v1, 0x4a

    const-class v3, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0, v9, v5, v1, v3}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 238
    const/16 v1, 0x46

    const-class v3, Ljava/lang/IllegalAccessException;

    invoke-virtual {p0, v0, v5, v1, v3}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 242
    const/16 v0, 0x5a

    const-class v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0, v9, v5, v0, v1}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 246
    const/16 v0, 0x53

    const-class v1, Ljava/lang/IllegalAccessException;

    invoke-virtual {v2, v8, v5, v0, v1}, LMain;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 248
    const/16 v0, 0x53

    const-class v1, Ljava/lang/IllegalAccessException;

    invoke-virtual {p0, v8, v5, v0, v1}, LSubOther;->getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;

    .line 251
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "done"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 252
    return-void

    .line 149
    :catch_109
    move-exception v0

    .line 150
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public getValue(Ljava/lang/reflect/Field;Ljava/lang/Object;CLjava/lang/Class;)Ljava/lang/Object;
    .registers 11
    .parameter
    .parameter
    .parameter
    .parameter

    .prologue
    .line 261
    const/4 v1, 0x0

    .line 263
    sparse-switch p3, :sswitch_data_fc

    .line 292
    :try_start_4
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "bad type \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_23} :catch_23

    .line 302
    :catch_23
    move-exception v0

    move-object v5, v0

    move-object v0, v1

    move-object v1, v5

    .line 303
    :goto_27
    if-nez p4, :cond_c2

    .line 304
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ERROR: call failed unexpectedly: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 306
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 317
    :cond_48
    :goto_48
    return-object v0

    .line 265
    :sswitch_49
    :try_start_49
    new-instance v0, Ljava/lang/Boolean;

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getBoolean(Ljava/lang/Object;)Z

    move-result v2

    invoke-direct {v0, v2}, Ljava/lang/Boolean;-><init>(Z)V
    :try_end_52
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_52} :catch_23

    .line 296
    :goto_52
    if-eqz p4, :cond_48

    .line 297
    :try_start_54
    new-instance v1, Ljava/lang/Throwable;

    invoke-direct {v1}, Ljava/lang/Throwable;-><init>()V

    .line 298
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ERROR: call succeeded, was expecting "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 300
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_54 .. :try_end_74} :catch_75

    goto :goto_48

    .line 302
    :catch_75
    move-exception v1

    goto :goto_27

    .line 268
    :sswitch_77
    :try_start_77
    new-instance v0, Ljava/lang/Byte;

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getByte(Ljava/lang/Object;)B

    move-result v2

    invoke-direct {v0, v2}, Ljava/lang/Byte;-><init>(B)V

    goto :goto_52

    .line 271
    :sswitch_81
    new-instance v0, Ljava/lang/Short;

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getShort(Ljava/lang/Object;)S

    move-result v2

    invoke-direct {v0, v2}, Ljava/lang/Short;-><init>(S)V

    goto :goto_52

    .line 274
    :sswitch_8b
    new-instance v0, Ljava/lang/Character;

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getChar(Ljava/lang/Object;)C

    move-result v2

    invoke-direct {v0, v2}, Ljava/lang/Character;-><init>(C)V

    goto :goto_52

    .line 277
    :sswitch_95
    new-instance v0, Ljava/lang/Integer;

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    invoke-direct {v0, v2}, Ljava/lang/Integer;-><init>(I)V

    goto :goto_52

    .line 280
    :sswitch_9f
    new-instance v0, Ljava/lang/Long;

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getLong(Ljava/lang/Object;)J

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/lang/Long;-><init>(J)V

    goto :goto_52

    .line 283
    :sswitch_a9
    new-instance v0, Ljava/lang/Float;

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getFloat(Ljava/lang/Object;)F

    move-result v2

    invoke-direct {v0, v2}, Ljava/lang/Float;-><init>(F)V

    goto :goto_52

    .line 286
    :sswitch_b3
    new-instance v0, Ljava/lang/Double;

    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->getDouble(Ljava/lang/Object;)D

    move-result-wide v2

    invoke-direct {v0, v2, v3}, Ljava/lang/Double;-><init>(D)V

    goto :goto_52

    .line 289
    :sswitch_bd
    invoke-virtual {p1, p2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_c0
    .catch Ljava/lang/Exception; {:try_start_77 .. :try_end_c0} :catch_23

    move-result-object v0

    goto :goto_52

    .line 308
    :cond_c2
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p4, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_48

    .line 309
    sget-object v2, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "ERROR: incorrect exception: wanted "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", got "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 312
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_48

    .line 263
    nop

    :sswitch_data_fc
    .sparse-switch
        0x42 -> :sswitch_77
        0x43 -> :sswitch_8b
        0x44 -> :sswitch_b3
        0x46 -> :sswitch_a9
        0x49 -> :sswitch_95
        0x4a -> :sswitch_9f
        0x4c -> :sswitch_bd
        0x53 -> :sswitch_81
        0x5a -> :sswitch_49
    .end sparse-switch
.end method
