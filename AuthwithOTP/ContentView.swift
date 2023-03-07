//
//  ContentView.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 04/03/2023.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("log_Status") var status = false
    var body: some View {
        
        ZStack{
            if status{
                //Home View
                HomeView()
            }
            else{
                NavigationView{
                    Login()
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
