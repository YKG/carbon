package vm2;


import util.MultiThreadUtils;
import vm.Source;

public class ClazzLoader {
    VM vm;
    public ClazzLoader(VM vm){
        this.vm = vm;
    }

    public void loadClazz(String clazzName){

        if(vm.clazzArea.isLoaded(clazzName)){
            return;
        }

        ast.classs.Class clazz = this.getASTClass(clazzName);
        initClazzArea(clazz);
        initMethodArea(clazz);
        initStaticFields(clazz);
        initInstanceFieldsCopy(clazz);
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
    }

    private void initMethodArea(ast.classs.Class clazz){
        for(ast.method.Method method : clazz.methods)
        {
            String methodFullName = Util.getFullMethodName(method.name, method);

          //  vm.methodArea.setMethod;
        }
    }

    private void initStaticFields(ast.classs.Class clazz){

    }

    private void initInstanceFieldsCopy(ast.classs.Class clazz){

    }
}
