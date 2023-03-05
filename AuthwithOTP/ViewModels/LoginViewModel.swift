//
//  LoginViewModel.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 05/03/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var phNo = ""
    
    //getting Country phone Code...
    
    func getCountryCode() -> String {
        let regionCode = Locale.current.regionCode ?? ""
        return ""
    }
}
