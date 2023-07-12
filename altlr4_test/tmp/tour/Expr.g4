
grammar Expr;

// 语法分析规则： 以小写字母开头
prog          : stat+;

stat          : expr NEWLINE
              | ID '=' expr NEWLINE
              | NEWLINE
              ;

expr          : expr ('*'|'/') expr
              | expr ('+'|'-') expr
              | INT
              | ID
              | '(' expr ')'
              ;

// 词法分析规则： 以大写字母开头
ID            : [a-zA-Z]+ ; // 匹配标识符

INT           : [0-9]+ ; // 匹配整数

NEWLINE       : '\r'? '\n' ; // 告诉语法分析器一个新行的卡是（即语句终止标志）

WS            : [ \t]+ -> skip ; // 丢弃空白字符
