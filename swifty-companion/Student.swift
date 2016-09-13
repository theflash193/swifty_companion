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
    let achievements: JSON?
    
    init?(data: JSON) {
        
        let url = NSURL(string: data["image_url"].stringValue)
        if let nsdata = NSData(contentsOfURL: url!) {
            self.photo = UIImage(data: nsdata)
        } else {
            self.photo = nil
        }
        self.login = data["login"].stringValue
        self.full_name = data["displayname"].stringValue
        self.email = data["email"].stringValue
        self.mobile = data["phone"].stringValue
        self.promotion = data["pool_year"].stringValue
        // Get Student level and skills
        var student_level: Float = 0.0
        var student_skill: JSON? = nil
        for (_, cursus) in data["cursus_users"] {
            if cursus["cursus"]["name"].stringValue == "42" {
                student_level = cursus["level"].floatValue
                student_skill = cursus["skills"]
            }
        }
        
        self.niveau = String(format: "%.2f", student_level)
        self.competence = student_skill
        self.projets = data["projects_users"]
        self.achievements = data["achievements"]
    }
}
