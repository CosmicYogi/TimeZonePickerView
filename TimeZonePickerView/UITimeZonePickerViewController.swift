//
//  TimeZonePickerViewController.swift
//  TimeZonePickerView
//
//  Created by mitesh soni on 17/10/18.
//  Copyright © 2018 Mitesh Soni. All rights reserved.
//

import UIKit

public class UITimeZonePickerViewController: UIViewController {

    var searchResultsTVC: SearchResultsTVC?
    var searchController: UISearchController!
    
    var timeZoneIdentifiers = TimeZone.knownTimeZoneIdentifiers
    
    public var delegate: TimeZonePickerViewControllerDelegate?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "X", style: .plain, target: self, action: #selector(onLeftBarButtonDown))
        searchResultsTVC = SearchResultsTVC()
//        navigationItem.hidesSearchBarWhenScrolling = true
        createSearchBar()
    }
    
    
    public override func viewDidAppear(_ animated: Bool) {
        self.searchController.isActive = true
    }
    @objc func onLeftBarButtonDown(){
        dismiss(animated: true, completion: nil)
    }
    /**
     Creates and set up search bar.
     */
    func createSearchBar(){
        searchController = UISearchController(searchResultsController: searchResultsTVC)
        searchController.searchBar.delegate = searchResultsTVC
        searchController.searchResultsUpdater = searchResultsTVC
        searchController.obscuresBackgroundDuringPresentation = true
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchResultsTVC?.delegate = self
    }
    
    override public func viewDidDisappear(_ animated: Bool) {
        searchController.isActive = false
    }

}

extension UITimeZonePickerViewController: SearchConnectionDelegate{
    func selectedTimeZone(timeZone: TimeZone?) {
        print("selected time zone in search vc is", timeZone)
        
        if let timeZone = timeZone{
            // do operation call another delegate
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    
}
