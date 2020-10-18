//
//  NameSpecificViewController.swift
//  world_Name
//
//  Created by Lily Dolph on 10/17/20.
//

import UIKit

class NameSpecificViewController: UIViewController {

    @IBOutlet weak var nameChosenLabel: UILabel!
    @IBOutlet weak var spellCheckSpecfic: UITextField!
    @IBOutlet weak var correctWrongSpecificPage: UILabel!
    
    var nameChosenTemp = String()
    var nameSubString = String()
    
    var trueOrFalse = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameChosenLabel.text = nameChosenTemp
    }
    
    
    @IBAction func returnNameSearch(_ sender: Any) {
        self.performSegue(withIdentifier: "ReturnNameSearchSegue", sender: self)
    }
    
    
    @IBAction func personalNameButton(_ sender: Any) {
       trueOrFalse = true;
    }

    @IBAction func checkSpelling(_ sender: Any) {
        let end = nameChosenTemp.firstIndex(of: " ")
        nameSubString = String(nameChosenTemp[..<end!])
        
        if (spellCheckSpecfic.text?.lowercased() == nameSubString.lowercased()) {
            
            spellCheckSpecfic.backgroundColor = UIColor.green
            nameChosenLabel.textColor = UIColor.white
            correctWrongSpecificPage.text = "Correct"
    
        } else {
            spellCheckSpecfic.backgroundColor = UIColor.red
            correctWrongSpecificPage.text = "Try Again!"

        }
        
    }
    
    @IBAction func hideNameSpecificPage(_ sender: Any) {
        nameChosenLabel.textColor = UIColor.init(hue: 0, saturation: 0, brightness: 0, alpha: 0)
    }
    
    @IBAction func showNameSpecificPage(_ sender: Any) {
        nameChosenLabel.textColor = UIColor.white
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (trueOrFalse) {
            if (segue.identifier == "ReturnNameSearchSegue") {
                let dataToSend = segue.destination as! searchBarViewController;
                
                dataToSend.tempArraySpecificName.append(nameChosenTemp)
            
            }
        
        }
    } 
}
