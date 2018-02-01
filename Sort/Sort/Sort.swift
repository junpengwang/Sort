//
//  Sort.swift
//  Sort
//
//  Created by junpengwang on 12/01/2018.
//  Copyright © 2018 wilddog. All rights reserved.
//

import UIKit

class Sort: NSObject {
    
    static func sort(with name: String) -> Sort {
        switch name {
        case "冒泡":
            return BubbleSort()
        case "快速":
            return QuickSort()
        case "归并":
            return MergeSort()
        default:
            return Sort()
        }
    }


    func sort(source: inout Array<Int>, swapping: ((_ x: Int, _ y: Int) -> Void)?) {
        print("empty sort")
    }
}
