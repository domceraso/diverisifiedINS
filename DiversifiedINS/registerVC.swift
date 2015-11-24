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


class registerVC: UIViewController,
                  UITextFieldDelegate
{
    
    
    /* Views */
    
    
    @IBOutlet var usernameRegisterButton: UITextField!
    @IBOutlet var emailRegisterButton: UITextField!
    @IBOutlet var passRegisterButton: UITextField!
    
    @IBOutlet var backButtonRegister: UIButton!
    @IBOutlet var logoImageRegister: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameRegisterButton.delegate = self
        emailRegisterButton.delegate = self
        passRegisterButton.delegate = self
        
        // Disable navigation menu
        navigationController?.navigationBarHidden = true
    }
    
    //Back Button
    @IBAction func backButtonRegister(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // TAP TO DISMISS KEYBOARD
    @IBAction func tapToDismissKeyboard(sender: UITapGestureRecognizer) {
        usernameRegisterButton.resignFirstResponder()
        emailRegisterButton.resignFirstResponder()
        passRegisterButton.resignFirstResponder()
        
    }
    
    // SIGNUP BUTTON
    @IBAction func SignUpButton(sender: AnyObject) {
        view.showHUD(view)
        
        var userForSignUp = PFUser()
        if usernameRegisterButton.text != "" && emailRegisterButton.text != "" && passRegisterButton.text != "" {
            
            userForSignUp.username = usernameRegisterButton.text
            userForSignUp.password = passRegisterButton.text
            userForSignUp.email = emailRegisterButton.text
            
            userForSignUp.signUpInBackgroundWithBlock { (succeeded, error) -> Void in
                if error == nil { // Successful Signup
                    self.dismissViewControllerAnimated(true, completion: nil)
                    hudView.removeFromSuperview()
        
                } else { // No signup, something went wrong
                    var alert = UIAlertView(title: APP_NAME,
                        message: "\(error!.localizedDescription)",
                        delegate: nil,
                        cancelButtonTitle: "OK")
                        alert.show()
                        hudView.removeFromSuperview()
                }
            }
            
            // ALL FIELDS MUST NOT BE EMPTY
        } else {
            var alert = UIAlertView(title: APP_NAME,
                message: "You must set a username, a password and an email adress to Sign Up",
                delegate: nil,
                cancelButtonTitle: "OK")
            alert.show()
            hudView.removeFromSuperview()
        }
        
}

/* MARK -  TEXTFIELD DELEGATE */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == emailRegisterButton {   passRegisterButton.becomeFirstResponder()  }
        if textField == passRegisterButton {  emailRegisterButton.becomeFirstResponder()  }
        
        return true
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}