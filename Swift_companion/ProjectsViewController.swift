//
//  ProjectsViewController.swift
//  swifty-companion
//
//  Created by Gordon RASS-KWASI on 9/7/16.
//  Copyright © 2016 Gordon RASS-KWASI. All rights reserved.
//

import UIKit

class ProjectsViewController: UIViewController, UITableViewDataSource {
    var student: Student?
    
    @IBOutlet weak var ProjectTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProjectTableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if student!.projets != nil {
            return (student?.projets?.count)!
        } else {
            return 0
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myCell: UITableViewCell = ProjectTableView.dequeueReusableCellWithIdentifier("Project", forIndexPath: indexPath)
        
        
        if student!.projets != nil {
            var text: String
            let name: String? = student?.projets?[indexPath.row]["project"]["name"].stringValue
            let projet_validated = student?.projets?[indexPath.row]["project"]["validated"] == true
            switch (name, projet_validated) {
            case (nil, _):
                text = ""
           
            case (_, projet_validated == true):
                let note_value: String? = student?.projets?[indexPath.row]["final_mark"].stringValue
                text = name! + " " + (note_value)!
            case (_, projet_validated == false):
                let note_value = "fail"
                text = name! + " " + note_value
            default:
                text = name!
            }
            myCell.textLabel?.text = text
        }
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
