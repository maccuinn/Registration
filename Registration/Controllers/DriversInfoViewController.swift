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
        if memberNumber == ""
        {
            createDriver()
        } else {
            editDriver()
        }
        
    }
    
    var memberNumber:String = ""
    
    var driver:NSManagedObject = NSManagedObject()
    
    func createDriver() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Driver", in: context)
        let newDriver = NSManagedObject(entity: entity!, insertInto: context)
        updateDriver(driver:newDriver)
    }
    
    func editDriver() {
         updateDriver(driver:driver)
    }
    
    func updateDriver(driver:NSManagedObject) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let firstName = firstNameTextField.text
        let lastName = lastNameTextField.text
        let phoneNumber = phoneNumberTextField.text
        let email = emailTextField.text
        let memberNumber = memberNumberTextField.text
        
        driver.setValue(firstName, forKey: "firstName")
        driver.setValue(lastName, forKey: "lastName")
        driver.setValue(phoneNumber, forKey: "phoneNumber")
        driver.setValue(email, forKey: "email")
        driver.setValue(memberNumber, forKey: "memberNumber")
        
        do {
            try context.save()
        } catch {
            print("Failed to Save")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detail" {
            
            // create a reference to the view controller to display to
            let vc = (segue.destination as! UINavigationController).topViewController as! SelectHandlerViewController
            
            // set the property productData from DetailViewController
            vc.memberNumber = memberNumberTextField.text!
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Driver")
        request.predicate = NSPredicate(format: "memberNumber = %@", memberNumber)
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            driver = result[0] as! NSManagedObject
        } catch {
            print("Failed to set Handler for Driver")
        }
        
        if memberNumber != "" {
            firstNameTextField.text = driver.value(forKey: "firstName") as? String
            lastNameTextField.text = driver.value(forKey: "lastName") as? String
            phoneNumberTextField.text = driver.value(forKey: "phoneNumber") as? String
            emailTextField.text = driver.value(forKey: "email") as? String
            memberNumberTextField.text = driver.value(forKey: "memberNumber") as? String
        }
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
