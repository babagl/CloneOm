//
//  ModelContact.swift
//  SearchList
//
//  Created by Abdoulaye Aliou SALL on 13/03/2023.
//

import Foundation
struct Contact: Identifiable {
    var id = UUID()
    var givenName: String
    var familyName: String
    var phoneNumber: String
}
struct Friend {
    var name:String
    var detail : String
    var image : String
}

var friends = [
    
    Friend (name: "iJustine", detail: "5 Miles Away", image: "justine"),
    Friend (name: "Kaviya", detail: "9.5 Miles Away", image: "animoji3"),
    Friend (name:"Tom", detail: "3 Miles Away", image: "animoji1"),
    Friend (name:"Oliver", detail: "4 Miles Away", image: "animoji2"),
    Friend (name: "Anna", detail: "1 Miles Away", image: "animoji3"),
    Friend (name:"Steve", detail: "2 Miles Away", image: "animojil"),
    Friend (name:"Jenna", detail: "10 Miles Away", image: "animoji3"),
    Friend (name:"Creg", detail: "1 Miles Away", image: "animoji2"),
    Friend (name: "Tom Land", detail: "3 Miles Away", image: "animoji1"),
    Friend (name: "Tom", detail: "3 Miles Away", image: "animojil"),
    Friend (name: "Oliver", detail: "4 Miles Away", image: "animoji2"),
    Friend (name:"Anna", detail: "1 Miles Away", image: "animoji3"),
    Friend (name:"Steve", detail: "2 Miles Away", image: "animojil"),
    Friend (name:"Jenna", detail: "10 Miles Away", image: "animoji3"),
    Friend (name:"Creg", detail: "1 Miles Away", image: "animoji2"),
    Friend (name:"Tom Land", detail: "3 Miles Away", image: "animoji1"),
    
]
