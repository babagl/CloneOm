//
//  WalletView.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 08/03/2023.
//

import SwiftUI
import Contacts

struct WalletView: View {
    @ObservedObject var loginData = LoginViewModel()
    
    var body: some View {
        
        HomeWalletView(loginData: loginData)
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}

struct HomeWalletView : View {
    
    @State private var qrCodeImage: UIImage?
    @ObservedObject var loginData : LoginViewModel
    @State var showContact = false
    
    @State var visible = false
    var body: some View{
        VStack(spacing: 15){
//            HStack(spacing: 15){
//                Image("Omoney")
//                    .resizable()
//                    .aspectRatio( contentMode: .fill)
//                    .frame(width: 40 , height: 40)
//                Text("Orange Money")
//                    .font(.title)
//                    .fontWeight(.bold)
//                Spacer()
//
//                Button(action: {}){
//                    Image(systemName: "line.3.horizontal.circle")
//                        .font(.title2)
//                        .foregroundColor(.black)
//
//                }
//            }
//            .padding(.top , 5)
//            HStack{
//            Text("Acceuil")
//                    .foregroundColor(Color("OrangeM"))
//                    .fontWeight(.bold)
//            }
//            
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Button(action: {
                        withAnimation{visible.toggle()}
                    }, label: {
                        Image(systemName: visible ? "eye.slash" : "eye" )
                            .foregroundColor(.black)
                            
                        if visible{
                            Text("250000 FR XOF")
                                .foregroundColor(.black)
                                .transition(.opacity)
                        }else{
                            Text("*******")
                                .font(.title)
                                .foregroundColor(.black)
                            
                        }
                    })
                    
                    Text("Solde Principal ")
                }
                Spacer()
            }
            .padding(20)
            .background(Color("OrangeM"))
            .cornerRadius(20)
            
            HStack{
                Text("Envoyer de l'argent")
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    
                }){
                    Image(systemName: "qrcode.viewfinder")
                        .font(.title2)
                        .foregroundColor(.black)
                }
            }.padding(.top)
            ZStack{
                Rectangle().fill(Color("OrangeM")).frame(width: 350,height: 200)
                    .cornerRadius(20)
                
                if let image = loginData.generateQRCode() {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300 ,height: 180)
                        
                }
            }
            HStack{
                Text("Envoie Rapide")
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    showContact.toggle()
                }){
                    Image(systemName: "person.badge.clock")
                        .font(.title2)
                        .foregroundColor(.black)
                }
            }.padding(.top)
                .sheet(isPresented: $showContact){
                    CustomContactHome()
                }
            
            
            ScrollView(.horizontal , showsIndicators: false){
                HStack(spacing: 15){
                    Button(action: {
                        
                    }){
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .foregroundColor(Color("OrangeM"))
                    }
                    ForEach(name,id: \.self){i in
                        
                        VStack (spacing: 10){
                            Image(systemName: "person.circle")
                                .font(.title)
                            Text(i)
                                .foregroundColor(.black.opacity(0.5))
                        }
                        .frame(width : 100 ,height: 80)
                        .padding(.vertical)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(20)
                    }
                }
                .padding(.leading)
            }
            .padding(.top,18)
            
            
            
            HStack{
                Text("Services")
                    .foregroundColor(.black)
                Spacer()
                Button(action: {
                    
                }){
                    Image(systemName: "list.bullet")
                        .font(.title2)
                        .foregroundColor(.black)
                }
            }.padding(.top)
            
            row1().padding(.top, 18)
            row1().padding(.top, 18)
            
            
            
            
        }.padding([.horizontal, .top])
    }
}

struct row1 : View {
    var body: some View{
        HStack(alignment: .top){
            Button(action: {
                
            }){
                VStack(spacing: 8){
                    VStack{
                        Image(systemName: "cart.badge.plus")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(width: 30,height: 30)
                            
                    }
                    .padding()
                    .background(Color("OrangeM"))
                    .cornerRadius(10)
                    Text("Code Marchand")
                        .frame(width: 60)
                        .font(.caption)
                        .foregroundColor(.black.opacity(0.5))
                }
            }
            Spacer(minLength: 15)
            
            Button(action: {
                
            }){
                VStack(spacing: 8){
                    VStack{
                        Image("rapido")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 30,height: 30)
                    }
                    .padding()
                    .background(Color("OrangeM"))
                    .cornerRadius(10)
                    Text("Rapido")
                        .frame(width: 55)
                        .font(.caption)
                        .foregroundColor(.black.opacity(0.5))
                }
            }
            
            Spacer(minLength: 15)
            Button(action: {
                
            }){
                VStack(spacing: 8){
                    VStack{
                        Image("Ism")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 30,height: 30)
                    }
                    .padding()
                    .background(Color("OrangeM"))
                    .cornerRadius(10)
                    Text("Ism")
                        .frame(width: 55)
                        .font(.caption)
                        .foregroundColor(.black.opacity(0.5))
                }
            }
            
            Spacer(minLength: 15)
            Button(action: {
                
            }){
                VStack(spacing: 8){
                    VStack{
                        Image(systemName: "arrowshape.zigzag.forward")
                            .font(.title)
                            .foregroundColor(.black)
                            .frame(width: 30,height: 30)
                    }
                    .padding()
                    .background(Color("OrangeM"))
                    .cornerRadius(10)
                    Text("Bicis")
                        .frame(width: 55)
                        .font(.caption)
                        .foregroundColor(.black.opacity(0.5))
                }
            }
        }
    }
}
var name = ["Abdoulaye", "Baba","house","sall"]

