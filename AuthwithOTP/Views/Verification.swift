//
//  Verification.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 06/03/2023.
//

import SwiftUI

struct Verification: View {
    @ObservedObject var loginData : LoginViewModel
    @Environment(\.presentationMode) var present
    var body: some View {
        VStack {
            
            
            VStack{
                
                
                HStack{
                    Button(action: {present.wrappedValue.dismiss()}){
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Text("Vérifier le numéro")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    Spacer()
                }
                .padding()
                Text("code envoyé sur \(loginData.phNo)")
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Spacer(minLength: 0)
                HStack(spacing: 15) {
                    ForEach(0..<6, id:\.self){index in
                        //displaying code...
                        CodeView(code: getCodeAtIndex(index: index))
                    }
                }
                .padding()
                .padding(.horizontal, 20)
                Spacer(minLength: 0)
                
                HStack(spacing: 6){
                    Text("Vous n'avez pas reçu de code?")
                        .foregroundColor(.gray)
                    
                    Button(action:{}){
                        Text("Renvoyer")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
                
                Button(action:{}){
                    Text("Obtenir par appel")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding(.top, 6)
                Button(action: { }){
                    Text("Verifier et creer un compte ")
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color("OrangeM"))
                        .cornerRadius(15)
                }
                .padding()
            }
            .frame(height: UIScreen.main.bounds.height / 1.8)
            .background(Color.white)
            .cornerRadius(20)
            
            CustomNumberPad(value: $loginData.code, isVerify: true)

        }
        .background(Color("Bg").ignoresSafeArea(.all , edges: .bottom))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    // getting Code At Each Index
    func getCodeAtIndex(index : Int)-> String{
        if loginData.code.count > index{
            let start = loginData.code.startIndex
            
            let current = loginData.code.index(start, offsetBy: index)
            
            return String(loginData.code[current])
        }
        return ""
    }
}

struct CodeView : View {
    var code : String
    var body: some View{
        VStack(spacing: 10){
            Text(code)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .font(.title2)
            //default frame...
                .frame(height: 45)
            Capsule()
                .fill(.gray.opacity(0.5))
                .frame(height: 4)
        }
    }
}

//struct Verification_Previews: PreviewProvider {
//    static var previews: some View {
//        Verification()
//    }
//}
 
