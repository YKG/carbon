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
    }

    public void loadClazz(String clazzName){
        if(vm.clazzArea.isLoaded(clazzName))
        	return ;
        ast.classs.Class clazz = this.getASTClass(clazzName);
        clazz.accept(new Optimize());
        initClazzArea(clazz);
        initFields(clazz);  // field init MUST before method init. Because <clinit>.
        initMethodArea(clazz);
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

    private void initClazzArea(ast.classs.Class clazz){
        List<String> superClazzList = clazz.implementsList;
        superClazzList.add(0, clazz.superName);
        vm.clazzArea.setSuperClazz(clazz.FullyQualifiedName, superClazzList);
        for(String superClazzName : superClazzList){
            loadClazz(clazz.superName);
        }
    }

    private void initMethodArea(ast.classs.Class clazz){
        for(ast.method.Method method : clazz.methods){
            vm.methodArea.setMethod(clazz.FullyQualifiedName, method.getMethodSign(), new Method(method));
        }
    }

    private void initFields(ast.classs.Class clazz) {
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