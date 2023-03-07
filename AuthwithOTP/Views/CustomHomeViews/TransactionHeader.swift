//
//  TransactionHeader.swift
//  BankingApp
//
//  Created by Abdoulaye Aliou SALL on 01/03/2023.
//

import SwiftUI

struct TransactionHeader: View {
    var body: some View {
        HStack{
            Text("Envoyer de l'argent")
                .font(.headline)
            Spacer()
            Image(systemName: "plus.circle.fill")
                .resizable()
                .foregroundColor(Color("OrangeM"))
                .frame(width: 30,height: 30)
            Text("Contact")
                .font(.headline)
        }
        .padding(20)
        .padding(.bottom, 40)
        .foregroundColor(.white)
        .background(Color.black)
        .cornerRadius(20)
        .offset(x:0 , y: 20)
    }
}

struct TransactionHeader_Previews: PreviewProvider {
    static var previews: some View {
        TransactionHeader()
            .previewLayout(.sizeThatFits)
    }
}
