
lexer grammar CommonLexerRules; // 注意区别， 是 "lexer grammar"

ID          : [a-zA-Z]+;
INT         : [0-9]+;
NEWLINE     : '\r'? '\n'; // 新行的开始（换行）
WS          : [ \t]+ -> skip; // 丢弃空白字符
