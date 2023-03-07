//
//  HomeView.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 06/03/2023.
//

import SwiftUI
import Firebase

struct HomeView: View {
    @AppStorage("log_Status") var status = false
    var body: some View {
        VStack {
            Text("Logged In Successfully")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.black)
        
        Button(action:{
            //login out
            try? Auth.auth().signOut()
            status.toggle()
        }, label: {
            Text("Logout")
                .fontWeight(.heavy)
        })
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
