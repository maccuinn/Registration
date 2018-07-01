//
//  RegistrationSuccessViewController.swift
//  Registration
//
//  Created by April Hall on 2018-06-19.
//  Copyright © 2018 April Hall. All rights reserved.
//

import UIKit

class RegistrationSuccessViewController: UIViewController {
    
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    
    var currentEvent:Event = Event()
    var currentDriver:Driver = Driver()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLable.text = currentDriver.firstName
        eventNameLabel.text = currentEvent.eventName
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
