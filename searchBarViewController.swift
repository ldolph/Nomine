//
//  searchBarViewController.swift
//  world_Name
//
//  Created by Lily Dolph on 10/17/20.
//


import UIKit

class searchBarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    @IBOutlet weak var nameTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!

    //@IBOutlet weak var flagImageSearchPage: UIImageView!
    //@IBOutlet weak var nameLable: UILabel!
    
    var nameChosen = String()
    var imageChosen = String()
    
    let nameList = ["Catalina (f)", "Emma (f)", "Fatou (f)", "Mamadou (m)", "Savannah (f)", "Somchai (m)", "Taika (m)"]
   

    let flagList : [UIImage] = [#imageLiteral(resourceName: "chile"), #imageLiteral(resourceName: "germany"), #imageLiteral(resourceName: "senegal"), #imageLiteral(resourceName: "senegal"), #imageLiteral(resourceName: "united_states"), #imageLiteral(resourceName: "thailand"), #imageLiteral(resourceName: "new_zealand")]
    
    var nameSearch = [String]()
    var searchCondition = false
    
    var tempArraySpecificName = [String]()

    @IBAction func homeButtonSearch(_ sender: Any) {
        self.performSegue(withIdentifier: "returnHomeSegueSearch", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (searchCondition) {
            return nameSearch.count
        } else {
            return nameList.count
        }
    }
    
    //table view
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if (searchCondition) {
            cell.textLabel?.text = nameSearch[indexPath.row]
            cell.imageView?.image = flagList[indexPath.row]
        } else {
            cell.textLabel?.text = nameList[indexPath.row]
            cell.imageView?.image = flagList[indexPath.row]

        }
        
        return cell
    }
    
    
    //search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        nameSearch = nameList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searchCondition = true
        nameTableView.reloadData()
    }
    
    //cancel button
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchCondition = false;
        searchBar.text = ""
    }
    
    //click row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        if (searchCondition) {
            nameChosen = nameSearch[indexPath.row]
        } else {
            nameChosen = nameList[indexPath.row]
        }
        
        self.performSegue(withIdentifier: "specificNameSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "specificNameSegue") {
            let dataToSend = segue.destination as! NameSpecificViewController
            
            dataToSend.nameChosenTemp = nameChosen
        }
        
        if (segue.identifier == "returnHomeSegueSearch") {
            let dataToSendHome = segue.destination as! ViewController
            
            dataToSendHome.tempArray = tempArraySpecificName
        }
    }
    
    
}
