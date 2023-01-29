//
//  ViewController.swift
//  ToDo List
//
//  Created by Javier Ocón Barreiro on 28/1/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    //Get task lists
    var titles: Array<String> = UserDefaults.standard.object(forKey: "Titles") as! Array<String>
    var descriptions: Array<String> = UserDefaults.standard.object(forKey: "Descriptions") as! Array<String>
    
    //Function to display rows in TableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    //Function to display cell information in TableView & cell creation
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Cell creation
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TasksTableViewCell
        
        //Cell customization
        cell.TitleLBL?.text = titles[indexPath.row]
        cell.DescriptionLBL?.text = descriptions[indexPath.row]
        //cell.TitleLBL?.text = t[indexPath.row]
        
        //Return customized cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Get index for modifiyng
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        //............... FIXXX ...............
        // Perform some action when the detail accessory is tapped
        UserDefaults.standard.set(indexPath.row, forKey: "Index")
        
        //Push to ModifyTaskViewController
        self.performSegue(withIdentifier: "SegueToModifyTasks", sender:nil);
    }
    
    
        
    //------------------ Used to make slide to delete animation ------------------
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
        
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        tableView.beginUpdates()
        //Remove task from task lists
        titles.remove(at: indexPath.row)
        descriptions.remove(at: indexPath.row)
        //Delete row of the deleted task
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
        
        //Update Task Lists
        UserDefaults.standard.set(titles, forKey: "Titles")
        UserDefaults.standard.set(descriptions, forKey: "Descriptions")
    }
    
    // ---------------------------------------------------------------------------
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        //initializeData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Reload the task lists
        titles = UserDefaults.standard.object(forKey: "Titles") as! Array<String>
        descriptions = UserDefaults.standard.object(forKey: "Descriptions") as! Array<String>
        //Reload the TableView
        tableView.reloadData()
    }
        
    //Data initialization function
    func initializeData() {
        let titles: Array<String> = ["Title1", "Title2", "Title3"]
        let descriptions: Array<String> = ["Description1", "Description2", "Description3"]
        
        UserDefaults.standard.set(titles, forKey: "Titles")
        UserDefaults.standard.set(descriptions, forKey: "Descriptions")
    }
    
        
}
    
