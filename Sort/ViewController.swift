//
//  ViewController.swift
//  Sort
//
//  Created by junpengwang on 11/01/2018.
//  Copyright © 2018 wilddog. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let source = ["冒泡", "快速", "归并", "鸡尾酒", "桶排序", "计数", "选择", "插入", "堆", "原地归并排序", "二叉排序树排序", "鸽巢排序", "基数排序", "侏儒排序", "图书馆排序", "块排序", "希尔排序", "Clover排序算法", "梳排序", "平滑排序", "内省排序", "耐心排序", "Bogo排序", "Stupid排序", "珠排序", "煎饼排序", "臭皮匠排序"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sortVC = segue.destination;
        sortVC.title = sender as? String;
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = source[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("click")
        self.performSegue(withIdentifier: "SortViewController", sender: source[indexPath.row])
    }
}

