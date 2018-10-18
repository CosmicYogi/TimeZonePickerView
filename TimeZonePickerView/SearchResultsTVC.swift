//
//  SearchResultsTVC.swift
//  Movie Browser
//
//  Created by mitesh soni on 12/07/18.
//  Copyright © 2018 Mitesh Soni. All rights reserved.
//

import UIKit

class SearchResultsTVC: UITableViewController {

    // MARK:- Variables
    let timeZones = TimeZone.knownTimeZoneIdentifiers
    var filteredTimeZones = TimeZone.knownTimeZoneIdentifiers
    var searchText = ""
    
    
    // MARK:- View appearence and loading
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TimeZoneTableViewCell.self, forCellReuseIdentifier: "TimeZoneCell")
        
    }

    
    // MARK:- UITableView delegates and datasources

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredTimeZones.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimeZoneCell", for: indexPath) as! TimeZoneTableViewCell
        cell.textLabel?.text = filteredTimeZones[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("search result tapped", filteredTimeZones[indexPath.row])

        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
}

extension SearchResultsTVC: UISearchResultsUpdating, UISearchBarDelegate{
    
    // MARK:- UISearchResultsUpdating
    func updateSearchResults(for searchController: UISearchController) {
        print("update search results")
        searchController.searchResultsController?.view.isHidden = false
        tableView.reloadData()
    }
    
    
    // MARK:- UISearchBarDelegates
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchText = searchText
        
        if searchText == ""{
            filteredTimeZones = timeZones
        } else{
            filteredTimeZones = timeZones.filter{$0.lowercased().contains(searchText.lowercased())}
        }
        
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        filteredTimeZones = TimeZone.knownTimeZoneIdentifiers
        tableView.reloadData()
    }
    
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        filteredTimeZones = TimeZone.knownTimeZoneIdentifiers
        tableView.reloadData()
        return true
    }
    
    
}
