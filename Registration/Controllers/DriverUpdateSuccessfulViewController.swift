//
//  DriverUpdateSuccessfulViewController.swift
//  Registration
//
//  Created by April Hall on 2018-06-19.
//  Copyright © 2018 April Hall. All rights reserved.
//

import UIKit
import CoreData

class DriverUpdateSuccessfulViewController: UIViewController {
    
    @IBOutlet weak var driverNameLabel: UILabel!
    
    var memberNumber:String = ""
    var driver:Driver = Driver()

    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Driver")
        request.predicate = NSPredicate(format: "memberNumber = %@", memberNumber)
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
            if result.count != 0 {
                driver = result[0] as! Driver
                driverNameLabel.text = driver.firstName
            }
        } catch {
            print("Failed to set Handler for Driver")
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
