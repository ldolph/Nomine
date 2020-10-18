//
//  aboutViewController.swift
//  world_Name
//
//  Created by Lily Dolph on 10/18/20.
//

import UIKit

class aboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func returnHomeAboutPage(_ sender: Any) {
        self.performSegue(withIdentifier: "aboutToHomeSegue", sender: self)
    }

}
