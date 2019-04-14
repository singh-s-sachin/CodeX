//
//  loginVC.swift
//  CodeX
//
//  Created by Developer on 13/04/19.
//  Copyright © 2019 Sachin Kumar Singh. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

class loginVC: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func closedloginbtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
