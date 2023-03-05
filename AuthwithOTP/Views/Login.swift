//
//  Login.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 05/03/2023.
//

import SwiftUI

struct Login: View {
    @StateObject var loginData = LoginViewModel()
    
    var body: some View {
        VStack{
            VStack{
                Text("Continuez avec votre numero de Téléphone")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    
                
                Image("Omoney")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                Text("vous recevrez un code à 4 chiffres \npour vérifier la prochaine étape")
                    .font(.title2)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
                //mobile number Field
                
                HStack{
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Entrer votre numero")
                            .font(.title3)
                        .foregroundColor(.gray)
                        Text(loginData.phNo)
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    Spacer(minLength: 0)
                    
                    Button(action: {
                    }){
                        Text("Continue")
                            .foregroundColor(.black)
                            .padding(.vertical, 18)
                            .padding(.horizontal, 38)
                            .background(.orange)
                            .cornerRadius(15)
                    }
                    
                }
                .padding()
                .background(.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -5)
                
            }
            .frame(height: UIScreen.main.bounds.height / 1.8)
            .background(.white)
            Spacer()
        }
        .background(Color("Bg").ignoresSafeArea(.all, edges: .bottom))
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
