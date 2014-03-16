.class public LFancyLoader;
.super Ljava/lang/ClassLoader;
.source "FancyLoader.java"


# static fields
.field static final CLASS_PATH:Ljava/lang/String; = "classes-ex/"

.field static final DEX_FILE:Ljava/lang/String; = "test-ex.jar"


# instance fields
.field private mDexClass:Ljava/lang/Class;


# direct methods
.method public constructor <init>(Ljava/lang/ClassLoader;)V
    .registers 3
    .parameter

    .prologue
    .line 37
    invoke-direct {p0, p1}, Ljava/lang/ClassLoader;-><init>(Ljava/lang/ClassLoader;)V

    .line 40
    :try_start_3
    const-string v0, "dalvik/system/DexFile"

    invoke-virtual {p1, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    iput-object v0, p0, LFancyLoader;->mDexClass:Ljava/lang/Class;
    :try_end_b
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_b} :catch_c

    .line 44
    :goto_b
    return-void

    .line 41
    :catch_c
    move-exception v0

    goto :goto_b
.end method

.method private findClassDalvik(Ljava/lang/String;)Ljava/lang/Class;
    .registers 8
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 74
    :try_start_0
    iget-object v0, p0, LFancyLoader;->mDexClass:Ljava/lang/Class;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Ljava/lang/String;

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;
    :try_end_d
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_d} :catch_3d

    move-result-object v0

    .line 80
    const/4 v1, 0x1

    :try_start_f
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "test-ex.jar"

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_19
    .catch Ljava/lang/InstantiationException; {:try_start_f .. :try_end_19} :catch_46
    .catch Ljava/lang/IllegalAccessException; {:try_start_f .. :try_end_19} :catch_4f
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_f .. :try_end_19} :catch_58

    move-result-object v0

    .line 95
    :try_start_1a
    iget-object v1, p0, LFancyLoader;->mDexClass:Ljava/lang/Class;

    const-string v2, "loadClass"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Class;

    const/4 v4, 0x0

    const-class v5, Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    const-class v5, Ljava/lang/ClassLoader;

    aput-object v5, v3, v4

    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    :try_end_2e
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1a .. :try_end_2e} :catch_61

    move-result-object v1

    .line 102
    const/4 v2, 0x2

    :try_start_30
    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p0, v2, v3

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_3b
    .catch Ljava/lang/IllegalAccessException; {:try_start_30 .. :try_end_3b} :catch_6a
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_30 .. :try_end_3b} :catch_73

    .line 110
    const/4 v0, 0x0

    return-object v0

    .line 75
    :catch_3d
    move-exception v0

    .line 76
    new-instance v1, Ljava/lang/ClassNotFoundException;

    const-string v2, "getConstructor failed"

    invoke-direct {v1, v2, v0}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 81
    :catch_46
    move-exception v0

    .line 82
    new-instance v1, Ljava/lang/ClassNotFoundException;

    const-string v2, "newInstance failed"

    invoke-direct {v1, v2, v0}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 83
    :catch_4f
    move-exception v0

    .line 84
    new-instance v1, Ljava/lang/ClassNotFoundException;

    const-string v2, "newInstance failed"

    invoke-direct {v1, v2, v0}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 85
    :catch_58
    move-exception v0

    .line 86
    new-instance v1, Ljava/lang/ClassNotFoundException;

    const-string v2, "newInstance failed"

    invoke-direct {v1, v2, v0}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 97
    :catch_61
    move-exception v0

    .line 98
    new-instance v1, Ljava/lang/ClassNotFoundException;

    const-string v2, "getMethod failed"

    invoke-direct {v1, v2, v0}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 103
    :catch_6a
    move-exception v0

    .line 104
    new-instance v1, Ljava/lang/ClassNotFoundException;

    const-string v2, "loadClass failed"

    invoke-direct {v1, v2, v0}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 105
    :catch_73
    move-exception v0

    .line 106
    new-instance v1, Ljava/lang/ClassNotFoundException;

    const-string v2, "loadClass failed"

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private findClassNonDalvik(Ljava/lang/String;)Ljava/lang/Class;
    .registers 7
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "classes-ex/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".class"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 122
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 126
    :try_start_1e
    new-instance v2, Ljava/io/RandomAccessFile;

    const-string v3, "r"

    invoke-direct {v2, v1, v3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_25
    .catch Ljava/io/FileNotFoundException; {:try_start_1e .. :try_end_25} :catch_39

    .line 134
    :try_start_25
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v3

    long-to-int v1, v3

    new-array v1, v1, [B

    .line 135
    invoke-virtual {v2, v1}, Ljava/io/RandomAccessFile;->readFully([B)V
    :try_end_2f
    .catchall {:try_start_25 .. :try_end_2f} :catchall_6d
    .catch Ljava/io/IOException; {:try_start_25 .. :try_end_2f} :catch_53

    .line 140
    :try_start_2f
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V
    :try_end_32
    .catch Ljava/io/IOException; {:try_start_2f .. :try_end_32} :catch_7b

    .line 149
    :goto_32
    const/4 v0, 0x0

    :try_start_33
    array-length v2, v1

    invoke-virtual {p0, p1, v1, v0, v2}, LFancyLoader;->defineClass(Ljava/lang/String;[BII)Ljava/lang/Class;
    :try_end_37
    .catch Ljava/lang/Throwable; {:try_start_33 .. :try_end_37} :catch_72

    move-result-object v0

    return-object v0

    .line 127
    :catch_39
    move-exception v1

    .line 128
    new-instance v1, Ljava/lang/ClassNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Not found: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 136
    :catch_53
    move-exception v1

    .line 137
    :try_start_54
    new-instance v1, Ljava/lang/ClassNotFoundException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Read error: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_6d
    .catchall {:try_start_54 .. :try_end_6d} :catchall_6d

    .line 139
    :catchall_6d
    move-exception v0

    .line 140
    :try_start_6e
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->close()V
    :try_end_71
    .catch Ljava/io/IOException; {:try_start_6e .. :try_end_71} :catch_7d

    .line 143
    :goto_71
    throw v0

    .line 150
    :catch_72
    move-exception v0

    .line 151
    new-instance v1, Ljava/lang/ClassNotFoundException;

    const-string v2, "defineClass failed"

    invoke-direct {v1, v2, v0}, Ljava/lang/ClassNotFoundException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 141
    :catch_7b
    move-exception v0

    goto :goto_32

    :catch_7d
    move-exception v1

    goto :goto_71
.end method


# virtual methods
.method protected findClass(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, LFancyLoader;->mDexClass:Ljava/lang/Class;

    if-eqz v0, :cond_9

    .line 55
    invoke-direct {p0, p1}, LFancyLoader;->findClassDalvik(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 57
    :goto_8
    return-object v0

    :cond_9
    invoke-direct {p0, p1}, LFancyLoader;->findClassNonDalvik(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_8
.end method

.method protected loadClass(Ljava/lang/String;Z)Ljava/lang/Class;
    .registers 7
    .parameter
    .parameter
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/lang/Class",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 176
    invoke-virtual {p0, p1}, LFancyLoader;->findLoadedClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 177
    if-eqz v0, :cond_2a

    .line 178
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "MyClassLoader.loadClass: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " already loaded"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 180
    if-eqz p2, :cond_29

    .line 181
    invoke-virtual {p0, v0}, LFancyLoader;->resolveClass(Ljava/lang/Class;)V

    .line 207
    :cond_29
    :goto_29
    return-object v0

    .line 189
    :cond_2a
    :try_start_2a
    invoke-virtual {p0, p1}, LFancyLoader;->findClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    .line 190
    if-eqz p2, :cond_33

    .line 191
    invoke-virtual {p0, v0}, LFancyLoader;->resolveClass(Ljava/lang/Class;)V
    :try_end_33
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2a .. :try_end_33} :catch_38

    .line 206
    :cond_33
    :goto_33
    invoke-super {p0, p1, p2}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;Z)Ljava/lang/Class;

    move-result-object v0

    goto :goto_29

    .line 193
    :catch_38
    move-exception v0

    goto :goto_33
.end method
