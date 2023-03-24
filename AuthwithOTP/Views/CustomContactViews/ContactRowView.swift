//
//  ContactRowView.swift
//  SearchList
//
//  Created by Abdoulaye Aliou SALL on 13/03/2023.
//

import SwiftUI

struct ContactRowView: View {
    var contact :Contact
    var body: some View {
        HStack(spacing: 15){
            Image("profil")
                .resizable()
                .aspectRatio( contentMode: .fill)
                .frame(width: 60,height: 60)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 8 , content: {
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.black.opacity(0.8))
                    Text(": "+contact.givenName+" "+contact.familyName)
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.8))
                }
                HStack {
                    Image(systemName: "numbersign")
                        .foregroundColor(.black.opacity(0.5))
                    Text(": "+contact.phoneNumber)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            Button( action: {} , label: {
                Image("SendMoney")
                    .foregroundColor(Color("OrangeM"))
                    .padding()
                    .background(Color("OrangeM").opacity(0.2))
                    .clipShape(Circle())
            })
        }
        .padding(.horizontal)
        }
}

struct ContactRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
