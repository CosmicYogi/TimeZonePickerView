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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: "Select Timezone", target: self, action: changeTimeZone)
    }

    @objc func changeTimeZone(){
        
    }

}

