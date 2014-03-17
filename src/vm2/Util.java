package vm2;

import ast.classs.Class.Field;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Util {
	public static String getFullFieldName(String clazzName, Field field) {
		return clazzName + "->" + field.name + ":" + field.type;
	}

	public static int hex2int(String s) {
		if (s.startsWith("-"))
			return -(Integer.parseInt(s.substring(3), 16));
		else
			return Integer.parseInt(s.substring(2), 16);
	}

	public static long hex2long(String str) {
        assert str.endsWith("L");
        String s = str.substring(0, str.indexOf("L"));
		if (s.startsWith("-"))
			return -(Long.parseLong(s.substring(3), 16));
		else
			return Long.parseLong(s.substring(2), 16);
	}

	public static void printErr(Object obj) {
		System.err.println(obj);
		System.exit(-1);
	}

	public static Object getNewObject(String type) {
		Object newObject = null;
		switch (type.substring(0, 1)) {
		//			case "V" : break;
		case "Z":
			newObject = false;
			break;
		case "B":
		case "S":
		case "C":
		case "I":
		case "J":
		case "F":
		case "D":
			newObject = 0;
			break;
		case "L":
			newObject = null;
			break;
		case "[":
			newObject = null;
			break;
		}
		return newObject;
	}
	
	public static void updatefieldMap(Map<String,Object> fieldMap, List<Field> fieldList) {
		for(Field field : fieldList) {
			fieldMap.put(field.name, getNewObject(field.type));
		}
	}


    //TODO ---------------------------------------------------------------------------------
    public static Class[] getParaClazzs(String argsType) {
        String[] tmp = argsType.split(";");
        List<Class> paras  = new ArrayList<Class>();
        for(String str : tmp) {
            for(int i = 0; i < str.length(); i++) {
                switch(str.charAt(i)) {
                    case 'Z':
                        paras.add(Boolean.TYPE);
                        break;
                    case 'B':
                        paras.add(byte.class);
                        break;
                    case 'S':
                        paras.add(short.class);
                        break;
                    case 'C':
                        paras.add(char.class);
                        break;
                    case 'I':
                        paras.add(int.class);
                        break;
                    case 'J':
                        paras.add(long.class);
                        break;
                    case 'F':
                        paras.add(float.class);
                        break;
                    case 'D':
                        paras.add(double.class);
                        break;
                    default : break;
                }
                if(str.charAt(i) == 'L') {
                    String formatClassName = getFormatClassName(str.substring(i)+";");
                    try {
                        paras.add(Class.forName(formatClassName));
                    } catch (ClassNotFoundException e) {
                        e.printStackTrace();
                    }
                    break;
                }
            }
        }
        Class[] result = new Class[paras.size()];
        for(int i = 0; i < paras.size(); i++)
            result[i] = paras.get(i);
        return result;
    }

    // TODO handle Class class
    public static vm2.Method getSystemMethod(String clazzName, String methodSign) {
        int start = methodSign.indexOf("(");
        int end = methodSign.indexOf(")");
        Class[] paraClazzs =getParaClazzs(methodSign.substring(start+1,end));
        String methodName = methodSign.substring(0,start);
        Method systemMethod = null;
        String formatClazzName = Util.getFormatClassName(clazzName);
        if(methodName.equals("<init>")) {
            try {
                systemMethod = new Method(Class.forName(formatClazzName).getConstructor(paraClazzs));
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        } else {
            try {
                systemMethod = new Method(Class.forName(formatClazzName).getMethod(methodName,paraClazzs));
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return systemMethod;
    }

    /*
 * in : Ljava/lang/String;
 * out : java.lang.String
 */
    public static String getFormatClassName(String className) {
        return className.substring(1,className.length()-1).replace('/', '.');
    }

    public static Object invokeSystemMethod(java.lang.reflect.Method systemMethod, Object[] paras) {
        Object returnValue = null;
        Object[] newParas;
        if(systemMethod.getParameterTypes().length == paras.length) {
         // static method
            newParas = modifyParas(systemMethod.getParameterTypes(), paras);
            try {
                returnValue = systemMethod.invoke(null, newParas);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        } else {
            Object[] subParas = new Object[paras.length -1 ];
            for(int i = 1; i< paras.length; i++) {
                subParas[i-1] = paras[i];
            }
            newParas = modifyParas(systemMethod.getParameterTypes(),subParas);
            Object ref = paras[0];
            if(ref instanceof Instance)
                ref = ((Instance)ref).systemInstance;
            try {
                returnValue = systemMethod.invoke(ref, newParas);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        }
        return returnValue;
    }


    public static void invokeConstructor(Constructor constructor, Object[] paras) {
        Object[] subParas = new Object[paras.length -1 ];
        Object newInstance = null;
        Object[] newparas;
        for(int i = 1; i< paras.length; i++) {
            subParas[i-1] = paras[i];
        }
        try {
            newparas =  modifyParas(constructor.getParameterTypes(),subParas);
            ((Instance)paras[0]).systemInstance =constructor.newInstance(newparas);
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }



    public static Object[] modifyParas(Class[] type, Object[] paras) {
        Object[] result = new Object[paras.length];
        for(int i = 0; i < type.length; i++) {
            if(type[i] == byte.class)
                result[i] = (byte)((Integer)paras[i]).intValue();
            else if(type[i] == char.class)
                result[i] = (char)((Integer)paras[i]).intValue();
            else if(type[i] == short.class)
                result[i] = (short)((Integer)paras[i]).intValue();
            else if(type[i] == float.class)
                result[i] = ((Integer)paras[i]).floatValue();
            else if(type[i] == long.class)
                result[i] = ((Double)paras[i]).longValue();
            else result[i] = paras[i];
        }
        return result;
    }

    public static String getFullQualifiedName(String formatName) {
        return "L" + formatName.replace('.','/') + ";" ;
    }
    //TODO ---------------------------------------------------------------------------------

}
