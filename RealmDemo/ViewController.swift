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
    
    var allEmployeeArray = [[String: String]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        queryEmployee()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        queryEmployee()

     DisplayTableView.reloadData()
    }
    
    @IBAction func addBarButton(_ sender: Any) {
        let addVC = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController")as! AddViewController
       
        navigationController?.pushViewController(addVC, animated: true)
        
    }
   
    func queryEmployee () {
        
        let realm = try! Realm()
        
        let allEmployee = realm.objects(Employee.self)
        for employee in allEmployee {
            
            // print("Added \(employee.name) in deparment \(employee.deparment) and ID is \(employee.ID)")
            
            let dict = ["Name": "\(employee.name)", "Deparment": "\(employee.deparment)", "ID": "\(employee.ID)"]
            
            allEmployeeArray.append(dict)
            
            
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return allEmployeeArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        let elements = allEmployeeArray[indexPath.row]
        
        cell.nameLabel.text = elements["Name"]
        cell.deparmentLabel.text = elements["Deparment"]
        cell.IDLabel.text = elements["ID"]
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true

 
        return cell
    }
  
}

