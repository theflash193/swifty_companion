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
    
    let login: String
    let full_name: String
    let photo: UIImage?
    let email: String
    let mobile: String
    let promotion: String
    let niveau: String
    let competence: JSON
    
    
    init(data: JSON) {
        let url = NSURL(string: data["image_url"].stringValue)
//        let skills: JSON = data["cursus_users"][0]["skill"]
//        print(skills)
//        for (key,subJson):(String, JSON) in skills {
//            print("key : \(key), subJson : \(subJson)")
//        }
//        print(data["cursus_users"][0]["skills"])
        self.photo = UIImage(data: NSData(contentsOfURL: url!)!)
        self.login = data["login"].stringValue
        self.full_name = data["displayname"].stringValue
        self.email = data["email"].stringValue
        self.mobile = data["phone"].stringValue
        self.promotion = data["pool_year"].stringValue
        self.niveau = data["cursus_users"][0]["level"].stringValue
        
        self.competence = data["cursus_users"][0]["skills"]
//        for (_, value) in competences {
//            print("\(value["name"]) => \(value["level"])")
//            
//        }
//        for i in compétences {
//            print(i)
//        }
//        print(compétences)
        
    }
}
