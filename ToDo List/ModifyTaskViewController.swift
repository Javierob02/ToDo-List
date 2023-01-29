//
//  ModifyTaskViewController.swift
//  ToDo List
//
//  Created by Javier Ocón Barreiro on 29/1/23.
//

import UIKit

class ModifyTaskViewController: UIViewController {

    @IBOutlet weak var TitleTXT: UITextField!
    @IBOutlet weak var DescriptionTXT: UITextField!
    
    //Get list of tasks
    var index = UserDefaults.standard.object(forKey: "Index")
    var titles: Array<String> = UserDefaults.standard.object(forKey: "Titles") as! Array<String>
    var descriptions: Array<String> = UserDefaults.standard.object(forKey: "Descriptions") as! Array<String>
    
    @IBAction func modifyTask(_ sender: Any) {
        //Add new Task to list of tasks
        titles[index as! Int] = (TitleTXT.text!)
        descriptions[index as! Int] = (DescriptionTXT.text!)
        
        //Store new task lists in UserDefaults
        UserDefaults.standard.set(titles, forKey: "Titles")
        UserDefaults.standard.set(descriptions, forKey: "Descriptions")
        
        //Show modified alert
        showModifiedAlert(self)
    }
    
    //Alert to confirm that a task has been modified
    func showModifiedAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Success", message: "Task was modified!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Show Task information
        TitleTXT.text = titles[index as! Int]
        DescriptionTXT.text = descriptions[index as! Int]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
