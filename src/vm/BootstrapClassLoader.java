package vm;

import ast.Translator;
import util.MultiThreadUtils;

import java.util.Map;

public class BootstrapClassLoader extends VMClassLoader{
    Map<String, MultiThreadUtils.TranslateWorker> clazzMap;
    VM vm;
    Translator translator;

    public BootstrapClassLoader(Map<String, MultiThreadUtils.TranslateWorker> clazzMap) {
        this.clazzMap = clazzMap;
        translator = new Translator();
    }

    public VMClass loadClass(String className){
        if(classes.containsKey(className))
            return classes.get(className);
        Debug.info("Loading " + className);
        ast.classs.Class clazz = getASTClass(className);
        clazz.accept(translator);
        return (VMClass)translator.result;
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