//
//  SortViewController.swift
//  Sort
//
//  Created by junpengwang on 11/01/2018.
//  Copyright © 2018 wilddog. All rights reserved.
//

import UIKit

class SortViewController: UIViewController {

    let sourceCout = 10
    let animationDuration = 1.000
    var dataSource = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareData()
        showDataSource()
        sort()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func prepareData() {
        var source = [Int]()
        for i in 1..<sourceCout {
            source.append(i)
        }
        for i in 0..<source.count {
            let index = arc4random_uniform(UInt32(source.count))
            dataSource.append(source[Int(index)])
            source.remove(at: Int(index))
            print("\(i)")
        }
        print("dataSource \(dataSource)")
    }

    func showDataSource() {
        var i = 0
        for item in dataSource {
            let screenWidth = CGFloat.init(view.bounds.width)
            let width = screenWidth/CGFloat.init(dataSource.count)
            let heightPer = view.bounds.height/CGFloat(dataSource.count)
            let btn = UIButton.init(frame: CGRect(x:CGFloat(i)*width, y:self.view.bounds.height - (CGFloat(item)*heightPer), width: width, height:CGFloat(item)*heightPer))
            btn.tag = item
            btn.backgroundColor = UIColor.init(red:55/255.0 , green:51/255.0, blue:CGFloat(item) * 255.0/CGFloat(dataSource.count) / 255.0 , alpha: 1)
            self.view.addSubview(btn)
            i = i + 1;
        }
    }
    
    func sort() {
        let sort = Sort.sort(with: self.title!)
        DispatchQueue.global().async {
            sort.sort(source: &self.dataSource) { (x, y) in
                let semaPhore = DispatchSemaphore(value: 0)
                
                DispatchQueue.main.async {
                    UIView.animate(withDuration: self.animationDuration, animations: {
                        let leftBtn = self.view.viewWithTag(x)
                        let rightBtn = self.view.viewWithTag(y)
                        let centerX = leftBtn?.center.x
                        leftBtn?.center.x = (rightBtn?.center.x)!
                        rightBtn?.center.x = centerX!;
                    }, completion: { (yes) in
                        semaPhore.signal()
                    })
                }
                
                semaPhore.wait()
            }
        }
    }
}
