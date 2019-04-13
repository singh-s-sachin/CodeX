//
//  File.swift
//  CodeX
//
//  Created by Sachin Kumar Singh on 10/01/1941 Saka.
//  Copyright © 1941 Sachin Kumar Singh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
public var outputcode = "Running"
class Codemanager {
    static let instance = Codemanager()
    public var codevc : CodeVC?
    func compile_snippet(inputs : String,language : String, content: String){
        let headers : [String : String] = [
            "Content-type": "application/json",
            "Authorization":"Token f49f383b-0710-494c-ad79-76cdf3970c53"
        ]
        var apilink = "https://run.glot.io/languages/" + language + "/latest"
        var fname = "codex"
        if(language == "python")
        {
            fname = fname + ".py"}
        else
        if(language == "c++")
        {
            fname = fname + ".cpp"
        }
        else
        if(language == "kotlin")
        {
        fname = fname + ".kt"
        }
        else
        {
            fname = fname + "." + language
        }
        print(apilink)
        print(fname)
        var body : [String : Any] = ["stdin" : inputs, "files" : [["name": fname,
                                                                  "content": content]]]
        self.codevc?.progressbar.setProgress(0.65, animated: true)
        Alamofire.request(apilink, method: .post, parameters: body , encoding: JSONEncoding.default, headers: headers).responseJSON
            {(response) in
                    guard let data = response.data else { return }
                    do{
                        self.codevc?.progressbar.setProgress(1, animated: true)
                        let json = try JSON(data: data)
                        print(json)
                        outputcode = json["stdout"].stringValue + "\n" + json["stderr"].stringValue + "\n" + json["error"].stringValue
                        self.codevc?.gotooutputscreen()
                    }
                    catch{
                        debugPrint(error)
                    }
        }
    }
}

