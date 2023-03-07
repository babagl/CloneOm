//
//  CardListView.swift
//  BankingApp
//
//  Created by Abdoulaye Aliou SALL on 01/03/2023.
//

import SwiftUI

struct CardListView: View {
    var body: some View {
        CardList()
    }
    
    struct CardList:View {
        var body: some View{
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(0..<10, id: \.self){ item in
                        CardView(isSelected: item == 0)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y:5)
                        
                    }
                }
                .padding(20)
            }
            .navigationTitle("Orange Money")
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
    }
}
