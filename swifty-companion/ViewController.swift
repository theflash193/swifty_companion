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
    var student: Student!

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
        
        manager.request(.GET, "https://api.intra.42.fr/v2/users/\(login)") { response in
            let data = JSON(data: response.data!)
            print(data)
            self.student = Student(data: data)
//            print("email: \(self.student.email)")
        }
    }
    
    
    @IBAction func backToSearchUnwindAction(unwindSegue: UIStoryboardSegue) {
        
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
    }
    
    // MARK: navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (sender === searchButton) {
            let ProfileVC = segue.destinationViewController as! ProfileViewController
            ProfileVC.student = self.student
        }
    }
}
