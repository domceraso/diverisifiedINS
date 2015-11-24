//
//  dashboardVC.swift
//  DiversifiedINS
//
//  Created by Dominic Ceraso on 7/27/15.
//  Copyright (c) 2015 Steel City Developers, llc. All rights reserved.
//

import Foundation
import UIKit
import Parse


class dashboardVC: UIViewController,
                   UITextFieldDelegate,
                   UIAlertViewDelegate{
    
    
    /* Views */
    @IBOutlet var questionsButton: UIButton!
    @IBOutlet var clientsButton: UIButton!
    @IBOutlet var calendarButton: UIButton!
    @IBOutlet var reportsButton: UIButton!
    @IBOutlet var logoutBtn: UIBarButtonItem!
    @IBOutlet var searchBtn: UIBarButtonItem!
    
    

    
    
    override func viewWillAppear(animated: Bool) {
    
   
    
    // OPEN LOGIN CONTROLLER (You're not logged in)
    if PFUser.currentUser() == nil {
        let loginVC = self.storyboard?.instantiateViewControllerWithIdentifier("LoginVC") as! LoginVC
    presentViewController(loginVC, animated: true, completion: nil)
    }
   }
    
    
    
    // AlertView delegate
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {

            // LOGOUT USER
        if alertView.buttonTitleAtIndex(buttonIndex) == "Logout" {
            PFUser.logOut()
            let loginVC = self.storyboard?.instantiateViewControllerWithIdentifier("LoginVC") as! LoginVC
            presentViewController(loginVC, animated: false, completion: nil)
        }
        
        
    }

    
    
    
    // LOGOUT BUTTON
    @IBAction func logoutBtn(sender: AnyObject) {
        var logoutAlert = UIAlertView(title:APP_NAME,
            message: "Are you sure you want to logout from \(APP_NAME)?",
            delegate: self,
            cancelButtonTitle: "No",
            otherButtonTitles: "Logout")
        logoutAlert.show()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  }