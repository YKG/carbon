.class public interface abstract annotation Landroid/test/anno/AnnoFancyMethod;
.super Ljava/lang/Object;
.source "AnnoFancyMethod.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Landroid/test/anno/AnnoFancyMethod;
        callMe = false
        enumerated = .enum Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;->FOO:Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;
        someClass = Landroid/test/anno/SomeClass;
    .end subannotation
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;
    }
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract biteMe()Z
.end method

.method public abstract callMe()Z
.end method

.method public abstract enumerated()Landroid/test/anno/AnnoFancyMethod$AnnoFancyMethodEnum;
.end method

.method public abstract someClass()Ljava/lang/Class;
.end method
