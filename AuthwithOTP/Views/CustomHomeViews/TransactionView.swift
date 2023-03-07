//
//  TransactionView.swift
//  BankingApp
//
//  Created by Abdoulaye Aliou SALL on 01/03/2023.
//

import SwiftUI

struct TransactionView: View {
    var body: some View {
        //header
        VStack(spacing: -20 ){
            TransactionHeader()
            LazyVStack{
                ForEach(0..<10 , id : \.self){item in
                    TransactionRowView()
                }
            }
            .background(Color("Bg"))
            .cornerRadius(20)
        }
        .padding(.horizontal)
    }
}



struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
            .previewLayout(.sizeThatFits)
    }
}
