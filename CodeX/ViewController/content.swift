//
//  content.swift
//  CodeX
//
//  Created by Developer on 17/04/19.
//  Copyright © 2019 Sachin Kumar Singh. All rights reserved.
//

import UIKit
import GoogleSignIn
class content: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func remove(_ sender: Any) {
       // dismiss(animated: true, completion: nil)
        performSegue(withIdentifier: "back", sender: nil)
    }
    
    @IBAction func fetch(_ sender: Any) {
        performSegue(withIdentifier: "tofetchcode", sender: nil)
    }
    @IBAction func signout(_ sender: Any) {
        GIDSignIn.sharedInstance().signOut()
        performSegue(withIdentifier: "tosignin", sender: nil)
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
