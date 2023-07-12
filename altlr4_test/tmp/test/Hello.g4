// install/Hello.g4
grammar Hello; // 定义一个名为 Hello 的语法
r  : 'hello' ID; // 匹配一个关键字 hello 和一个紧随气候的标识符
ID : [a-z]+ ; // 匹配小写
WS : [ \t\r\n]+ -> skip ; // 忽略空格、Tab、换行以及 、r（Windows）
