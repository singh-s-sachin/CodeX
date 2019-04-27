//
//  GenerateVC.swift
//  CodeX
//
//  Created by Developer on 20/04/19.
//  Copyright © 2019 Sachin Kumar Singh. All rights reserved.
//

import UIKit
import Firebase
class GenerateVC: UIViewController {
    let codeVC = CodeVC()
    @IBOutlet weak var programname: UITextField!
    @IBOutlet weak var genoratebutton: Roundedbutton!
    @IBOutlet weak var closebutton: UIButton!
    @IBOutlet weak var errormessage: UITextField!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.genoratebutton.isEnabled=true
        self.closebutton.isEnabled=true
        self.activity.stopAnimating()
        self.errormessage.isHidden = true
        self.errormessage.endEditing(true)
    }
    func senddata(){
        let db = Firestore.firestore()
        db.collection(Auth.auth().currentUser?.uid as Any as! String).document(programname.text!).setData(["language" : k ,"program" : code ]){ err in
            if let err = err {
                self.errormessage.isHidden = false
                self.activity.stopAnimating()
                self.genoratebutton.isEnabled=true
                self.closebutton.isEnabled=true
                } else {
                self.performSegue(withIdentifier: "toresults", sender: nil)
                print("Document successfully written!")
            }
        }
    }
    @IBAction func close(_ sender: Any) {
    dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savebtnpressed(_ sender: Any) {
        senddata()
        self.activity.startAnimating()
        self.genoratebutton.isEnabled=false
        self.closebutton.isEnabled=false
    }
    

}
