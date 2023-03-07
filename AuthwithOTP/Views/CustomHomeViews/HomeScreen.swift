//
//  HomeScreen.swift
//  BankingApp
//
//  Created by Abdoulaye Aliou SALL on 01/03/2023.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.white).ignoresSafeArea(.all)
                ScrollView(.vertical){
                    CardListView()
                    TransactionView()
                }
                .background(Color("Bg"))
            }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
