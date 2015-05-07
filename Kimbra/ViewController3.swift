//
//  ViewController3.swift
//  Kimbra
//
//  Created by Arthur Bello on 5/7/15.
//  Copyright (c) 2015 Arthur Bello. All rights reserved.
//

import UIKit

class ViewController3: UITableViewController, UITableViewDelegate, UITableViewDataSource  {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    var items: [String] = ["Arthur", "Arash", "Omar", "Uyanga"]
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        
        cell.textLabel?.text = self.items[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    println("You selected cell #\(indexPath.row)!")
    }

}
