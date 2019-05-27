//
//  IntentViewController.swift
//  CodeX-intentUI
//
//  Created by Developer on 24/05/19.
//  Copyright © 2019 Sachin Kumar Singh. All rights reserved.
//

import IntentsUI

// As an example, this extension's Info.plist has been configured to handle interactions for INSendMessageIntent.
// You will want to replace this or add other intents as appropriate.
// The intents whose interactions you wish to handle must be declared in the extension's Info.plist.

// You can test this example integration by saying things to Siri like:
// "Send a message using <myApp>"

class IntentViewController: UIViewController, INUIHostedViewControlling {
    
    @IBOutlet weak var printsender: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        printsender.text = [INPerson].self as Any as? String
    }
    func configure(with interaction: INInteraction, context: INUIHostedViewContext, completion: @escaping (CGSize) -> Void) {
        if interaction.intent is INSearchForMessagesIntent{
            let intent = interaction.intent as! INSearchForMessagesIntent
            self.printsender.text = intent as Any as? String
        }
        completion(self.desiredSize)
    }
    // MARK: - INUIHostedViewControlling
    
    // Prepare your view controller for the interaction to handle.
  /*  func configureView(for parameters: Set<INParameter>, of interaction: INInteraction, interactiveBehavior: INUIInteractiveBehavior, context: INUIHostedViewContext, completion: @escaping (Bool, Set<INParameter>, CGSize) -> Void) {
        // Do configuration here, including preparing views and calculating a desired size for presentation.
        completion(true, parameters, self.desiredSize)
    }*/
    
    var desiredSize: CGSize {
        return self.extensionContext!.hostedViewMaximumAllowedSize
    }
    
}
