//
//  File.swift
//  swifty-companion
//
//  Created by Gordon RASS-KWASI on 7/28/16.
//  Copyright © 2016 Gordon RASS-KWASI. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class Student {
    
    // MARK: properties
    
    let login: String?
    let full_name: String?
    let photo: UIImage?
    let email: String?
    let mobile: String?
    let promotion: String?
    let niveau: String?
    let competence: JSON?
    let projets: JSON?
    
    init?(data: JSON) {
        
        let url = NSURL(string: data["image_url"].stringValue)
        self.photo = UIImage(data: NSData(contentsOfURL: url!)!)
        self.login = data["login"].stringValue
        self.full_name = data["displayname"].stringValue
        self.email = data["email"].stringValue
        self.mobile = data["phone"].stringValue
        self.promotion = data["pool_year"].stringValue
        
        var student_level = ""
        for (_, cursus) in data["cursus_users"] {
            if cursus["cursus"]["name"].stringValue == "42" {
                student_level = cursus["level"].stringValue
            }
        }
        self.niveau = student_level
        self.competence = data["cursus_users"][0]["skills"]
        self.projets = data["projects_users"]
    }
}
