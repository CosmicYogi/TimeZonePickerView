//
//  UITimeZonePickerViewControllerDelegate.swift
//  TimeZonePickerView
//
//  Created by mitesh soni on 17/10/18.
//  Copyright © 2018 Mitesh Soni. All rights reserved.
//

import Foundation

public protocol TimeZonePickerViewControllerDelegate: class {
    func timeZonePicker(_ timeZonePicker: UITimeZonePickerViewController, didSelectTimeZone timeZone: TimeZone)
}
