//
//  CodeVC.swift
//  CodeX
//
//  Created by Sachin Kumar Singh on 07/01/1941 Saka.
//  Copyright © 1941 Sachin Kumar Singh. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
public var state = 0.1
class CodeVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    public var Outputvc: outputvc?
    @IBOutlet weak var Selectlang: UITextField!
    @IBOutlet weak var dropdown: UIPickerView!
    @IBOutlet weak var workspace: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var clean: RoundedButton!
    @IBOutlet weak var program: roundtextView!
    @IBOutlet weak var inputval: roundtextView!
    @IBOutlet weak var Run: RoundedButton!
    @IBOutlet weak var compile: RoundedButton!
    @IBOutlet weak var BACK: UIButton!
    var k = "C"
    var list = [String](arrayLiteral: "c","cpp","java","go","python","kotlin","swift","typescript")
    let thePicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Codemanager.instance.codevc = self
        Selectlang.inputView = thePicker
        Run.isHidden = true
        inputval.isHidden = true
        BACK.isHidden = true
        program.isEditable=false
        inputval.isEditable=false
        compile.isEnabled=false
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        progressbar.setProgress(Float(state), animated: true)
        activity.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        Selectlang.text = list[row]
        progressbar.setProgress(0.2, animated: true)
        k = Selectlang.text!
        program.isEditable=true
        inputval.isEditable=true
        compile.isEnabled=true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.Selectlang{
            textField.endEditing(true)
        }
        
    }
    public func gotooutputscreen()
    {
        performSegue(withIdentifier: "tooutputscreen", sender: nil)
    }
    func output()
    {
        Codemanager.instance.compile_snippet(inputs : inputval.text, language: k, content: program.text )
    }
    @IBAction func proceedbtnpressed(_ sender: Any) {
        progressbar.setProgress(progressbar.progress + 0.1, animated: true)
        workspace.text = "Enter Input :"
        compile.isHidden = true
        Run.isHidden = false
        inputval.isHidden = false
        program.isHidden = true
        dropdown.isHidden = true
        BACK.isHidden = false
        
    }
    @IBAction func Submitbtnpressed(_ sender: Any) {
        progressbar.setProgress(0.45, animated: true)
        activity.isHidden=false
        output()
    }
    @IBAction func clearbtnpressed(_ sender: Any) {
        progressbar.setProgress(0.1, animated: true)
        self.view.endEditing(true)
       workspace.text = "Code :"
        dropdown.isHidden = false
        Run.isHidden = true
        inputval.isHidden = true
        program.isHidden = false
        compile.isHidden = false
        program.text = nil
        BACK.isHidden = true
        program.isEditable=false
        inputval.isEditable=false
        compile.isEnabled=false
        activity.isHidden=true
    }
    @IBAction func loginbtnpressed(_ sender: Any) {
        performSegue(withIdentifier: "tologinin", sender: nil)
    }
    @IBAction func backbtnpressed(_ sender: Any) {
        workspace.text = "Code :"
        dropdown.isHidden = false
        Run.isHidden = true
        inputval.isHidden = true
        program.isHidden = false
        compile.isHidden = false
        BACK.isHidden = true
        progressbar.setProgress(0.2, animated: true)
    }
        
}

