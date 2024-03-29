//
//  210. 课程表 II.swift
//  suanfaStudy
//
//  Created by 段峰 on 2021/7/15.
//  Copyright © 2021 段峰. All rights reserved.
//


import Foundation
/**
 现在你总共有 n 门课需要选，记为 0 到 n-1。

 在选修某些课程之前需要一些先修课程。 例如，想要学习课程 0 ，你需要先完成课程 1 ，我们用一个匹配来表示他们: [0,1]

 给定课程总量以及它们的先决条件，返回你为了学完所有课程所安排的学习顺序。

 可能会有多个正确的顺序，你只要返回一种就可以了。如果不可能完成所有课程，返回一个空数组。

 示例 1:

 输入: 2, [[1,0]]
 输出: [0,1]
 解释: 总共有 2 门课程。要学习课程 1，你需要先完成课程 0。因此，正确的课程顺序为 [0,1] 。
 示例 2:

 输入: 4, [[1,0],[2,0],[3,1],[3,2]]
 输出: [0,1,2,3] or [0,2,1,3]
 解释: 总共有 4 门课程。要学习课程 3，你应该先完成课程 1 和课程 2。并且课程 1 和课程 2 都应该排在课程 0 之后。
      因此，一个正确的课程顺序是 [0,1,2,3] 。另一个正确的排序是 [0,2,1,3] 。
 说明:

 输入的先决条件是由边缘列表表示的图形，而不是邻接矩阵。详情请参见图的表示法。
 你可以假定输入的先决条件中没有重复的边。
 提示:

 这个问题相当于查找一个循环是否存在于有向图中。如果存在循环，则不存在拓扑排序，因此不可能选取所有课程进行学习。
 通过 DFS 进行拓扑排序 - 一个关于Coursera的精彩视频教程（21分钟），介绍拓扑排序的基本概念。
 拓扑排序也可以通过 BFS 完成。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/course-schedule-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
class FindOrder {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        // 排序结果
        var result = [Int]()
        // 放课程集合
        var set = Set<Int>()
        // key: 课程。 value: 先修课程集合
        var map = [Int: Set<Int>]()
        var queue = [Int]()
        
        // 给定的数组中可能不包含所有课程
        for i in 0..<numCourses {
            // 将所有存在的课程放入课程集合
            set.insert(i)
            map[i] = Set<Int>()
        }
        
        for list in prerequisites {
            map[list[0]]!.insert(list[1])
        }
        
        //　遍历课程集合，没有前置课程的放入队列
        for key in set {
            if map[key] == nil || (map[key] != nil && map[key]!.isEmpty){
                queue.append(key)
            }
        }
        
        while !queue.isEmpty {
            
            set.remove(queue.first!)
            
            //　遍历课程集合，没有前置课程的放入队列
            for key in set {
                if map[key]!.contains(queue.first!) {
                    map[key]?.remove(queue.first!)
                }
                // 去重
                if map[key]!.isEmpty && !queue.contains(key) {
                    queue.append(key)
                }
            }
            result.append(queue.first!)
            queue.remove(at: 0)
        }
        
        return result.count == numCourses ? result : []
    }
}
