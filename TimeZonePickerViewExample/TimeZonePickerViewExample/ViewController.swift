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

    // MARK:- IBOutlets
    
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var timeZoneAbbrebationLabel: UILabel!
    
    
    // MARK:- Variables and constants
    
    let timeZonePickerView = UITimeZonePickerView()
    var pickerHidden = true
    var selectedTimeZone = TimeZone.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timeZonePickerView.addAsSubviewTo(superView: self.view)
        timeZonePickerView.delegate = self
        timeZonePickerView.isHidden = pickerHidden
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Select TimeZone", style: .plain, target: self, action: #selector(changeTimeZone))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Select TimeZone", style: .plain, target: self, action: #selector(presentTimeZonePicker))
    }
    
    @objc func presentTimeZonePicker(){
        let vc = UITimeZonePickerViewController()
        navigationController?.pushViewController(vc, animated: true)
//        present(vc, animated: true, completion: nil)
    }

    @objc func changeTimeZone(){
        if pickerHidden{
            navigationItem.rightBarButtonItem?.title = "Done"
            timeZonePickerView.isHidden = false
            pickerHidden = false
            return
        }

        
        navigationItem.rightBarButtonItem?.title = selectedTimeZone.identifier
        
        timeZonePickerView.isHidden = true
        pickerHidden = true
    }

}

extension ViewController: UITimeZonePickerViewDelegate{
    func timeZonePickerView(_ pickerView: UIPickerView, didSelectTimeZone timeZone: TimeZone) {
        print("Timezone is", timeZone.identifier)
        self.selectedTimeZone = timeZone
        timeZoneLabel.text = timeZone.identifier
        timeZoneAbbrebationLabel.text = timeZone.abbreviation()
    }
    
    func timeZoneChanged(abbrevation: String) {
        
    }
    
    
}

