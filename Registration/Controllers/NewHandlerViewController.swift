//
//  NewHandlerViewController.swift
//  Registration
//
//  Created by April Hall on 2018-06-19.
//  Copyright © 2018 April Hall. All rights reserved.
//

import UIKit
import CoreData

class NewHandlerViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var memberNumberTextField: UITextField!
    
    @IBAction func saveButton(_ sender: UIButton) {
        createHandler()
    }
    
    func createHandler() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Handler", in: context)
        let newHandler = NSManagedObject(entity: entity!, insertInto: context)
        
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let phoneNumber = phoneNumberTextField.text
        let email = emailTextField.text
        let memberNumber = memberNumberTextField.text
        
        newHandler.setValue(firstName, forKey: "firstName")
        newHandler.setValue(lastName, forKey: "lastName")
        newHandler.setValue(phoneNumber, forKey: "phoneNumber")
        newHandler.setValue(email, forKey: "email")
        newHandler.setValue(memberNumber, forKey: "memberNumber")
        
        do {
            try context.save()
        } catch {
            print("Failed Saving")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
