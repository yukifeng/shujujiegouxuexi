//
//  150. 逆波兰表达式求值.swift
//  suanfaStudy
//
//  Created by edz on 2021/4/23.
//  Copyright © 2021 段峰. All rights reserved.
//

import Foundation

/**
 根据 逆波兰表示法，求表达式的值。

 有效的算符包括 +、-、*、/ 。每个运算对象可以是整数，也可以是另一个逆波兰表达式。

  

 说明：

 整数除法只保留整数部分。
 给定逆波兰表达式总是有效的。换句话说，表达式总会得出有效数值且不存在除数为 0 的情况。

 示例 1：

 输入：tokens = ["2","1","+","3","*"]
 输出：9
 解释：该算式转化为常见的中缀算术表达式为：((2 + 1) * 3) = 9
 示例 2：

 输入：tokens = ["4","13","5","/","+"]
 输出：6
 解释：该算式转化为常见的中缀算术表达式为：(4 + (13 / 5)) = 6
 示例 3：

 输入：tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
 输出：22
 解释：
 该算式转化为常见的中缀算术表达式为：
   ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
 = ((10 * (6 / (12 * -11))) + 17) + 5
 = ((10 * (6 / -132)) + 17) + 5
 = ((10 * 0) + 17) + 5
 = (0 + 17) + 5
 = 17 + 5
 = 22

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/evaluate-reverse-polish-notation
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class EvalRPN {
    func evalRPN(_ tokens: [String]) -> Int {
        let stack = Stack<String>()
        let flagList = ["+","-","*","/"]
        for s in tokens {
            if !flagList.contains(s) {
                stack.push(s)
            }else {
                let num1 = stack.pop()
                let num2 = stack.pop()
                var result = 0
                switch s {
                case "+":
                    result = Int(num2!)! + Int(num1!)!
                case "-":
                    result = Int(num2!)! - Int(num1!)!
                case "*":
                    result = Int(num2!)! * Int(num1!)!
                case "/":
                    result = Int(num2!)! / Int(num1!)!
                default:
                    break
                }
                stack.push(String(result))
            }
        }
        return Int(stack.pop()!)!
    }
}
