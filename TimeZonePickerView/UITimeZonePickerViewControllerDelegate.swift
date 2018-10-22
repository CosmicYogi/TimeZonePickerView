//
//  UITimeZonePickerViewControllerDelegate.swift
//  TimeZonePickerView
//
//  Created by mitesh soni on 17/10/18.
//  Copyright © 2018 Mitesh Soni. All rights reserved.
//

import Foundation

public protocol TimeZonePickerViewControllerDelegate: class {
    func timeZonePickerView(_ timeZonePickerViewController: UITimeZonePickerViewController, didSelectTimeZone timeZone: TimeZone)
}
