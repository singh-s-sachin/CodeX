//
//  loginVC.swift
//  CodeX
//
//  Created by Developer on 13/04/19.
//  Copyright © 2019 Sachin Kumar Singh. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

class loginVC: UIViewController, GIDSignInUIDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().uiDelegate = self
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.loginvc = self
        }
        // Do any additional setup after loading the view.
    }
    public func gotonextpage(){
        performSegue(withIdentifier: "tocontent", sender: nil)
    }
    
    /// <#Description#>
    ///
    /// - Parameter sender: <#sender description#>
    @IBAction func closedloginbtn(_ sender: Any) {
         performSegue(withIdentifier: "back", sender: nil)
    }
    
     @IBAction func googlesignin(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
     }
    @IBAction func fetchcodes(_ sender: Any) {
        performSegue(withIdentifier: "tofetchcode", sender: nil)
    }
    

}
