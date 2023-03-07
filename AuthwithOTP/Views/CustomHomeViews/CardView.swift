//
//  CardView.swift
//  BankingApp
//
//  Created by Abdoulaye Aliou SALL on 28/02/2023.
//

import SwiftUI

struct CardView: View {
    @State var isSelected: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Spacer()
                Image("orange")//logo
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40 , height: 20)
                    .foregroundColor(Color(isSelected ? .white : .black))
                    
            }
            Spacer()
            Text("Balance")
            .foregroundColor(Color(isSelected ? .white : .black))
                .font(.caption)
                .padding(.bottom, 5)
            HStack(alignment: .center){
                Text("XOF").foregroundColor(Color(isSelected ? .white : .black))
                    .font(.caption)
                Text("17,370.1 FCFA")
                    .foregroundColor(Color(isSelected ? .white : .black))
                    .font(.headline)
                    .fontWeight(.heavy)
            }
            .padding(.bottom)
            Spacer()
            Text("**** **** **** 3222")
                .foregroundColor(Color(isSelected ? .white : .black))
                .font(.caption)
                .padding(.bottom)
        }
        .frame(width: 150,height: 170)
        .padding(8)
        .background(Color(isSelected ? .orange : .white))
        .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(isSelected: true)
                .previewLayout(.sizeThatFits)
            CardView(isSelected: true)
                .previewLayout(.sizeThatFits)
        }
    }
}
