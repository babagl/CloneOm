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
    @State var seletedTab = "house"
    var body: some View {
        ZStack(alignment: .bottom, content: {

            NavigationView {
                MainView()
            }
            
            
            //CustomTabBAr(selectedTab: $seletedTab)
            
   
            
            
        })
        
        
//        Button(action:{
//            //login out
//            try? Auth.auth().signOut()
//            status.toggle()
//        }, label: {
//            Text("Logout")
//                .fontWeight(.heavy)
//        })

    }
}

struct home : View {
    var body: some View{
        Text("BABA GALLE")
//        Color("Bg")
//            .ignoresSafeArea(.all)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
