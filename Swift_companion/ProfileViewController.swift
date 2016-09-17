//
//  ProfileViewController.swift
//  swifty-companion
//
//  Created by Gordon RASS-KWASI on 8/24/16.
//  Copyright © 2016 Gordon RASS-KWASI. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var student: Student?
    
    @IBOutlet weak var photoProfile: UIImageView!
    @IBOutlet weak var login: UILabel!
    @IBOutlet weak var level: UILabel!
    @IBOutlet weak var promotion: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.title = "Profile"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let Stu = student {
            if let Test_photo = Stu.photo {
                photoProfile.image = Test_photo
            }
        
            if let Test_login = Stu.login {
                login.text = Test_login
            } else {
                login.text = "Not found"
            }
        
            if let Test_level = Stu.niveau {
                level.text = Test_level
            } else {
                level.text = "Not found"
            }
            if let Test_promotion = Stu.promotion {
                promotion.text = Test_promotion
            } else {
                promotion.text = "Not found"
            }
            if let Test_email = Stu.email {
                email.text = Test_email
            } else {
                email.text = "Not found"
            }
            if let T_phone = Stu.mobile {
                phone.text = T_phone
            } else {
                phone.text = "Not found"
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
