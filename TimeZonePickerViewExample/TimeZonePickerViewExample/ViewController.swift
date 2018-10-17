//
//  ViewController.swift
//  TimeZonePickerViewExample
//
//  Created by Mitesh Soni on 16/10/18.
//  Copyright © 2018 Mitesh Soni. All rights reserved.
//

import UIKit
import TimeZonePickerView

class ViewController: UIViewController {

    let timeZonePickerView = UITimeZonePickerView()
    var pickerHidden = true
    var selectedTimeZone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeZonePickerView.addAsSubviewTo(superView: self.view)
        timeZonePickerView.delegate = self
        timeZonePickerView.isHidden = pickerHidden
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select TimeZone", style: .plain, target: self, action: #selector(changeTimeZone))
    }

    @objc func changeTimeZone(){
        if pickerHidden{
            navigationItem.rightBarButtonItem?.title = "Done"
            timeZonePickerView.isHidden = false
            pickerHidden = false
            return
        }

        navigationItem.rightBarButtonItem?.title = selectedTimeZone
        
        timeZonePickerView.isHidden = true
        pickerHidden = true
    }

}

extension ViewController: UITimeZonePickerViewDelegate{
    func timeZoneChanged(abbrevation: String) {
        print("Timezone is", abbrevation)
        selectedTimeZone = abbrevation
    }
    
    
}

