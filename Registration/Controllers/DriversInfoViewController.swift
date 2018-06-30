//
//  DriversInfoViewController.swift
//  Registration
//
//  Created by April Hall on 2018-06-19.
//  Copyright © 2018 April Hall. All rights reserved.
//

import UIKit
import CoreData

class DriversInfoViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var memberNumberTextField: UITextField!
    
    @IBAction func nextButton(_ sender: UIButton) {
        createDriver()
    }
    
    func createDriver() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Driver", in: context)
        let newDriver = NSManagedObject(entity: entity!, insertInto: context)
        
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let phoneNumber = phoneNumberTextField.text
        let email = emailTextField.text
        let memberNumber = memberNumberTextField.text
        
        newDriver.setValue(firstName, forKey: "firstName")
        newDriver.setValue(lastName, forKey: "lastName")
        newDriver.setValue(phoneNumber, forKey: "phoneNumber")
        newDriver.setValue(email, forKey: "email")
        newDriver.setValue(memberNumber, forKey: "memberNumber")
        
        do {
            try context.save()
        } catch {
            print("Failed to Save")
        }
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            
            // create a reference to the view controller to display to
            let vc = segue.destination as! SelectHandlerViewController
            
            // set the property productData from DetailViewController
            vc.memberNumber = memberNumberTextField.text!
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
