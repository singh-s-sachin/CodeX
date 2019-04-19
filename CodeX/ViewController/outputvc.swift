//
//  outputvc.swift
//  CodeX
//
//  Created by Sachin Kumar Singh on 07/01/1941 Saka.
//  Copyright © 1941 Sachin Kumar Singh. All rights reserved.
//

import UIKit

class outputvc: UIViewController {
    
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var printoutput: UITextView!
    public var codevc: CodeVC?
    override func viewDidLoad() {
        super.viewDidLoad()
        printoutput.text = outputcode
        message.isEditable = false
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
         printoutput.isEditable = false
        
    }
    @IBAction func closebtnpressed(_ sender: Any) {
        state = 0.45
        dismiss(animated: true, completion: nil)
    }
}
