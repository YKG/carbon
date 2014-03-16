.class public LMain;
.super Ljava/lang/Object;
.source "Main.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .registers 4
    .parameter

    .prologue
    .line 22
    const/4 v0, 0x1

    .line 24
    packed-switch v0, :pswitch_data_f2

    .line 31
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "???\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 33
    :goto_b
    packed-switch v0, :pswitch_data_102

    .line 36
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "CORRECT (not found)\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 39
    :goto_15
    const v0, 0x12345678

    .line 41
    packed-switch v0, :pswitch_data_10a

    .line 44
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "nuts\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 46
    :goto_22
    sparse-switch v0, :sswitch_data_112

    .line 52
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "huh?\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 54
    :goto_2c
    sparse-switch v0, :sswitch_data_128

    .line 57
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "CORRECT (not found)\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 60
    :goto_36
    const/4 v0, -0x5

    .line 61
    sparse-switch v0, :sswitch_data_132

    .line 65
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "wah?\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 69
    :goto_41
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "CORRECT (default only)\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    .line 71
    return-void

    .line 25
    :pswitch_49
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "neg one\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_b

    .line 26
    :pswitch_51
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "zero\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_b

    .line 27
    :pswitch_59
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "CORRECT (one)\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_b

    .line 28
    :pswitch_61
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "two\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_b

    .line 29
    :pswitch_69
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "three\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_b

    .line 30
    :pswitch_71
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "four\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_b

    .line 34
    :pswitch_79
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "three\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_15

    .line 35
    :pswitch_81
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "four\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_15

    .line 42
    :pswitch_89
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "CORRECT (large)\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_22

    .line 43
    :pswitch_91
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "large+1\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_22

    .line 47
    :sswitch_99
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "fifty-seven!\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_2c

    .line 48
    :sswitch_a1
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "neg six!\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto :goto_2c

    .line 49
    :sswitch_a9
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "CORRECT (large)\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_2c

    .line 50
    :sswitch_b2
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "twenty-two!\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_2c

    .line 51
    :sswitch_bb
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "three!\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_2c

    .line 55
    :sswitch_c4
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "neg six!\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_36

    .line 56
    :sswitch_cd
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "three!\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_36

    .line 62
    :sswitch_d6
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "twelve\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_41

    .line 63
    :sswitch_df
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "CORRECT (not found)\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_41

    .line 64
    :sswitch_e8
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "zero\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->print(Ljava/lang/String;)V

    goto/16 :goto_41

    .line 24
    nop

    :pswitch_data_f2
    .packed-switch -0x1
        :pswitch_49
        :pswitch_51
        :pswitch_59
        :pswitch_61
        :pswitch_69
        :pswitch_71
    .end packed-switch

    .line 33
    :pswitch_data_102
    .packed-switch 0x3
        :pswitch_79
        :pswitch_81
    .end packed-switch

    .line 41
    :pswitch_data_10a
    .packed-switch 0x12345678
        :pswitch_89
        :pswitch_91
    .end packed-switch

    .line 46
    :sswitch_data_112
    .sparse-switch
        -0x6 -> :sswitch_a1
        0x3 -> :sswitch_bb
        0x16 -> :sswitch_b2
        0x39 -> :sswitch_99
        0x12345678 -> :sswitch_a9
    .end sparse-switch

    .line 54
    :sswitch_data_128
    .sparse-switch
        -0x6 -> :sswitch_c4
        0x3 -> :sswitch_cd
    .end sparse-switch

    .line 61
    :sswitch_data_132
    .sparse-switch
        -0x5 -> :sswitch_df
        0x0 -> :sswitch_e8
        0xc -> :sswitch_d6
    .end sparse-switch
.end method
