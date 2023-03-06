//
//  Login.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 05/03/2023.
//

import SwiftUI

struct Login: View {
    @StateObject var loginData = LoginViewModel()
    @State var isSmall = UIScreen.main.bounds.height < 750
    
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
                Text("vous recevrez un code à 6 chiffres \npour vérifier la prochaine étape")
                    .font(isSmall ? .none : .title2)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding()
                
                //mobile number Field
                
                HStack{
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Entrer votre numero")
                            .font(.title3)
                        .foregroundColor(.gray)
                        Text("+\(loginData.getCountryCode())  \(loginData.phNo)")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    Spacer(minLength: 0)
                    
                    NavigationLink(destination: Verification(loginData: loginData)){
                        Text("Continue")
                            .foregroundColor(.black)
                            .padding(.vertical, 18)
                            .padding(.horizontal, 38)
                            .background(Color("OrangeM"))
                            .cornerRadius(15)
                    }
                    .disabled(loginData.phNo == "" ? true: false)
                    
                }
                .padding()
                .background(.white)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: -5)
                
            }
            .frame(height: UIScreen.main.bounds.height / 1.8)
            .background(.white)
            
            //Costum number Pad
            CustomNumberPad(value: $loginData.phNo, isVerify: false)
        }
        .background(Color("Bg").ignoresSafeArea(.all, edges: .bottom))
    }
    
    func buttonAction(value: String) {
        if value == "delete.left" && loginData.phNo != "" {
            loginData.phNo.removeLast()
        }
        
        if value != "delete.left"{
            loginData.phNo.append(value)
        }
    }
}

//getting height and width for dynamic sizing
func getWidth(frame: CGRect) -> CGFloat{
    let width = frame.width
    let actualWidth = width - 40
    return actualWidth / 3
}

func getHeight(frame : CGRect) -> CGFloat{
    let height = frame.height
    let actualHeight = height - 30
    return actualHeight / 4
}





struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
