识别语言的程序称为 语法分析器（parser） 活着 句法分析器（syntax analyzer）

句法（syntax）指约束语言中的各个组成部分之间关系的细则

语法（grammar）是一系列规则的集合


词法分析器（lexer）

词法符号（token）

词法分析器可将相关的词法符号归类，例如 INT（整数）、ID（标识符）、FLOAT（浮点数）等

语法分析器不关心单个符号，而仅关心符号的类型是，词法分析器就需要将词汇符号归类。

词法符号包含至少两部分信息：词法符号的类型（能够通过类型来识别词法结构）和该词法符号对应的文本


第二个阶段：实际的语法分析过程

递归下降：stat()、assign()、expr()

stat 相当于 switch

```java

stat: assign | ifstat | whilesta

void stat() {
  switch ( << 当前输入的词法符号 >> ) {
    CASE ID       : assign(); break;
    CASE IF       : ifstat(); break;
    CASE WHILE    : whilestat(); break;
    ...
    default       : << 抛出无可选方案的异常 >>

  }
}

```

---

```g4

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

```

```g4


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


```

