package vm2;


import ast.classs.Class.Field;
import util.MultiThreadUtils;

import java.util.ArrayList;
import java.util.List;

public class ClazzLoader {
    VM vm;
    public ClazzLoader(VM vm){
        this.vm = vm;
    }

    public void loadClazz(String clazzName){
        if(vm.clazzArea.isLoaded(clazzName))
        	return ;
        ast.classs.Class clazz = this.getASTClass(clazzName);
        initClazzArea(clazz);
        initMethodArea(clazz);
        initFields(clazz);
    }

    private ast.classs.Class getASTClass(String clazzName){
        MultiThreadUtils.TranslateWorker worker = vm.classMap.get(clazzName);
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
        loadClazz(clazz.superName);
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
		for (Field field : fieldList) {
			String fullFieldName = Util.getFullFieldName(clazzName, field);
			Object newObject = Util.getNewObject(field.type);
			vm.staticFieldsArea.setStaticField(fullFieldName, newObject);
		}
	}

	private void initInstanceFields(String clazzName, List<Field> fieldList) {
		vm.instanceFieldsArea.setInstanceFields(clazzName, fieldList);
	}
}