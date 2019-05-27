//
//  IntentHandler.swift
//  CodeX-intent
//
//  Created by Developer on 24/05/19.
//  Copyright © 2019 Sachin Kumar Singh. All rights reserved.
//

import Intents

// As an example, this class is set up to handle Message intents.
// You will want to replace this or add other intents as appropriate.
// The intents you wish to handle must be declared in the extension's Info.plist.

// You can test your example integration by saying things to Siri like:
// "Send a message using <myApp>"
// "<myApp> John saying hello"
// "Search for messages in <myApp>"
let receipent = [INPerson].self
class IntentHandler: INExtension, INSearchForMessagesIntentHandling{
    //static let instance = IntentHandler()
    //public var codevc :
    func handle(intent: INSearchForMessagesIntent, completion: @escaping (INSearchForMessagesIntentResponse) -> Void) {
        
        let receipent : [INPerson]
        printg()
    }
    
    func printg()
    {
        print(receipent as Any)
    }
    override func handler(for intent: INIntent) -> Any {
        switch intent{
        case is INSearchForMessagesIntent:
             return receipent
        default:
             fatalError()
        }
        // This is the default implementation.  If you want different objects to handle different intents,
        // you can override this and return the handler you want for that particular intent.
        return self
    }
    
}
