//
//  MergeSort.swift
//  Sort
//
//  Created by junpengwang on 17/01/2018.
//  Copyright © 2018 wilddog. All rights reserved.
//

import UIKit

class MergeSort: Sort {
    override func sort(source: inout Array<Int>, swapping: ((_ x: Int, _ y: Int) -> Void)?) {
        var reg = Array(repeatElement(0, count: source.count))
        mergeSort(source: &source, reg: &reg, start: 0, end: source.count - 1, swapping: swapping!)
        print("result: \(source)")
    }
    
    func mergeSort(source: inout Array<Int>, reg: inout Array<Int>, start: Int, end: Int, swapping:(_ x: Int, _ y: Int) -> Void) {
        if start >= end {
            return
        }
        let len = end - start
        let mid = (len >> 1) + start
        var start1 = start
        let end1 = mid
        var start2 = mid + 1
        let end2 = end
        mergeSort(source: &source, reg: &reg, start: start1, end: end1, swapping: swapping)
        mergeSort(source: &source, reg: &reg, start: start2, end: end2, swapping: swapping)
        var k = start
        while start1 <= end1 && start2 <= end2 {
            if source[start1] < source[start2] {
                reg[k] = source[start1]
                start1 += 1
            } else {
                reg[k] = source[start2]
                start2 += 1
            }
            k += 1
        }
        while start1 <= end1 {
            reg[k] = source[start1]
            k += 1
            start1 += 1
        }
        while start2 <= end2 {
            reg[k] = source[start2]
            k += 1
            start2 += 1
        }
        
        for i in start...end  {
            swapping(source[i], reg[i])
            source[i] = reg[i]
        }
        print("\(source)")
    }
}
