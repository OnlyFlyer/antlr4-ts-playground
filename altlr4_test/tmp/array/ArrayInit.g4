/**
  语法文件通常以 grammar 关键字开头
  名为 ArrayInit 的语法，必须和文件名 ArrayInit.g4 相匹配
*/

grammar ArrayInit;

/** 一条叫 init 的规则，匹配一堆花括号中的、逗号分隔的value */
init              : '{' value (',' value)* '}' ; // 必须匹配至少一个 value

/** 一个 value 可以是潜逃的花括号结构，也可以是一个简单的证书，即 INT 词法符号 */
value             : init
                  | INT
                  ;

// 词法分析器的规则必须以小写字母开头，词法分析器的规则必须用大写字母开头
INT               : [0-9]+ ; // 定义词法符号 INT，它由一个或多个数字组成
WS                : [ \t\r\n]+ -> skip ; // 定义词法规则 "空白符号"，丢弃之
