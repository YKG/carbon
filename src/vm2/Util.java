package vm2;


public class Util {

    public static String getFullMethodName(String className, ast.method.Method method) {
        String fullMethodName = className + "->" + method.name + "(";
        for (String str : method.prototype.argsType)
            fullMethodName = fullMethodName + str;
        fullMethodName = fullMethodName + ")" + method.prototype.returnType;
        return fullMethodName;
    }


    public static String getFullFieldName(ast.classs.FieldItem fieldItem) {
        return fieldItem.classType + "->" + fieldItem.fieldName + ":"
                + fieldItem.fieldType;
    }
}
