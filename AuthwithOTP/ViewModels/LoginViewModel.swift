//
//  LoginViewModel.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 05/03/2023.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var phNo = ""
    @Published var code = ""
    
    //getting Country phone Code...
    
    func getCountryCode() -> String {
        let regionCode = Locale.current.regionCode ?? ""
        print("mon code est")
        print(regionCode)
        print(countries[regionCode] ?? "")
        return countries[regionCode] ?? ""
    }
}
