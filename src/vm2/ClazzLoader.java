package vm2;


import ast.classs.Class.Field;
import util.MultiThreadUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ClazzLoader {
    private VM vm;
    private Map<String, MultiThreadUtils.TranslateWorker> classMap;

    public ClazzLoader(VM vm, Map<String, MultiThreadUtils.TranslateWorker> classMap){
        this.vm = vm;
        this.classMap = classMap;
        Debug.info(classMap.toString());
    }

    public void loadClazz(String clazzName){
        if(vm.clazzArea.isLoaded(clazzName))
        	return ;
        Debug.info("Loading " + clazzName);
        ast.classs.Class clazz = this.getASTClass(clazzName);
        clazz.accept(new Optimize());
        linkingClazz(clazz);
    }

    private void linkingClazz(ast.classs.Class clazz){
        updateClazzArea(clazz);
        updateFields(clazz);  // field init MUST before method init. Because <clinit>.
        updateMethodArea(clazz);
    }

    private ast.classs.Class getASTClass(String clazzName){
        MultiThreadUtils.TranslateWorker worker = classMap.get(clazzName);
        ast.classs.Class clazz  = null;
        try {
            clazz = worker.call();
        }catch (Exception e){
            e.printStackTrace();
        }
        return clazz;
    }

    private void updateClazzArea(ast.classs.Class clazz){
        List<String> implementsList = clazz.implementsList;
        vm.clazzArea.setSuperClazzAndInterface(clazz.FullyQualifiedName, clazz.superName, implementsList);

        loadClazz(clazz.superName);
        for(String imp : implementsList){
            loadClazz(imp);
        }
    }

    private void updateMethodArea(ast.classs.Class clazz){
        for(ast.method.Method method : clazz.methods){
            vm.methodArea.setMethod(clazz.FullyQualifiedName, method.getMethodSign(), new Method(method));
        }

        if(vm.methodArea.existsMethod(clazz.FullyQualifiedName, "<clinit>()V")){
            vm.clazzArea.setClinit(clazz.FullyQualifiedName); // affects clazzArea !!!
        }
    }

    private void updateFields(ast.classs.Class clazz) {
    	//TODO didn't handle private static
    	List<Field> sFields = new ArrayList<Field>();
    	List<Field> iFields = new ArrayList<Field>();
    	for(Field field : clazz.fieldList) {
            if((field.accessFlag & Const.STATIC) != 0 ) {
                sFields.add(field);
            } else {
                iFields.add(field);
            }
        }
        vm.staticFieldsArea.setStaticFields(clazz.FullyQualifiedName, sFields);
        vm.instanceFieldsArea.setInstanceFields(clazz.FullyQualifiedName, iFields);
    }
}