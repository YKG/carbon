package vm2;

import java.util.ArrayList;
import java.util.List;


public class Util {

	public static String getFullMethodName(String className,
			ast.method.Method method) {
		String fullMethodName = className + "->" + method.name + "(";
		for (String str : method.prototype.argsType)
			fullMethodName = fullMethodName + str;
		fullMethodName = fullMethodName + ")" + method.prototype.returnType;
		return fullMethodName;
	}
	
	public static String getFullMethodName(ast.classs.MethodItem methodItem) {
		String fullMethodName = methodItem.classType + "->"
				+ methodItem.methodName + "(";
		for (String str : methodItem.prototype.argsType)
			fullMethodName = fullMethodName + str;
		fullMethodName = fullMethodName + ")" + methodItem.prototype.returnType;
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
	public static List<String> getRegList(String regStart,String regEnd) {
		int indexStart = Integer.parseInt(regStart);
		int indexEnd = Integer.parseInt(regEnd);
		List<String> regList =  new ArrayList<String>();
		for(int i=indexStart;i<=indexEnd - indexStart;i++) {
			regList.add(String.valueOf(i));
		}
		return regList;
	}
	public static void printErr(Object obj) {
		System.err.println(obj);
		System.exit(-1);
	}
}
