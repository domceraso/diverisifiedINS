//
//  Configs.swift
//  DiversifiedINS
//
//  Created by Dominic Ceraso on 7/26/15.
//  Copyright (c) 2015 Steel City Developers, llc. All rights reserved.
//

import Foundation
import UIKit

/******************/
// APPLICATION NAME
/******************/
let APP_NAME = "Diversified INS"


/******************/
// PARSE KEYS
/******************/

let PARSE_APP_KEY = "SLcuEd45JnKFsXv2aMOQg2cA0heqtv2diWQK5yln"
let PARSE_CLIENT_KEY = "DfR9mJTlAsUMvik1Hvde2DPxgpyxctJKC0pAe7ug"


/******************/
// ERROR ALERTVIEW
/******************/
let error = NSError()
var errorAlert = UIAlertView(title: APP_NAME,
    message: "\(error.localizedDescription)",
    delegate: nil,
    cancelButtonTitle: "OK" )




/******************/
// HUD VIEWS
/******************/
let hudView = UIView(frame: CGRectMake(0, 0, 80, 80))
let indicatorView = UIActivityIndicatorView(frame: CGRectMake(0, 0, 80, 80))
let spinImage = UIImageView(frame: CGRectMake(0, 0, 80, 80))
extension UIView {
    func showHUD(view: UIView) {
        hudView.center = CGPointMake(view.frame.size.width/2, view.frame.size.height/2)
        hudView.backgroundColor = UIColor.darkGrayColor()
        hudView.alpha = 0.9
        hudView.layer.cornerRadius = hudView.bounds.size.width/2
        
        indicatorView.center = CGPointMake(hudView.frame.size.width/2, hudView.frame.size.height/2)
        indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.WhiteLarge
        hudView.addSubview(indicatorView)
        indicatorView.startAnimating()
        view.addSubview(hudView)
    }
}


/******************/
// PARSE KEYS
/******************/
var USER_CLASS_NAME = "User"
var USER_USERNAME = "username"
var USER_EMAIL = "email"




/******************/
// COLORS
/******************/







