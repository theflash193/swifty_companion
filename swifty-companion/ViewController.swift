//
//  ViewController.swift
//  swifty-companion
//
//  Created by Gordon RASS-KWASI on 7/28/16.
//  Copyright © 2016 Gordon RASS-KWASI. All rights reserved.
//

import UIKit
import Alamofire
import OAuth2
import SwiftyJSON

class ViewController: UIViewController {
    var student: Student!
    
    @IBAction func testAction(sender: AnyObject) {
        
        let manager = APImanager(contextView: self)
        
        
        manager.request(.GET, "https://api.intra.42.fr/v2/users/grass-kw") { response in
            let data = JSON(data: response.data!)
            self.student = Student(data: data)
            print("email: \(self.student.email)")
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    


}
