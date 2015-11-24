//
//  loginVC.swift
//  DiversifiedINS
//
//  Created by Dominic Ceraso on 7/26/15.
//  Copyright (c) 2015 Steel City Developers, llc. All rights reserved.
//

import Foundation
import UIKit
import Parse

class LoginVC: UIViewController,
               UITextFieldDelegate,
               UIAlertViewDelegate {

/* Views */
    
    @IBOutlet var emailLoginField: UITextField!
    @IBOutlet var PasswordLoginField: UITextField!
    @IBOutlet var LogoImage: UIImageView!
    @IBOutlet var LoginToRegButton: UIButton!
    @IBOutlet var passwordResetButton: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        if PFUser.currentUser() != nil {
            dismissViewControllerAnimated(true, completion: nil)
        }
}

    override func viewDidLoad() {
        super.viewDidLoad()
        //Hide navigation for login
        
        navigationController?.navigationBarHidden = true

}

// LOGIN BUTTON

    @IBAction func LogInButton(sender: AnyObject) {
        var username = emailLoginField.text
        var password = PasswordLoginField.text
        
        PasswordLoginField.resignFirstResponder()
        
        view.showHUD(view)
        
        PFUser.logInWithUsernameInBackground(emailLoginField.text, password:PasswordLoginField.text) {
            (user, error) -> Void in
            
            if user != nil { // Login successfull
                self.dismissViewControllerAnimated(true, completion: nil)
                hudView.removeFromSuperview()

        
            } else { // Login failed. Try again or SignUp
                
                let alert = UIAlertView(title: APP_NAME,
                    message: "\(error!.localizedDescription)",
                    delegate: self,
                    cancelButtonTitle: "Retry",
                    otherButtonTitles: "Sign Up")
                    alert.show()
                
                hudView.removeFromSuperview()
            }
        }
    }

// AlertView delegate

    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if alertView.buttonTitleAtIndex(buttonIndex) == "Sign Up" {
            LoginToRegButton(self)
}

        var emailStr = alertView.textFieldAtIndex(0)?.text
        if alertView.buttonTitleAtIndex(buttonIndex) == "Reset Password" {
            println("\(emailStr)")
        }
}

    // SIGNUP BUTTON
    @IBAction func LoginToRegButton(sender: AnyObject) {
        let signupVC = self.storyboard?.instantiateViewControllerWithIdentifier("registerVC") as! registerVC
        presentViewController(signupVC, animated: true, completion: nil)
    }


/*  MARK - TEXTFIELD DELEGATES  */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == emailLoginField {
            PasswordLoginField.becomeFirstResponder()
        }
        if textField == PasswordLoginField {
            LogInButton(self)
            PasswordLoginField.resignFirstResponder()
        }
        return true
    }
    
    
// TAP TO DISMISS KEYBOARD
    @IBAction func tapToDismissKeyboard(sender: UITapGestureRecognizer) {
        emailLoginField.resignFirstResponder()
        PasswordLoginField.resignFirstResponder()
    }


// FORGOT PASSWORD BUTTON
    @IBAction func passwordResetButton(sender: AnyObject) {
        let alert = UIAlertView(title: APP_NAME,
            message: "Type your email address you used to register.",
            delegate: self,
            cancelButtonTitle: "Cancel",
            otherButtonTitles: "Reset Password")
            alert.alertViewStyle = UIAlertViewStyle.PlainTextInput
            alert.show()

}


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}


