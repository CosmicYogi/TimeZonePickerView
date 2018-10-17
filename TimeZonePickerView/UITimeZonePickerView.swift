//
//  TimeZoneView.swift
//  TimePicker
//
//  Created by mitesh soni on 16/10/18.
//  Copyright © 2018 mitesh soni. All rights reserved.
//
import UIKit

@IBDesignable public class UITimeZonePickerView: UIView {
    
    let pickerView = UIPickerView()
    let zones = TimeZoneManager.shared.timeZones
    
    var currentContinent = "Africa"
    public var delegate: UITimeZonePickerViewDelegate?
    
    override public var isHidden: Bool{
        get {
            return pickerView.isHidden
        } set {
            pickerView.isHidden = newValue
        }
    }
    
    override public func awakeFromNib() {
        createPickerView()
    }
    
    
    func createPickerView() {
        self.addSubview(pickerView)
        self.alpha = 1
        pickerView.alpha = 1;
        pickerView.backgroundColor = .white
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let screenWidth = UIScreen.main.bounds.size.width
        let screenHeight = UIScreen.main.bounds.size.height
        print("Height and width are", screenHeight, screenWidth)
        pickerView.frame = CGRect(x: 0, y: screenHeight/2 - 260, width: screenWidth, height: 260)
        
        self.topAnchor.constraint(equalTo: pickerView.topAnchor, constant: 0).isActive = true
        self.leftAnchor.constraint(equalTo: pickerView.leftAnchor, constant: 0).isActive = true
        self.rightAnchor.constraint(equalTo: pickerView.rightAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 0).isActive = true
        self.pickerView.isHidden = false
    }
    
    public func addAsSubviewTo(superView: UIView){
        superView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: superView.topAnchor, constant: 0).isActive = true
        self.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: 0).isActive = true
        self.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: 0).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: 0).isActive = true
        
        createPickerView()
    }
    
}


extension UITimeZonePickerView: UIPickerViewDelegate, UIPickerViewDataSource{
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return zones.count
        }
        if component == 1{
            //            print("current continent is", zones[currentContinent])
            //            print("element count is", zones[currentContinent]?.count)
            return zones[currentContinent]?.count ?? 0
        }
        return 0
    }
    
    private func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 0{
            let continent = TimeZoneManager.shared.continents[row]
            //            currentContinent = continent
            //            let timeZones = timeZonesList[continent]
            return continent
        }
        else if component == 1{
            let timeZones = zones[currentContinent]
            return timeZones?[row ] ?? "n/a"
        }
        return "?"
    }
    private func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var _continent = ""
        var _zone = ""
        
        if component == 0{
            currentContinent = TimeZoneManager.shared.continents[row]
            _continent = currentContinent
            pickerView.reloadComponent(1)
            let selectedRow = pickerView.selectedRow(inComponent: 1)
            if let zone = zones[currentContinent]?[selectedRow]{
                _zone = zone
                let timeZoneAbbrebiation = currentContinent + "/" + zone
                //                print("Time zone abbrivation is")
                //                print(timeZoneAbbrebiation)
                delegate?.timeZoneChanged(abbrevation: timeZoneAbbrebiation)
            }
        }
        if component == 1{
            
            if let zone = zones[currentContinent]?[row]{
                _zone = zone
                let timeZoneAbbrebiation = currentContinent + "/" + zone
                //                print("Time zone abbrivation is")
                //                print(timeZoneAbbrebiation)
                delegate?.timeZoneChanged(abbrevation: timeZoneAbbrebiation)
            }
        }
        
        //        delegate?.timeZoneChanged(abbrevation: _continent + "/" + _zone)
    }
    
    
}
