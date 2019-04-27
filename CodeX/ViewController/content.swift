//
//  content.swift
//  CodeX
//
//  Created by Developer on 17/04/19.
//  Copyright © 2019 Sachin Kumar Singh. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

struct post {
   let name : String
}
class content: UIViewController, GIDSignInUIDelegate,UITableViewDelegate, UITableViewDataSource {
    var posts = [post]()
    @IBOutlet weak var contents: UITableView!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    override func viewDidLoad() {
       super.viewDidLoad()
        activity.startAnimating()
        contents.dataSource = self
        let db = Firestore.firestore()
        db.collection(Auth.auth().currentUser?.uid as Any as! String).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                   print("\(document.documentID) => \(document.data())")
                    self.posts.insert(post(name: document.documentID), at: 0)
                }
                self.contents.reloadData()
            }
        }
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
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return posts.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! cellview
        cell.labelname.text = posts[indexPath.row].name
        self.activity.stopAnimating()
        return cell
    }
   

}
