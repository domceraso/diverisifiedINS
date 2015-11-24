//
//  categoriesVC.swift
//  DiversifiedINS
//
//  Created by Dominic Ceraso on 8/2/15.
//  Copyright (c) 2015 Steel City Developers, llc. All rights reserved.
//

import Foundation
import UIKit
import Parse


class categoriesVC: UIViewController,
                    UITableViewDataSource,
                    UITableViewDelegate {
    
    @IBOutlet var backButton: UIBarButtonItem!
    
    @IBOutlet var categoriesTableView: UITableView!
    
    private let categories = ["Cancer","Digestive System","Endocrine System","General","Heart","Immune System","Kidney","Skin","STD","Substance Abuse","Tobacco","Other"]
    
    let simpleTableIdentifier = "simpleTableIdentifier"
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return categories.count
    }
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCellWithIdentifier(
                simpleTableIdentifier) as? UITableViewCell
            if (cell == nil) {
                cell = UITableViewCell(
                    style: UITableViewCellStyle.Default, reuseIdentifier: simpleTableIdentifier)
            }
            cell!.textLabel!.text = categories[indexPath.row]
            return cell!
    }
    

    @IBAction func backButton(sender: UIBarButtonItem) {
        navigationController?.popViewControllerAnimated(true)
    }
    
}