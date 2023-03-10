//
//  OtpVerificationView.swift
//  VerifyOtpView
//
//  Created by Abdoulaye Aliou SALL on 10/03/2023.
//

import SwiftUI

struct OtpVerificationView: View {
    @ObservedObject var loginData : LoginViewModel
    @State var otpText: String = ""
    @FocusState private var isKeyboardShowing: Bool
    var body: some View {
        //View all propreties
        ZStack {
            VStack{
                Text("Verification")
                    .font(.largeTitle.bold())
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                if loginData.loading{ProgressView()}
                
                Text("code envoyé sur \(loginData.phNo)")
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                HStack(spacing: 0){
                    ///- Otp Text boxes
                    ///Change Count  based on your otp  Text size
                    ForEach(0..<6, id: \.self){index in
                        OtpTextBox(index)
                    }
                }.background(content: {
                    TextField("", text: $otpText.limit(6))
                        .keyboardType(.numberPad)
                        .textContentType(.oneTimeCode)
                        .frame(width: 1,height: 1)
                        .opacity(0.001)
                        //.blendMode(.screen)
                        .focused($isKeyboardShowing)
                })
                .contentShape(Rectangle())
                .onTapGesture {
                    isKeyboardShowing.toggle()
                }
                .padding(.bottom , 20)
                .padding(.top, 10)
                
                Button(action:{
                    loginData.code = otpText
                    loginData.verifyCode()
                }) {
                    Text("Verifier et continuer")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.vertical , 12)
                        .frame(maxWidth: .infinity)
                        .background{
                            RoundedRectangle(cornerRadius: 5,style: .continuous).fill(.orange)
                        }
                }
                .disableWithopacity(otpText.count < 6)
                
                HStack(spacing: 6){
                    Text("Vous n'avez pas reçu de code?")
                        .foregroundColor(.gray)
                    
                    Button(action:{loginData.requestCode()}){
                        Text("Renvoyer")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
            }
            .padding(.all)
            .frame(maxHeight: .infinity, alignment: .top)
            .background(.white)
            .foregroundColor(.black)
            .toolbar {ToolbarItem(placement: .keyboard){
                Button("Done"){
                    print($otpText)
                    isKeyboardShowing.toggle()
                    print("je suis le code otp")
                }
                .frame(maxWidth: .infinity , alignment: .trailing)
            }
            }
            if loginData.error{
                AlertView(msg: loginData.errorMessage, show: $loginData.error)
            }
        }
    }
    //Mark : OTp Text BOX
    @ViewBuilder
    func OtpTextBox(_ index : Int) -> some View {
        ZStack{
            if otpText.count > index{
                // - finding Char at index
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex , offsetBy: index)
                let CharToString = String(otpText[charIndex])
                Text(CharToString)
                
            }else{
                
            }
        }.frame(width: 45,height: 45)
            .background{
                // - highlighting Current Ative box
                let status = (isKeyboardShowing && otpText.count == index)
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(status ? .orange
                        : .gray,lineWidth: status ? 1 : 0.5)}
            .frame(maxWidth: .infinity)
    }
    
}

//struct OtpVerificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        OtpVerificationView()
//    }
//}

//View extension...
extension View{
    func disableWithopacity(_ condition : Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1)
    }
}

//Binding <String> Extension
extension Binding where Value == String {
    func limit (_ length : Int) ->Self{
        if self.wrappedValue.count > length{
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}
