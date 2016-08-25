//
//  ProfileViewController.swift
//  swifty-companion
//
//  Created by Gordon RASS-KWASI on 8/24/16.
//  Copyright © 2016 Gordon RASS-KWASI. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var student: Student!
    
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
        photoProfile.image = student.photo
        login.text = student!.login
        level.text = student!.niveau
        promotion.text = student!.promotion
        email.text = student!.email
        phone.text = student!.mobile
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
