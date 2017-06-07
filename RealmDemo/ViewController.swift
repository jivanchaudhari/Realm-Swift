//
//  ViewController.swift
//  RealmDemo
//
//  Created by Mindrose on 05/06/17.
//  Copyright © 2017 Mindrose. All rights reserved.
//

import UIKit
import RealmSwift
class TableViewController: UITableViewController {

    @IBOutlet var DisplayTableView: UITableView!

   let items = try! Realm().objects(Employee.self).sorted(byKeyPath: "ID")

  
    
    let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {

     DisplayTableView.reloadData()
    }
    
    @IBAction func addBarButton(_ sender: Any) {
        let addVC = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController")as! AddViewController

        navigationController?.pushViewController(addVC, animated: true)
        
    }
   
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
      return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        let elements = items[indexPath.row]
        print(elements)
        
        cell.nameLabel.text = elements.name
        cell.deparmentLabel.text = elements.deparment
        cell.IDLabel.text = String(elements.ID)
        
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true

 
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title:"Update", message:"You are change Information.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            
            let firstTextField = alert.textFields![0] as UITextField
            let secondTextField = alert.textFields![1] as UITextField
            let thirdTextField = alert.textFields![2] as UITextField

            let emp = Employee()
            emp.name = firstTextField.text!
            emp.deparment = secondTextField.text!
            emp.ID = Int(thirdTextField.text!)!
            try! self.realm.write() {
                self.realm.add(emp, update: true)
                
            }
                self.DisplayTableView.reloadData()
            
       }
        alert.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "Enter The Name"
        })
        alert.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "Enter The Deparment"
        })
        alert.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
            textField.placeholder = "Enter Old ID"
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            
            self.dismiss(animated: true, completion: nil)
            
        }
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
 
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if (editingStyle == .delete){
            let item = items[indexPath.row]
            try! realm.write({
              realm.delete(item)
            })
            
            tableView.deleteRows(at:[indexPath], with:.right)
            
        }
        
    }
}

