//
//  ViewController.swift
//  suanfaStudy
//
//  Created by 段峰 on 2020/8/11.
//  Copyright © 2020 段峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    func singleListNode(){
        let linklist = LinkList<Int>()
        linklist.add(10)
        linklist.add(20)
        linklist.add(30)
        linklist.add(40)
        
        print(linklist)
        
        linklist.add(50,index: 0)
        print("------------")
        print(linklist)
        
        let num = linklist.remove(index: linklist.size)
        print(num)
        
        print("------------")
        print(linklist)
        
        linklist.add(70, index: 2)
        print("------------")
        print(linklist)
        
        linklist.remove(index: 0)
        print("------------")
        print(linklist)
        
        linklist.remove(index: 2)
        print("------------")
        print(linklist)
        
        
        linklist.clear()
        print("------------")
        print(linklist)
    }

}

