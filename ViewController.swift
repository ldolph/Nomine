//
//  ViewController.swift
//  world_Name
//
//  Created by Lily Dolph on 10/17/20.
//

import UIKit

class ViewController: UIViewController {
    
    var tempArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playHome(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToPlay", sender: self)
        
    }
    
    @IBAction func searchBarHome(_ sender: Any) {
        self.performSegue(withIdentifier: "SearchBarSegue", sender: self)
    }
    
    @IBAction func personalListHome(_ sender: Any) {
        self.performSegue(withIdentifier: "personalListSegue", sender: self)
    }
    
    @IBAction func aboutHome(_ sender: Any) {
        self.performSegue(withIdentifier: "aboutPageSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "personalListSegue") {
            let dataToSend = segue.destination as! PersonalListViewController
            
            dataToSend.tempPersonalListArray = tempArray
        }
    }
    
}
