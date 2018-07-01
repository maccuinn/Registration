//
//  SelectDriverViewController.swift
//  Registration
//
//  Created by April Hall on 2018-06-19.
//  Copyright © 2018 April Hall. All rights reserved.
//

import UIKit
import CoreData

class SelectDriverViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    let event = UserDefaults.standard.object(forKey: "event")
    
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var selectDriverPicker: UIPickerView!
    @IBOutlet weak var registerButton: UIButton!
    
    var pickerData:[NSManagedObject] = []
    var pickerTitles:[String] = []
    
    @IBAction func registerButtonAction(_ sender: UIButton) {
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerTitles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerTitles[row]
    }
    
    func createRowTitles() {
        for data in pickerData {
            pickerTitles.append(data.value(forKey: "firstName") as! String)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        eventNameLabel.text = (event as! String)
        
        selectDriverPicker.delegate = self
        selectDriverPicker.dataSource = self
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Driver")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request) as! [NSManagedObject]
            pickerData = result
        } catch {
            print("Failed to load Picker Data from Core Data")
        }
        createRowTitles()
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
