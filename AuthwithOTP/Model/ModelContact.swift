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
    init(id: UUID = UUID(), givenName: String, familyName: String, phoneNumber: String) {
        self.id = id
        self.givenName = givenName
        self.familyName = familyName
        self.phoneNumber = phoneNumber
    }

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

struct Devices :Identifiable {
    let id: Int
    let nameOfdevices : String
    let dateOfConnected : Date
    let typeOfDevices : String
    let Online : Bool
}

var devices = [
    Devices(id: 1, nameOfdevices: "Apple Watch Serie 6", dateOfConnected: NSDate() as Date, typeOfDevices: "applewatch", Online: true),
    Devices(id: 2, nameOfdevices: "Mac OS Ventura", dateOfConnected: NSDate() as Date, typeOfDevices: "laptopcomputer",Online: false),
    Devices(id: 3, nameOfdevices: "Iphone 13 pro max IOS 16", dateOfConnected: NSDate() as Date, typeOfDevices: "iphone", Online: true)

]

struct Formules :Identifiable{
    let id : Int
    let nameFormule :String
    let montant :String
    let nombreDeMega: String
    let validite : String
}

var formules = [
    Formules(id: 1, nameFormule: "internet", montant: "1000FCFA", nombreDeMega: "3G0", validite: "3 jours"),
    Formules(id: 2, nameFormule: "internet", montant: "2000FCFA", nombreDeMega: "4G0", validite: "1 mois"),
    Formules(id: 3, nameFormule: "internet", montant: "1000FCFA", nombreDeMega: "3G0", validite: "3 jours"),
    Formules(id: 4, nameFormule: "internet", montant: "1000FCFA", nombreDeMega: "3G0", validite: "3 jours")
]
struct Service : Identifiable {
    let id : Int
    let nameOfService: String
    let image:String
}

var services = [
    Service(id: 1, nameOfService: "Code Marchand", image: "IconePanier"),
    Service(id: 2, nameOfService: "Carte Rapido", image: "rapido"),
    Service(id: 3, nameOfService: "Ism\n", image: "Ism"),
    Service(id: 4, nameOfService: "Bicis\n", image: "Bicis")
]
