//
//  BubbleSort.swift
//  Sort
//
//  Created by junpengwang on 12/01/2018.
//  Copyright © 2018 wilddog. All rights reserved.
//

import UIKit

class BubbleSort: Sort {
    
    override func sort(source: inout Array<Int>, swapping: ((_ x: Int, _ y: Int) -> Void)?) {
        for i in 0..<source.count {
            for j in i+1..<source.count {
                if source[i] > source[j] {
                    swapping!(source[i], source[j])
                    self.swap(source: &source , i, j)
                }
            }
        }
    }

    func swap(source: inout Array<Int>, _ x: Int, _ y: Int) {
        let temp = source[x]
        source[x] = source[y]
        source[y] = temp
    }
}
