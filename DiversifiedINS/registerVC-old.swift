//
//  registerVC.swift
//  DiversifiedINS
//
//  Created by Dominic Ceraso on 7/26/15.
//  Copyright (c) 2015 Steel City Developers, llc. All rights reserved.
//

import Foundation
import UIKit
import Parse

class CustomSignupVC: UIViewController {
    
    @IBOutlet weak var emailRegisterField: UITextField!
    @IBOutlet weak var fullNameRegisterField: UITextField!
    @IBOutlet weak var PasswordRegisterField: UITextField!
    @IBOutlet weak var ConfPassRegisterField: UITextField!
    
    var actInd : UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(0,0, 150, 150)) as UIActivityIndicatorView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.actInd.center = self.view.center
        self.actInd.hidesWhenStopped = true
        self.actInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        view.addSubview(self.actInd)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: Actions
    
    @IBAction func signUpAction(sender: AnyObject) {
        
        var username = self.emailRegisterField.text
        var password = self.PasswordRegisterField.text
        var confPass = self.ConfPassRegisterField.text
        
        if count (username.utf16Count < 6 || count, password.UTf16Count < 8) {
            
            var alert = UIAlertView(title: "Invalid", message: "Username must be greater than 6 characters and Password must be greater than 8", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
        } else if (email.utf16Count < 8){
            
            var alert = UIAlertView(title: "Invalid", message: "Please enter a valid password.", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
        } else {
            
            self.actInd.startAnimating()
            
            var newUser = PFUser()
            newUser.username = username
            newUser.password = password
            newUser.confPass = confPass
            
            newUser.signUpInBackgroundWithBlock({ (succeed, error) -> Void in
                
                self.actInd.stopAnimating()
                
                if ((error) != nil) {
                    
                    var alert = UIAlertView(title: "Error", message: "\(error)", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                
                } else {
                    
                    var alert = UIAlertView(title: "Success", message: "Signed Up", delegate: self, cancelButtonTitle: "OK")
                    alert.show()
                    
                }
                
            })
            
        }
        
    }
}