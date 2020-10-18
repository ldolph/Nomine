//
//  playViewController.swift
//  world_Name
//
//  Created by Lily Dolph on 10/18/20.
//

import UIKit

class playViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func returnHomePlay(_ sender: Any) {
        self.performSegue(withIdentifier: "segueToHome", sender: self)
    }
    
}
