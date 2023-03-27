//
//  ProfileView.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 23/03/2023.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 510, height: 510)
                    .foregroundColor(Color("OrangeM"))
                    .padding(.top, -300)
                VStack {
                    Text("Abdoulaye Aliou SALL")
                        .font(.title)
                    .fontWeight(.bold)
                    Text("N°: 77 853 21 04")
                        .fontWeight(.bold)
                }
                
                VStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }){
                            Text("Retour")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.leading , 90)
                                Spacer()
                        }
                    }
                    Spacer()
                }
            }
            
            
            VStack{
                ProfileSubview()
            }
            .padding(.top, -150)
                
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileSubview : View {
    var body: some View{
        
        VStack{
            ZStack {
                Button(action: {}){
                    ZStack {
                        Image("profil")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fill)
                        //.border(Color.gray , width: 2)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.black.opacity(0.3), lineWidth: 3)
                            )
                            .frame(width: 100, height: 100)
                        //.padding(.top, -80)
                        Image(systemName: "plus.app.fill")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("OrangeM"))
                            .padding(.leading,60)
                            .padding(.top,80)
                    }
                    
                }
                    
            }
                
            VStack{
                btnView(image: "PassCodeIcon", name: "Changer Code Secret")
                btnView(image: "NumberPadIcons", name: "Ajouter un Numero")
                btnView(image: "PlafondIcon", name: "Deplafonnement")
                btnView(image: "IconPlan", name: "Planifier un envoie")
                btnView(image: "UserAccount", name: "Changer de numero")
                
                Spacer()
            }
            .padding()
        }
        .padding(.top)

        }
}
