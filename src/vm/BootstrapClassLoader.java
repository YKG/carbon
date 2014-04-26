package vm;

import util.MultiThreadUtils;

import java.util.Map;

public class BootstrapClassLoader extends VMClassLoader{
    Map<String, MultiThreadUtils.TranslateWorker> clazzMap;

    public BootstrapClassLoader(Map<String, MultiThreadUtils.TranslateWorker> clazzMap) {
        this.clazzMap = clazzMap;
    }

    public VMClass loadClass(String className){
        // TODO
        return  null;
    }
}