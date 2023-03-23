//
//  ParametreUIView.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 23/03/2023.
//

import SwiftUI

struct ParametreUIView: View {
    var body: some View {
        VStack(spacing : 15){
            btnView(image: "IconAccount", name: "Compte")
            btnView(image: "iconPrivacy", name: "Confidentialité")
            btnView(image: "IconNotified", name: "Notification")
            btnView(image: "IconHelp", name: "Aides")
            btnView(image: "IconSetting", name: "General")
            btnView(image: "IconAboutUs", name: "A propos de nous")
            Spacer()
        }
        .padding()
    }
}

struct ParametreUIView_Previews: PreviewProvider {
    static var previews: some View {
        ParametreUIView()
    }
}

struct btnView :View {
    var image = ""
    var name = ""
    var body: some View{
        Button(action:{
            
        }){
            HStack (spacing : 15){
                Image(image)
                    .renderingMode(.original)
                    .resizable()
                .frame(width: 40, height: 40)
                Text(name)
                Spacer(minLength: 15)
                Image(systemName: "chevron.right")
            }
            .padding()
            .foregroundColor(.black.opacity(0.5))
            
        }
    }
}
