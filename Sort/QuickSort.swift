//
//  QuickSort.swift
//  Sort
//
//  Created by junpengwang on 12/01/2018.
//  Copyright © 2018 wilddog. All rights reserved.
//

import UIKit

class QuickSort: Sort {
    
    override func sort(source: inout Array<Int>, swapping: ((_ x: Int, _ y: Int) -> Void)?) {
        self.quickSort(source: &source, 0, source.count - 1, swapping: swapping!)
    }
    
    func quickSort(source: inout Array<Int>, _ start: Int, _ end: Int, swapping:(_ x: Int, _ y: Int) -> Void) {
        if start >= end {
            return
        }
        let mid = source[start]
        var left = start
        var right = end
        while left < right {
            while source[right] > mid && left < right {
                right -= 1
            }
            while source[left] <= mid && left < right {
                left += 1
            }
            if left != right {
                swapping(source[left], source[right])
                swap(source: &source , left, right)
            }
        }
        if source[left] < mid {
            swapping(source[left], source[start])
            swap(source: &source , left, start)
        }
        quickSort(source: &source, start, left - 1, swapping: swapping)
        quickSort(source: &source, left + 1, end, swapping: swapping)
    }
    
    func swap(source: inout Array<Int>, _ x: Int, _ y: Int) {
        let temp = source[x]
        source[x] = source[y]
        source[y] = temp
    }
}
