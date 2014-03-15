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
        vm.clazzArea.setSuperClazz(clazz.FullyQualifiedName,clazz.superName);
        vm.clazzArea.setImplementInterfaces(clazz.FullyQualifiedName,clazz.implementsList);
        loadClazz(clazz.superName); // recursive load all ancestor clazz.
        // recursive load all interface clazz.
        //TODO necessary? Discuss!
        for(String interfaceName : clazz.implementsList){
            loadClazz(interfaceName);
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
    		boolean isStatic = false;
    		for(String str : field.accessList) {
    			if(str.equals("static")) {
    				isStatic = true;
    				sFields.add(field);
    				break;
    			}
    		}
    		if(isStatic == false)
    			iFields.add(field);
    	}
    	initStaticFields(clazz.FullyQualifiedName,sFields);
    	initInstanceFields(clazz.FullyQualifiedName,iFields);
    }
    
	private void initStaticFields(String clazzName, List<Field> fieldList) {
        vm.staticFieldsArea.setStaticFields(clazzName, fieldList);
	}

	private void initInstanceFields(String clazzName, List<Field> fieldList) {
		vm.instanceFieldsArea.setInstanceFields(clazzName, fieldList);
	}
}