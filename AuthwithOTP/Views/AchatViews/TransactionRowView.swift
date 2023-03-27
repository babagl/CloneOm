//
//  TransactionRowView.swift
//  BankingApp
//
//  Created by Abdoulaye Aliou SALL on 01/03/2023.
//

import SwiftUI

struct TransactionRowView: View {
    
    var body: some View {
        
        List(devices){dev in
            devicesView(mydevices: dev)
        }
    }
}

struct TransactionRowView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRowView()
    }
}

struct devicesView : View {
    let mydevices : Devices
    
    var body: some View{
        HStack{
            Image(systemName: mydevices.typeOfDevices)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color("OrangeM"))
                .frame(width: 30 , height: 30)
                .padding(5)
            VStack{
                HStack {
                    Text(mydevices.nameOfdevices)
                        .font(.headline)
                    Spacer()
                }
                Text("\(mydevices.dateOfConnected)")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text(mydevices.Online ? "online" : "offline")
                .font(.headline)
                .foregroundColor(mydevices.Online ? .green : .red)
        }
        .padding(8)
    }
}
