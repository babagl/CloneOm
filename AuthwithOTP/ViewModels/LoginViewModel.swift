//
//  LoginViewModel.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 05/03/2023.
//

import Foundation
import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    @Published var phNo = ""
    @Published var code = ""
    
    //getting Country phone Code...
    
    
    //DataModel for ErrorView ...
    @Published var errorMessage = ""
    @Published var error = false
    
    
    //storing Code for verification ...
    @Published var CODE = ""
    
    @Published var gotoVerify = false
    
    
    //User Logged Status
    @AppStorage("log_Status") var status = false
    
    //loadingView
    @Published var loading = false
    
    func getCountryCode() -> String {
        let regionCode = Locale.current.regionCode ?? ""
        print("mon code est")
        print(regionCode)
        print(countries[regionCode] ?? "")
        return countries[regionCode] ?? ""
    }
    
    // Sending Code To User
    
    func sendCode(){
        
        //enabling testing code
        //desable when you need to test with a real device
//        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        
        let number = "+\(getCountryCode())\(phNo)"
        PhoneAuthProvider.provider().verifyPhoneNumber(number, uiDelegate: nil){(CODE ,err) in
            if let error = err{
                self.errorMessage = error.localizedDescription
                withAnimation{ self.error.toggle()}
                return
            }
            
            self.CODE = CODE!
            self.gotoVerify = true
        }
    }
    
    
    func verifyCode(){
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.CODE, verificationCode: code)
        print("i'm here")
        print(code)
        print("i'm here")
        print(self.CODE)
        print("i'm here")
        loading = true
        Auth.auth().signIn(with: credential){(result , err) in
            self.loading = false
            if let error = err {
                self.errorMessage = error.localizedDescription
                print(self.errorMessage)
                withAnimation{ self.error.toggle()}
                return
            }
            //else user logged in successfully ...
            self.status = true
            print("user logged successfully")
        }
    }
    
    
    func requestCode(){
        sendCode()
        withAnimation{
            self.errorMessage = "Code envoyé avec success"
            self.error.toggle()
        }
    }
}
