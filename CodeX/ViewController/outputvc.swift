//
//  outputvc.swift
//  CodeX
//
//  Created by Sachin Kumar Singh on 07/01/1941 Saka.
//  Copyright © 1941 Sachin Kumar Singh. All rights reserved.
//

import UIKit
import GoogleSignIn
class outputvc: UIViewController {
    
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var saveprogram: Roundedbutton!
    @IBOutlet weak var printoutput: UITextView!
    public var codevc: CodeVC?
    override func viewDidLoad() {
        super.viewDidLoad()
        printoutput.text = outputcode
        message.isEditable = false
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        if (GIDSignIn.sharedInstance()?.hasAuthInKeychain())!{
            saveprogram.isHidden = false
        }
    }
    override func viewWillAppear(_ animated: Bool) {
         printoutput.isEditable = false
        
    }
    @IBAction func savesnippetpressed(_ sender: Any) {
    performSegue(withIdentifier: "generatecode", sender: nil)
    }
    @IBAction func closebtnpressed(_ sender: Any) {
        state = 0.45
        dismiss(animated: true, completion: nil)
    }
}
