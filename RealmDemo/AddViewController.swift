//
//  AddViewController.swift
//  RealmDemo
//
//  Created by Mindrose on 05/06/17.
//  Copyright © 2017 Mindrose. All rights reserved.
//

import UIKit
import RealmSwift

class AddViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    
    @IBOutlet var deparmentTextField: UITextField!
    @IBOutlet var idTextField: UITextField!
   
    let empData = Employee()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func insertDataInRealm (){
        
        let enteredText = Int(idTextField.text!)
        if enteredText == nil{
            //String entered
            alertWithAction(title: "Worng Text", massage: "Please Enter Number Only.")

        }
        else{
            if empData.ID ==  enteredText! {
                alertWithAction(title: "Same ID", massage: "Please Enter Unother ID.")
            } else {
                empData.name = nameTextField.text!
                empData.ID = enteredText!
                empData.deparment = deparmentTextField.text!
                let realm = try! Realm()
                
                try! realm.write {
                    
                    realm.add(empData)
                    
                }
            }
        
        }
        
    }
    @IBAction func saveButtonAction(_ sender: Any) {
        
        if ((nameTextField.text?.isEmpty)! || (deparmentTextField.text?.isEmpty)! || (idTextField.text?.isEmpty)!){
            
            alertWithAction(title: "Text Empty", massage: "Please Enter The Text.")
            
        } else {
         
            insertDataInRealm()
            navigationController?.popViewController(animated: true)
        }

    }

    func alertWithAction(title:String,massage:String) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
            
        }
        alert.addAction(okAction)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
           
            self.dismiss(animated: true, completion: nil)
            
        }
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
