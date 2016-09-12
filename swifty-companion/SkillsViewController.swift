//
//  SkillsViewController.swift
//  swifty-companion
//
//  Created by Gordon RASS-KWASI on 9/7/16.
//  Copyright © 2016 Gordon RASS-KWASI. All rights reserved.
//

import UIKit

class SkillsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var student: Student?
    @IBOutlet weak var SkillTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SkillTableView.delegate = self
        SkillTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - DataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student!.competence!.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell: UITableViewCell = SkillTableView.dequeueReusableCellWithIdentifier("Prototype1", forIndexPath: indexPath)
        
        let StatSkill: String = student!.competence![indexPath.row]["name"].stringValue + " " + student!.competence![indexPath.row]["level"].stringValue
        myCell.textLabel?.text = StatSkill
        return myCell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
