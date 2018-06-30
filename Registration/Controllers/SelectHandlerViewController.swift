//
//  SelectHandlerViewController.swift
//  Registration
//
//  Created by April Hall on 2018-06-19.
//  Copyright © 2018 April Hall. All rights reserved.
//

import UIKit
import CoreData

class SelectHandlerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
   
    @IBOutlet weak var selectHandlerPicker: UIPickerView!
    
    @IBAction func saveButton(_ sender: UIButton) {
    }
    
    var pickerData:[Any] = []
    var pickerTitles:[String] = []
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerTitles[row]
    }
    
    //func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    //}
    
    func createRowTitles() {
        for data in pickerData as! [NSManagedObject] {
            pickerTitles.append(data.value(forKey: "firstName") as! String)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectHandlerPicker.delegate = self
        selectHandlerPicker.dataSource = self
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Handler")
        request.returnsObjectsAsFaults = false
        
        do {
            let result = try context.fetch(request)
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
