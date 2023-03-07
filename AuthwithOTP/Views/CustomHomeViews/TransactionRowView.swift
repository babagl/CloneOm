//
//  TransactionRowView.swift
//  BankingApp
//
//  Created by Abdoulaye Aliou SALL on 01/03/2023.
//

import SwiftUI

struct TransactionRowView: View {
    var body: some View {
        
                HStack{
                    Image("orange")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30 , height: 30)
                        .padding(5)
                    VStack{
                        Text("Sall")
                            .font(.headline)
                            .foregroundColor(Color("blackColor"))
                        Text("12/nov/2022")
                            .font(.caption)
                            .foregroundColor(Color("GrayColor"))
                    }
                    Spacer()
                    Text("-600.00FCFA")
                        .font(.headline)
                        .foregroundColor(Color.red)
                }
                .padding(8)
                .background(Color("Bg"))
                .cornerRadius(15)
            
    }
}

struct TransactionRowView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRowView()
    }
}
