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

class ViewController: UIViewController, UITextFieldDelegate {
    var student: Student? = nil

    // MARK: properties
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        searchButton.enabled = false
        searchTextField.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBarHidden = true
    }
    
    
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBarHidden = false
    }
    
    // MARK: Action
    
    @IBAction func SearchAction(sender: AnyObject) {
        let manager = APImanager(contextView: self)
        let login = searchTextField.text!
        let try_url: NSURL? = NSURL(string: "https://api.intra.42.fr/v2/users/\(login)")
        
        if let url = try_url {
            manager.request(.GET, url) { response in
                switch response.result {
                case .Success:
                    let data = JSON(data: response.data!)
                    self.student = Student(data: data)
                    fallthrough
                case .Failure: break
                }
            }
        }
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldDidBeginEditing(textField: UITextField) {
        searchButton.enabled = false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidLogin()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        SearchAction(self)
        return true
    }

    func checkValidLogin() {
        // Disabled button search if text is invalid
        let text = searchTextField.text ?? ""
        searchButton.enabled = !text.isEmpty
        if var valid = student {
            
        } else {
            searchButton.enabled = false
        }
        
    }
    
    // MARK: navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showProfile" {
            if let tbc = segue.destinationViewController as? UITabBarController {
                if let ProfileVC = tbc.viewControllers![0] as? ProfileViewController {
                    ProfileVC.student = self.student
                }
                if let ProjectsVC = tbc.viewControllers![1] as? ProjectsViewController {
                    ProjectsVC.student = self.student
                }
                if let SkillsVC = tbc.viewControllers![2] as? SkillsViewController {
                    SkillsVC.student = self.student
                }
            }
        }
    }
}
