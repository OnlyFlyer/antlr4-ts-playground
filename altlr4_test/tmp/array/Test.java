// 导入 ANTLR 的运行库

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class Test {
  public static void main(String[] args) throws Exception {
    // 新建一个 CharStream, 从标准输入读取数据
    ANTLRInputStream input = new ANTLRInputStream(System.in);

    // 新建一个词法分析器，处理输入的 Charstream
    ArrayInitLexer lexer = new ArrayInitlexer(input);

    // 新建一个词法符号的缓冲区 ，用于存储词法分析器将生成的词法符号
    CommonTokenstream tokens= new CommonTokenstream(lexer);

    // 新建一个语法分析器，处理词法符号缓冲区中的内容
    ArrayInitParser parser = new ArrayInitParser(tokens);

    ParseTree tree = parser.init(); // 针对init规则，开始语法分析

    System.out.println(tree.tostringTree(parser)); // 用LISP风格打印生成的树
  }
}
