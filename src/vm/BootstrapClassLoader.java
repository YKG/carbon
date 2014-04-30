package vm;

import ast.InstructionSourceRecover;
import ast.Optimizer;
import ast.Translator;
import util.MultiThreadUtils;

import java.util.HashMap;
import java.util.Map;

public class BootstrapClassLoader extends VMClassLoader{
    Map<String, MultiThreadUtils.TranslateWorker> clazzMap;
    VM vm;
    InstructionSourceRecover sourceRecover;
    Translator translator;
    Optimizer optimizer;

    public BootstrapClassLoader(Map<String, MultiThreadUtils.TranslateWorker> clazzMap) {
        classes = new HashMap<>();

        this.clazzMap = clazzMap;
        sourceRecover = new InstructionSourceRecover();
        optimizer = new Optimizer();
        translator = new Translator();
    }

    public VMClass loadClass(String className){
        if(classes.containsKey(className))
            return classes.get(className);
        Debug.info("Loading " + className);
        ast.classs.Class clazz = getASTClass(className);
        if (className.equals("Ljava/io/FileDescriptor;")){
            int a = 1;
            a++;
        }
        clazz.accept(sourceRecover);
        clazz.accept(optimizer);
        clazz.accept(translator);

        VMClass klass = (VMClass)translator.result;
        klass.initialLoader = this;
        klass.definingLoader = this;

        if(clazz.superName != null) {
            klass.superClass = VM.resolveClassOrInterface(klass, clazz.superName);
        }

        //TODO : IncompatibleClassChangeError ClassCircularityError

        for(String str : clazz.implementsList) {
            klass.superinterfaces.add(VM.resolveClassOrInterface(klass, str));
        }
        classes.put(className, klass);
        return klass;
    }

    private ast.classs.Class getASTClass(String clazzName){
        MultiThreadUtils.TranslateWorker worker = clazzMap.get(clazzName);
        ast.classs.Class clazz  = null;
        try {
            clazz = worker.call();
        }catch (Exception e){
            e.printStackTrace();
        }
        return clazz;
    }
}