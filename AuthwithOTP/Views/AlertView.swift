//
//  AlertView.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 06/03/2023.
//

import SwiftUI

struct AlertView: View {
    var msg : String
    @Binding var show : Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15, content: {
            Text("Message")
                .fontWeight(.bold)
                .foregroundColor(.gray)
            Text(msg)
                .foregroundColor(.gray)
            
            Button(action: {
                //Closing Popup
                show.toggle()
                    
            }, label: {
                Text("Fermer")
                    .foregroundColor(.black)
                    .frame(width: 100,height: 50)
                    .background(Color("OrangeM"))
                    .cornerRadius(15)
            })
            //Centering the Button
            .frame(alignment: .center)
        })
        .padding()
        .background(Color.white)
        .cornerRadius(15)
        .padding(.horizontal, 25)
        
        //Background Dimension
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.3).ignoresSafeArea())
    }
}

//struct AlertView_Previews: PreviewProvider {
//    static var previews: some View {
//        AlertView()
//    }
//}
