package ast;

import ast.classs.Class.Field;

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
}
