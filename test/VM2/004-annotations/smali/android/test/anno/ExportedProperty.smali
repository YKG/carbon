.class public interface abstract annotation Landroid/test/anno/ExportedProperty;
.super Ljava/lang/Object;
.source "ExportedProperty.java"

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation system Ldalvik/annotation/AnnotationDefault;
    value = .subannotation Landroid/test/anno/ExportedProperty;
        mapping = {
            .subannotation Landroid/test/anno/IntToString;
                from = -0x1
                to = "-1"
            .end subannotation
        }
        resolveId = false
    .end subannotation
.end annotation

.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->FIELD:Ljava/lang/annotation/ElementType;,
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract mapping()[Landroid/test/anno/IntToString;
.end method

.method public abstract resolveId()Z
.end method
