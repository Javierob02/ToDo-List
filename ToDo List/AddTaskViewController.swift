//
//  AddTaskViewController.swift
//  ToDo List
//
//  Created by Javier Ocón Barreiro on 28/1/23.
//

import UIKit

class AddTaskViewController: UIViewController {
    @IBOutlet weak var TitleTXT: UITextField!
    @IBOutlet weak var DescriptionTXT: UITextField!
    
    @IBAction func createTaskBTN(_ sender: Any) {
        if TitleTXT.text!.isEmpty || DescriptionTXT.text!.isEmpty {
            //Not all fields are complete --> Alert
            showAddErrorAlert(self)
            //Reset ViewController
            TitleTXT.text = ""
            DescriptionTXT.text = ""
            //Exit task creation
            return
        }
        
        //Get list of tasks
        var titles: Array<String> = UserDefaults.standard.object(forKey: "Titles") as! Array<String>
        var descriptions: Array<String> = UserDefaults.standard.object(forKey: "Descriptions") as! Array<String>
        
        //Add new Task to list of tasks
        titles.append(TitleTXT.text!)
        descriptions.append(DescriptionTXT.text!)
        
        //Store new task lists in UserDefaults
        UserDefaults.standard.set(titles, forKey: "Titles")
        UserDefaults.standard.set(descriptions, forKey: "Descriptions")
        
        //Reset ViewController
        TitleTXT.text = ""
        DescriptionTXT.text = ""
        
        //Show adding alert
        showAddAlert(self)
    }
    
    //Alert to confirm that a task has been created
    func showAddAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Success", message: "Task was added!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Alert to let know not all fields are complete
    func showAddErrorAlert(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: "All fields must be complete", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
