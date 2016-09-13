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
//        
//        print(student?.projets)
//        print("project name : \(student?.projets?[0]["project"]["name"].stringValue)")
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
            let name: String? = student?.projets?[indexPath.row]["project"]["name"].stringValue
            myCell.textLabel?.text = name
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
