/*
 * [The "BSD licence"]
 * Copyright (c) 2010 Ben Gruver
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

tree grammar TranslateWalker;

options {
  tokenVocab=smaliParser;
  ASTLabelType=CommonTree;
}

@header {
package antlr3;

import org.jf.smali.LiteralTools;
}

smali_file returns [ast.classs.Class clazz]
  : ^(I_CLASS_DEF header methods fields annotations)
  
  {
  	  $clazz = new ast.classs.Class();
  	  $clazz.FullyQualifiedName = $header.className;
  	  $clazz.superName = $header.superName;
  	  $clazz.source = $header.source;
  	  $clazz.accessList = $header.accessList;
  	  $clazz.methods = $methods.methodList;
  	  
      System.out.println("in smali_file");
  }
  ;


header returns [String className, String superName, String source, List<String> accessList, List<String> implementsList]
@init{
	$superName = "Ljava/lang/Object;";
}
  : class_spec super_spec? implements_list source_spec 
  {
  	$className = $class_spec.className; 
  	$accessList =  $class_spec.accessList;
  	$superName = $super_spec.className;
  	$source = $source_spec.source;
  }
  ;


class_spec returns [String className, List<String> accessList]
  : class_type_descriptor access_list
  {
  	$className = $class_type_descriptor.className;
  	$accessList = $access_list.accessList;
  };

super_spec returns [String className]
  : ^(I_SUPER class_type_descriptor)
  {
  	$className = $class_type_descriptor.className;
  };


implements_spec returns [List<String> implementsList]
@init {
 $implementsList = new ArrayList<String>();
}
  : ^(I_IMPLEMENTS class_type_descriptor)
  {
  	$implementsList.add($class_type_descriptor.className);
  };

implements_list
  : (implements_spec {} )*
  {
  };

source_spec returns [String source]
  :
    ^(I_SOURCE string_literal { $source = $string_literal.value; })
  | /*epsilon*/;



access_list returns [List<String> accessList]
@init{
	$accessList = new ArrayList<String>();
}
  : ^(I_ACCESS_LIST
      (
        ACCESS_SPEC
        {
        	$accessList.add($ACCESS_SPEC.text);
        }
      )*);


fields
  : ^(I_FIELDS
      (field
      {
      })*);

methods returns [List<ast.method.Method> methodList]
@init{
	$methodList = new ArrayList<ast.method.Method>(); 
}
  : ^(I_METHODS
      (method
      {
      	$methodList.add($method.method);
      })*);

field
  :^(I_FIELD SIMPLE_NAME access_list ^(I_FIELD_TYPE nonvoid_type_descriptor) field_initial_value annotations?)
  {
  };


field_initial_value
  : ^(I_FIELD_INITIAL_VALUE literal) {}
  | /*epsilon*/;

literal
  : integer_literal {}
  | long_literal {}
  | short_literal {}
  | byte_literal {}
  | float_literal {}
  | double_literal {}
  | char_literal {}
  | string_literal {}
  | bool_literal {}
  | NULL_LITERAL {}
  | type_descriptor {}
  | array_literal {}
  | subannotation {}
  | field_literal {}
  | method_literal {}
  | enum_literal {};


//everything but string
fixed_size_literal
  : integer_literal {}
  | long_literal {}
  | short_literal {}
  | byte_literal {}
  | float_literal {}
  | double_literal {}
  | char_literal {}
  | bool_literal {};

//everything but string
fixed_64bit_literal
  : integer_literal {}
  | long_literal {}
  | short_literal {}
  | byte_literal {}
  | float_literal {}
  | double_literal {}
  | char_literal {}
  | bool_literal {};

//everything but string and double
//long is allowed, but it must fit into an int
fixed_32bit_literal
  : integer_literal {}
  | long_literal {}
  | short_literal {}
  | byte_literal {}
  | float_literal {}
  | char_literal {}
  | bool_literal {};

array_elements
  : {}
    ^(I_ARRAY_ELEMENTS
      (fixed_size_literal
      {
      })*);

packed_switch_target_count
  : I_PACKED_SWITCH_TARGET_COUNT {};

packed_switch_targets
  :
    ^(I_PACKED_SWITCH_TARGETS
      packed_switch_target_count
      {
      }

      (offset_or_label
      {
      })*
    );

sparse_switch_target_count
  : I_SPARSE_SWITCH_TARGET_COUNT {};

sparse_switch_keys
  : ^(I_SPARSE_SWITCH_KEYS
      (fixed_32bit_literal
      {
      })*
    );


sparse_switch_targets
  : ^(I_SPARSE_SWITCH_TARGETS
      (offset_or_label
      {
      })*
    );

method returns [ast.method.Method method]
@init{
	$method = new ast.method.Method(); /* Be careful! It's better to move it here. YKG. */
}
  : ^(I_METHOD
      method_name_and_prototype
      access_list
      {
      	$method.accessList = $access_list.accessList;
      }
      (registers_directive
       {
       	$method.registers_directive = $registers_directive.type;
       	$method.registers_directive_count = $registers_directive.count;
       }
      )?
      labels
      packed_switch_declarations
      sparse_switch_declarations
      statements
      catches
      parameters
      ordered_debug_directives
      annotations
    )
  {
  	
  	$method.name = $method_name_and_prototype.method_name;
  	$method.prototype = $method_name_and_prototype.prototype;
  	
  	$method.statements = $statements.stmts;
  };

method_prototype returns [ast.method.Method.MethodPrototype prototype]
  : ^(I_METHOD_PROTOTYPE ^(I_METHOD_RETURN_TYPE type_descriptor) field_type_list)
  {
  	$prototype = new ast.method.Method.MethodPrototype();
	$prototype.returnType = $type_descriptor.type_desc;
	$prototype.argsType = $field_type_list.argsTypeList;
  };

method_name_and_prototype returns [String method_name, ast.method.Method.MethodPrototype prototype]
  : SIMPLE_NAME method_prototype
  {
  	$method_name = $SIMPLE_NAME.text;
  	$prototype = $method_prototype.prototype;
  };

field_type_list returns [List<String> argsTypeList]
@init{
	$argsTypeList = new ArrayList<String>();
}
  : (
      nonvoid_type_descriptor
      {
		$argsTypeList.add($nonvoid_type_descriptor.type_desc);
      }
    )*;


fully_qualified_method returns [ast.classs.MethodItem methodItem]
@init{
	$methodItem = new ast.classs.MethodItem();
}
  : reference_type_descriptor SIMPLE_NAME method_prototype
  {
  	$methodItem.classType = $reference_type_descriptor.ref_desc;
  	$methodItem.methodName = $SIMPLE_NAME.text;
  	$methodItem.prototype = $method_prototype.prototype;
  };

fully_qualified_field returns [ast.classs.FieldItem fieldItem]
@init{
	$fieldItem = new ast.classs.FieldItem();
}
  : reference_type_descriptor SIMPLE_NAME nonvoid_type_descriptor
  {
  	$fieldItem.classType = $reference_type_descriptor.ref_desc;
  	$fieldItem.fieldName = $SIMPLE_NAME.text;
  	$fieldItem.fieldType = $nonvoid_type_descriptor.type_desc;
  };

registers_directive returns [String type, int count]
  : {}
    ^(( I_REGISTERS { $type = ".registers"; }
      | I_LOCALS { $type = ".locals"; }
      )
      short_integral_literal { $count = $short_integral_literal.value; }
     );

labels
  : ^(I_LABELS label_def*);

label_def
  : ^(I_LABEL SIMPLE_NAME address)
    {
    };

packed_switch_declarations
  : ^(I_PACKED_SWITCH_DECLARATIONS packed_switch_declaration*);

packed_switch_declaration
  : ^(I_PACKED_SWITCH_DECLARATION address offset_or_label_absolute)
    {
    };

sparse_switch_declarations
  : ^(I_SPARSE_SWITCH_DECLARATIONS sparse_switch_declaration*);

sparse_switch_declaration
  : ^(I_SPARSE_SWITCH_DECLARATION address offset_or_label_absolute)
    {
    };

catches : ^(I_CATCHES catch_directive* catchall_directive*);

catch_directive
  : ^(I_CATCH address nonvoid_type_descriptor from=offset_or_label_absolute to=offset_or_label_absolute using=offset_or_label_absolute)
    {
    };

catchall_directive
  : ^(I_CATCHALL address from=offset_or_label_absolute to=offset_or_label_absolute using=offset_or_label_absolute)
    {
    };

address
  : I_ADDRESS
    {
    };

parameters
  : ^(I_PARAMETERS (parameter
        {
        })*
    )
  ;

parameter
  : ^(I_PARAMETER (string_literal {}
                  | {}
                  )
        annotations {}
    );

ordered_debug_directives
  : ^(I_ORDERED_DEBUG_DIRECTIVES
       ( line
       | local
       | end_local
       | restart_local
       | prologue
       | epilogue
       | source
       )*
     );

line
  : ^(I_LINE integral_literal address)
    {
    };

local
  : ^(I_LOCAL REGISTER SIMPLE_NAME nonvoid_type_descriptor string_literal? address)
    {
    };

end_local
  : ^(I_END_LOCAL REGISTER address)
    {
    };

restart_local
  : ^(I_RESTART_LOCAL REGISTER address)
    {
    };

prologue
  : ^(I_PROLOGUE address)
    {
    };

epilogue
  : ^(I_EPILOGUE address)
    {
    };

source
  : ^(I_SOURCE string_literal address)
    {
    };

statements returns [List<ast.stm.T> stmts]
@init{
	$stmts = new ArrayList<ast.stm.T>();
}
  : ^(I_STATEMENTS (instruction
        {
        	$stmts.add($instruction.stmt);
        })*);

label_ref
  : SIMPLE_NAME
    {
    };

offset
  : OFFSET
    {
    };

offset_or_label_absolute
  : offset {}
  | label_ref {};

offset_or_label
  : offset {}
  | label_ref {};


register_list returns [ArrayList<String> regList]
@init{
	$regList = new ArrayList<String>();
}
  : ^(I_REGISTER_LIST
      (REGISTER
      {
    	$regList.add($REGISTER.text);  	
      })*);

register_range
  : ^(I_REGISTER_RANGE (startReg=REGISTER endReg=REGISTER?)?)
    {
    }
  ;

verification_error_reference
  : CLASS_DESCRIPTOR
  {
  }
/*
  | fully_qualified_field
  {
  }
  */
  | fully_qualified_method
  {
  };

verification_error_type
  : VERIFICATION_ERROR_TYPE
  {
  };

instruction returns [ast.stm.T stmt]
  : insn_format10t {}
  | insn_format10x {$stmt = $insn_format10x.instruction;}
  | insn_format11n {}
  | insn_format11x {}
  | insn_format12x {}
  | insn_format20bc {}
  | insn_format20t {}
  | insn_format21c_field {$stmt = $insn_format21c_field.instruction;}
  | insn_format21c_string {$stmt = $insn_format21c_string.instruction;}
  | insn_format21c_type {}
  | insn_format21h {}
  | insn_format21s {}
  | insn_format21t {}
  | insn_format22b {}
  | insn_format22c_field {}
  | insn_format22c_type {}
  | insn_format22s {}
  | insn_format22t {}
  | insn_format22x {}
  | insn_format23x {}
  | insn_format30t {}
  | insn_format31c {}
  | insn_format31i {}
  | insn_format31t {}
  | insn_format32x {}
  | insn_format35c_method { $stmt = $insn_format35c_method.instruction;}
  | insn_format35c_type {}
  | insn_format3rc_method {}
  | insn_format3rc_type {}
  | insn_format41c_type {}
  | insn_format41c_field {}
  | insn_format51l_type {}
  | insn_format52c_type {}
  | insn_format52c_field {}
  | insn_format5rc_method {}
  | insn_format5rc_type {}
  | insn_array_data_directive {}
  | insn_packed_switch_directive {}
  | insn_sparse_switch_directive {};


insn_format10t
  : //e.g. goto endloop:
    {}
    ^(I_STATEMENT_FORMAT10t INSTRUCTION_FORMAT10t offset_or_label)
    {
    };

insn_format10x returns [ast.stm.Instruction.F10x instruction]
@init{
	$instruction = new ast.stm.Instruction.F10x();
}
  : //e.g. return
    ^(I_STATEMENT_FORMAT10x INSTRUCTION_FORMAT10x)
    {
    	$instruction.name = $INSTRUCTION_FORMAT10x.text;
    };

insn_format11n
  : //e.g. const/4 v0, 5
    ^(I_STATEMENT_FORMAT11n INSTRUCTION_FORMAT11n REGISTER short_integral_literal)
    {
    };

insn_format11x
  : //e.g. move-result-object v1
    ^(I_STATEMENT_FORMAT11x INSTRUCTION_FORMAT11x REGISTER)
    {
    };

insn_format12x
  : //e.g. move v1 v2
    ^(I_STATEMENT_FORMAT12x INSTRUCTION_FORMAT12x registerA=REGISTER registerB=REGISTER)
    {
    };

insn_format20bc
  : //e.g. throw-verification-error generic-error, Lsome/class;
    ^(I_STATEMENT_FORMAT20bc INSTRUCTION_FORMAT20bc verification_error_type verification_error_reference)
    {
    };

insn_format20t
  : //e.g. goto/16 endloop:
    ^(I_STATEMENT_FORMAT20t INSTRUCTION_FORMAT20t offset_or_label)
    {
    };

insn_format21c_field returns [ast.stm.Instruction.F21c_field instruction]
@init{
	$instruction = new ast.stm.Instruction.F21c_field();
}
  : //e.g. sget_object v0, java/lang/System/out LJava/io/PrintStream;
    ^(I_STATEMENT_FORMAT21c_FIELD inst=(INSTRUCTION_FORMAT21c_FIELD | INSTRUCTION_FORMAT21c_FIELD_ODEX) REGISTER fully_qualified_field)
    {
    	$instruction.name = $inst.text;
    	$instruction.reg = $REGISTER.text;
    	$instruction.fieldItem = $fully_qualified_field.fieldItem;
    };

insn_format21c_string returns [ast.stm.Instruction.F21c_string instruction]
@init{
	$instruction = new ast.stm.Instruction.F21c_string();
}
  : //e.g. const-string v1, "Hello World!"
    ^(I_STATEMENT_FORMAT21c_STRING INSTRUCTION_FORMAT21c_STRING REGISTER string_literal)
    {
    	$instruction.name = $INSTRUCTION_FORMAT21c_STRING.text;
    	$instruction.reg = $REGISTER.text;
    	$instruction.str = $string_literal.value;
    };

insn_format21c_type
  : //e.g. const-class v2, org/jf/HelloWorld2/HelloWorld2
    ^(I_STATEMENT_FORMAT21c_TYPE INSTRUCTION_FORMAT21c_TYPE REGISTER reference_type_descriptor)
    {
    };

insn_format21h
  : //e.g. const/high16 v1, 1234
    ^(I_STATEMENT_FORMAT21h INSTRUCTION_FORMAT21h REGISTER short_integral_literal)
    {
    };

insn_format21s
  : //e.g. const/16 v1, 1234
    ^(I_STATEMENT_FORMAT21s INSTRUCTION_FORMAT21s REGISTER short_integral_literal)
    {
    };

insn_format21t
  : //e.g. if-eqz v0, endloop:
    ^(I_STATEMENT_FORMAT21t INSTRUCTION_FORMAT21t REGISTER offset_or_label)
    {
    };

insn_format22b
  : //e.g. add-int v0, v1, 123
    ^(I_STATEMENT_FORMAT22b INSTRUCTION_FORMAT22b registerA=REGISTER registerB=REGISTER short_integral_literal)
    {
    };

insn_format22c_field
  : //e.g. iput-object v1, v0, org/jf/HelloWorld2/HelloWorld2.helloWorld Ljava/lang/String;
    ^(I_STATEMENT_FORMAT22c_FIELD inst=(INSTRUCTION_FORMAT22c_FIELD | INSTRUCTION_FORMAT22c_FIELD_ODEX) registerA=REGISTER registerB=REGISTER fully_qualified_field)
    {
    };

insn_format22c_type
  : //e.g. instance-of v0, v1, Ljava/lang/String;
    ^(I_STATEMENT_FORMAT22c_TYPE INSTRUCTION_FORMAT22c_TYPE registerA=REGISTER registerB=REGISTER nonvoid_type_descriptor)
    {
    };

insn_format22s
  : //e.g. add-int/lit16 v0, v1, 12345
    ^(I_STATEMENT_FORMAT22s INSTRUCTION_FORMAT22s registerA=REGISTER registerB=REGISTER short_integral_literal)
    {
    };

insn_format22t
  : //e.g. if-eq v0, v1, endloop:
    ^(I_STATEMENT_FORMAT22t INSTRUCTION_FORMAT22t registerA=REGISTER registerB=REGISTER offset_or_label)
    {
    };

insn_format22x
  : //e.g. move/from16 v1, v1234
    ^(I_STATEMENT_FORMAT22x INSTRUCTION_FORMAT22x registerA=REGISTER registerB=REGISTER)
    {
    };

insn_format23x
  : //e.g. add-int v1, v2, v3
    ^(I_STATEMENT_FORMAT23x INSTRUCTION_FORMAT23x registerA=REGISTER registerB=REGISTER registerC=REGISTER)
    {
    };

insn_format30t
  : //e.g. goto/32 endloop:
    ^(I_STATEMENT_FORMAT30t INSTRUCTION_FORMAT30t offset_or_label)
    {
    };

insn_format31c
  : //e.g. const-string/jumbo v1 "Hello World!"
    ^(I_STATEMENT_FORMAT31c INSTRUCTION_FORMAT31c REGISTER string_literal)
    {
    };

insn_format31i
  : //e.g. const v0, 123456
    ^(I_STATEMENT_FORMAT31i INSTRUCTION_FORMAT31i REGISTER fixed_32bit_literal)
    {
    };

insn_format31t
  : //e.g. fill-array-data v0, ArrayData:
    ^(I_STATEMENT_FORMAT31t INSTRUCTION_FORMAT31t REGISTER offset_or_label)
    {
    };

insn_format32x
  : //e.g. move/16 v5678, v1234
    ^(I_STATEMENT_FORMAT32x INSTRUCTION_FORMAT32x registerA=REGISTER registerB=REGISTER)
    {
    };

insn_format35c_method returns [ast.stm.Instruction.F35c_method instruction]
@init{
	$instruction = new ast.stm.Instruction.F35c_method();
}
  : //e.g. invoke-virtual {} java/io/PrintStream/print(Ljava/lang/Stream;)V
    ^(I_STATEMENT_FORMAT35c_METHOD INSTRUCTION_FORMAT35c_METHOD register_list fully_qualified_method)
    {
    	$instruction.name = $INSTRUCTION_FORMAT35c_METHOD.text;
    	$instruction.regList = $register_list.regList;
    	$instruction.methodItem = $fully_qualified_method.methodItem;
    };

insn_format35c_type
  : //e.g. filled-new-array {}, I
    ^(I_STATEMENT_FORMAT35c_TYPE INSTRUCTION_FORMAT35c_TYPE register_list nonvoid_type_descriptor)
    {
    };

insn_format3rc_method
  : //e.g. invoke-virtual/range {} java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    ^(I_STATEMENT_FORMAT3rc_METHOD INSTRUCTION_FORMAT3rc_METHOD register_range fully_qualified_method)
    {
    };

insn_format3rc_type
  : //e.g. filled-new-array/range {} I
    ^(I_STATEMENT_FORMAT3rc_TYPE INSTRUCTION_FORMAT3rc_TYPE register_range nonvoid_type_descriptor)
    {
    };

insn_format41c_type
  : //e.g. const-class/jumbo v2, org/jf/HelloWorld2/HelloWorld2
    ^(I_STATEMENT_FORMAT41c_TYPE INSTRUCTION_FORMAT41c_TYPE REGISTER reference_type_descriptor)
    {
    };

insn_format41c_field
  : //e.g. sget-object/jumbo v0, Ljava/lang/System;->out:LJava/io/PrintStream;
    ^(I_STATEMENT_FORMAT41c_FIELD INSTRUCTION_FORMAT41c_FIELD REGISTER fully_qualified_field)
    {
    };

insn_format51l_type
  : //e.g. const-wide v0, 5000000000L
    ^(I_STATEMENT_FORMAT51l INSTRUCTION_FORMAT51l REGISTER fixed_64bit_literal)
    {
    };

insn_format52c_type
  : //e.g. instance-of/jumbo v0, v1, Ljava/lang/String;
    ^(I_STATEMENT_FORMAT52c_TYPE INSTRUCTION_FORMAT52c_TYPE registerA=REGISTER registerB=REGISTER nonvoid_type_descriptor)
    {
    };

insn_format52c_field
  : //e.g. iput-object/jumbo v1, v0, Lorg/jf/HelloWorld2/HelloWorld2;->helloWorld:Ljava/lang/String;
    ^(I_STATEMENT_FORMAT52c_FIELD INSTRUCTION_FORMAT52c_FIELD registerA=REGISTER registerB=REGISTER fully_qualified_field)
    {
    };

insn_format5rc_method
  : //e.g. invoke-virtual/jumbo {} java/lang/StringBuilder/append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    ^(I_STATEMENT_FORMAT5rc_METHOD INSTRUCTION_FORMAT5rc_METHOD register_range fully_qualified_method)
    {
    };

insn_format5rc_type
  : //e.g. filled-new-array/jumbo {} I
    ^(I_STATEMENT_FORMAT5rc_TYPE INSTRUCTION_FORMAT5rc_TYPE register_range nonvoid_type_descriptor)
    {
    };

insn_array_data_directive
  : //e.g. .array-data 4 1000000 .end array-data
    ^(I_STATEMENT_ARRAY_DATA ^(I_ARRAY_ELEMENT_SIZE short_integral_literal) array_elements)
    {
    };

insn_packed_switch_directive
  :
    ^(I_STATEMENT_PACKED_SWITCH ^(I_PACKED_SWITCH_START_KEY fixed_32bit_literal)
      packed_switch_targets)
  ;

insn_sparse_switch_directive
  :
    ^(I_STATEMENT_SPARSE_SWITCH sparse_switch_target_count sparse_switch_keys
      {
      }

      sparse_switch_targets)
    {
    };

nonvoid_type_descriptor returns [String type_desc]
  : (PRIMITIVE_TYPE
  | CLASS_DESCRIPTOR
  | ARRAY_DESCRIPTOR)
  {
  	 $type_desc = $start.getText();
  };


reference_type_descriptor returns [String ref_desc]
  : (CLASS_DESCRIPTOR
  | ARRAY_DESCRIPTOR)
  {
  	$ref_desc = $start.getText();
  }
  ;






class_type_descriptor returns [String className]
  : CLASS_DESCRIPTOR
  {
  	$className = $CLASS_DESCRIPTOR.text;
  };

type_descriptor returns [String type_desc]
  : VOID_TYPE { $type_desc = "V"; /* void */ }
  | nonvoid_type_descriptor { $type_desc = $nonvoid_type_descriptor.type_desc; }
  ;

short_integral_literal returns[short value]
  : long_literal
    {
      LiteralTools.checkShort($long_literal.value);
      $value = (short)$long_literal.value;
    }
  | integer_literal
    {
      LiteralTools.checkShort($integer_literal.value);
      $value = (short)$integer_literal.value;
    }
  | short_literal {$value = $short_literal.value;}
  | char_literal {$value = (short)$char_literal.value;}
  | byte_literal {$value = $byte_literal.value;};

integral_literal returns[int value]
  : long_literal
    {
      LiteralTools.checkInt($long_literal.value);
      $value = (int)$long_literal.value;
    }
  | integer_literal {$value = $integer_literal.value;}
  | short_literal {$value = $short_literal.value;}
  | byte_literal {$value = $byte_literal.value;};


integer_literal returns[int value]
  : INTEGER_LITERAL { $value = LiteralTools.parseInt($INTEGER_LITERAL.text); };

long_literal returns[long value]
  : LONG_LITERAL { $value = LiteralTools.parseLong($LONG_LITERAL.text); };

short_literal returns[short value]
  : SHORT_LITERAL { $value = LiteralTools.parseShort($SHORT_LITERAL.text); };

byte_literal returns[byte value]
  : BYTE_LITERAL { $value = LiteralTools.parseByte($BYTE_LITERAL.text); };

float_literal returns[float value]
  : FLOAT_LITERAL { $value = LiteralTools.parseFloat($FLOAT_LITERAL.text); };

double_literal returns[double value]
  : DOUBLE_LITERAL { $value = LiteralTools.parseDouble($DOUBLE_LITERAL.text); };

char_literal returns[char value]
  : CHAR_LITERAL { $value = $CHAR_LITERAL.text.charAt(1); };

string_literal returns [String value]
  : STRING_LITERAL
    {
    	$value = $STRING_LITERAL.text;
      	$value = $value.substring(1,$value.length()-1);
    };

bool_literal
  : BOOL_LITERAL {};

array_literal
  : {}
    ^(I_ENCODED_ARRAY (literal {})*)
    {
    };


annotations
  : {}
    ^(I_ANNOTATIONS (annotation {} )*)
    {
    };


annotation
  : ^(I_ANNOTATION ANNOTATION_VISIBILITY subannotation)
    {
    };

annotation_element
  : ^(I_ANNOTATION_ELEMENT SIMPLE_NAME literal)
    {
    };

subannotation
  :
    ^(I_SUBANNOTATION
        class_type_descriptor
        (annotation_element
        {
        }
        )*
     )
    ;

field_literal
  : ^(I_ENCODED_FIELD fully_qualified_field)
    {
    };

method_literal
  : ^(I_ENCODED_METHOD fully_qualified_method)
    {
    };

enum_literal
  : ^(I_ENCODED_ENUM fully_qualified_field)
    {
    };
