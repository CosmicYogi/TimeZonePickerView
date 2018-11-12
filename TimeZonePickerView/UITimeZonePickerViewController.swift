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
//        showButtonsOnTop()
        self.view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "X", style: .plain, target: self, action: #selector(onLeftBarButtonDown))
        searchResultsTVC = SearchResultsTVC()
//        navigationItem.hidesSearchBarWhenScrolling = true
        createSearchBar()
    }
    
    func showButtonsOnTop(){
        print("laali")
//        let bar = UIView(frame: .zero)
//        view.addSubview(bar)
//        bar.translatesAutoresizingMaskIntoConstraints = false
//        bar.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
//        bar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
//        bar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
//        bar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
//
//        let cancelButton = UIButton(frame: .zero)
//        cancelButton.titleLabel?.text = "X"
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 320, height: 44))
        self.view.addSubview(navBar);
        
        let navItem = UINavigationItem(title: "SomeTitle");
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(selectorName));
        navItem.rightBarButtonItem = doneItem;
        
        searchController = UISearchController(searchResultsController: searchResultsTVC)
        searchController.searchBar.delegate = searchResultsTVC
        searchController.searchResultsUpdater = searchResultsTVC
        searchController.obscuresBackgroundDuringPresentation = true
        navItem.searchController = searchController
        
        definesPresentationContext = true
        searchResultsTVC?.delegate = self
        
        navBar.setItems([navItem], animated: false);
        
        navBar.translatesAutoresizingMaskIntoConstraints = false

        navBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        navBar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        navBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true

        
    }
    
    @objc func selectorName(){
        print("selector down")
        dismiss(animated: true, completion: nil)
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
            delegate?.timeZonePickerView(self, didSelectTimeZone: timeZone)
//            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        } else {
//            navigationController?.popViewController(animated: true)
            dismiss(animated: true, completion: nil)
        }
    }
    
    
}
