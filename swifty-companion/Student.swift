//
//  File.swift
//  swifty-companion
//
//  Created by Gordon RASS-KWASI on 7/28/16.
//  Copyright © 2016 Gordon RASS-KWASI. All rights reserved.
//

import UIKit

class Student {
    
    // MARK: properties
    
    let login: String
    let photo: UIImage?
    let email: String
    let mobile: String
    let niveau: Float
    
    init(login: String, photo: UIImage?, email: String, mobile: String, niveau: Float) {
        self.login = login
        self.photo = photo
        self.email = email
        self.mobile = mobile
        self.niveau = niveau
    }
}
