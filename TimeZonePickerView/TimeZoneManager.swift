//
//  TimeZoneManager.swift
//  RosterBuster
//
//  Created by Mitesh Soni on 15/10/18.
//
import Foundation

class TimeZoneManager{
    
    var continents = [String]()
    private var timeZonesList = [String: [String]]()
    var timeZones: [String: [String]]{
        get{
            
            for timeZone in TimeZone.knownTimeZoneIdentifiers{
                let continent = timeZone.components(separatedBy: "/")[0]
                if !continents.contains(continent){
                    continents.append(continent)
                }
                var timeZonesInContinent = timeZonesList[continent] ?? [String]()
                if let zone = timeZone.components(separatedBy: "/").last{
                    if !timeZonesInContinent.contains(zone){
                        timeZonesInContinent.append(zone)
                    }
                }
                timeZonesList[continent] = timeZonesInContinent
            }
            return timeZonesList
        }
    }
    
    
    
    static let shared = TimeZoneManager()
    private init(){
    }
}
