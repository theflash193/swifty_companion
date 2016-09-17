//
//  AchievementViewController.swift
//  Swift_companion
//
//  Created by Gordon RASS-KWASI on 9/17/16.
//  Copyright © 2016 Gordon RASS-KWASI. All rights reserved.
//

import UIKit

class AchievementViewController: UIViewController, UITableViewDataSource {
    var student: Student?
    // MARK: - Attributs
    @IBOutlet weak var TableView: UITableView!
    
    override func viewWillAppear(animated: Bool) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        print(student?.achievements)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if student!.achievements != nil {
            return student!.achievements!.count
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell: UITableViewCell = TableView.dequeueReusableCellWithIdentifier("Achievement", forIndexPath: indexPath)
        
        if student!.achievements != nil {
            let detailAchievement: String = student!.competence![indexPath.row]["name"].stringValue + " detail:" + student!.achievements![indexPath.row]["description"].stringValue
            myCell.textLabel?.text = detailAchievement
        } else {
            print("not found")
        }
        return myCell
    }

}
