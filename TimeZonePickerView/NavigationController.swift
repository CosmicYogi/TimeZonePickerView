//
//  NavigationController.swift
//  TimeZonePickerView
//
//  Created by Mitesh Soni on 22/10/18.
//  Copyright © 2018 Mitesh Soni. All rights reserved.
//

import UIKit

public class NavigationController: UINavigationController {

    public var vc = UITimeZonePickerViewController()
    override public func viewDidLoad() {
//        super.viewDidLoad()

        
        setViewControllers([vc], animated: true)
//        navigationController?.pushViewController(vc, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
