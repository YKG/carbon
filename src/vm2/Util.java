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
    
	public static int hex2int(String s) {
		if (s.startsWith("-"))
			return -(Integer.parseInt(s.substring(3), 16));
		else
			return Integer.parseInt(s.substring(2), 16);
	}

	public static long hex2long(String s) {
		if (s.startsWith("-"))
			return -(Long.parseLong(s.substring(3), 16));
		else
			return Long.parseLong(s.substring(2), 16);
	}
}
