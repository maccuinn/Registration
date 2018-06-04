//
//  DriversViewController.swift
//  Registration
//
//  Created by April Hall on 2018-05-31.
//  Copyright © 2018 April Hall. All rights reserved.
//

import UIKit

class DriversViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var club1 = ["club1":["event1", "event2", "event3", "event4"]]
    var club2 = ["club2":["event4", "event6", "event7", "event8"]]
    var club3 = ["club3":["event9", "event10", "event11", "event12"]]
    var club4 = ["club4":["event13", "event14", "event15", "event16"]]
    
    var clubs: [String] = [String]()
    var events: [String] = [String]()
    var clubRow = 0
    var eventRow = 0
    
    var raceData:[Dictionary<String, [String]>] = []
    
    @IBOutlet weak var selectClubPicker: UIPickerView!
    @IBOutlet weak var selectEventPicker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == selectClubPicker {
            return clubs.count
        }
        else if pickerView == selectEventPicker {
            return events.count
        }
        else {
            print("count not load picker data")
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == selectClubPicker {
            return clubs[row]
        }
        else {
            return events[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == selectClubPicker {
            clubRow = row
            setEventsList(club: clubs[clubRow])
            selectEventPicker.selectRow(0, inComponent: 0, animated: true)
            self.selectEventPicker.reloadAllComponents()
        }
        else {
            print("selection done")
        }
    }
    
    func setEventsList(club: String) {
        for currentClub in raceData {
            for (key, _) in currentClub {
                if key == club {
                    self.events = currentClub[club]!
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        raceData = [club1, club2, club3, club4]
        
        selectClubPicker.delegate = self
        selectEventPicker.delegate = self
        
        for club in raceData {
            for (key, _) in club {
                self.clubs.append(key)
            }
        }
        
        for club in raceData {
            for (key, value) in club {
                if (key == clubs[0]) {
                    self.events = value
                }
            }
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
