//
//  WalletView.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 08/03/2023.
//

import SwiftUI
import Contacts
import CodeScanner

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
    @State private var addExpense : Bool = false
    @State private var addUpdateExpense : Bool = false
    @State var showService : Bool = false
    @State var scanView : Bool = false
    
    
    
    @State var visible = false
    var body: some View{
            VStack(spacing: 15){
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
                        scanView.toggle()
                    }){
                        Image(systemName: "qrcode.viewfinder")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }
                .padding(.leading)
                .padding(.top)
                
                Button(action:{
                    scanView.toggle()
                }){
                    ZStack{
                        Rectangle().fill(Color("OrangeM")).frame(width: 350,height: 200)
                            .cornerRadius(20)
                        VStack{
                            if let image = loginData.generateQRCode() {
                                Image(uiImage: image)
                                    .resizable()
                                    .interpolation(.none)
                                    .scaledToFit()
                                    .frame(width: 300 ,height: 180)
                            }
                            
                        }
                    }
                }
                .sheet(isPresented: $scanView){
                    ScannerView()
                }
                
                HStack{
                    Text("Envoie Rapide")
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: {
                        
                        addExpense.toggle()
                    }){
                        Image(systemName: "person.badge.clock")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }.padding(.top)
                    .sheet(isPresented: $addExpense){
                        CustomContactHome()
                    }
                    .padding(.leading)
                
                
                ScrollView(.horizontal , showsIndicators: false){
                    HStack(spacing: 15){
                        Button(action: {
                            showContact.toggle()
                        }){
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundColor(Color("OrangeM"))
                        }
                        
                        ForEach(loginData.contacts.filter{$0.phoneNumber.contains("853")}){i in
                                NavigationLink(destination: AddUpdateExpensive(contactModel: i, navTitle: "Envoie Rapide"), label: {
                                    VStack (spacing: 10){
                                        Image(systemName: "person.circle")
                                            .font(.title)
                                            .foregroundColor(Color("OrangeM"))
                                        Text("\(i.givenName) \(i.familyName)")
                                            .foregroundColor(.black.opacity(0.5))
                                            .frame(width:90)
                                    }
                                    .frame(width : 100 ,height: 80)
                                    .padding(.vertical)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(20)
                                })
                            }
                    }
                    .sheet(isPresented: $showContact){
                        
                        AddNewExpense(navTitle: "Nouvel envoie")
                        ///costumizing sheet
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.hidden)
                            .interactiveDismissDisabled()
                    }
                }
                .padding(.top,18)
                .padding(.leading)
                
                
                
                HStack{
                    Text("Services")
                        .foregroundColor(.black)
                    Spacer()
                    Button(action: {
                        showService.toggle()
                    }){
                        Image(systemName: "list.bullet")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                }.padding(.top)
                    .padding(.leading)
                    .sheet(isPresented: $showService){
                        HistoriqueHomeView()
                    }
                
                row1().padding(.top, 18)
                
                
                
            }.padding([.horizontal, .top] ,10)
            .onAppear{loginData.fetchContacts()}
        
        
    }

}

struct row1 : View {
    @State var showFormServices = false
    @State var serviceName = ""
    var body: some View{
        HStack(alignment: .center, spacing: 35){
            ForEach(services){service in
            Button(action: {
                showFormServices.toggle()
                self.serviceName = service.nameOfService
            }){
                VStack(spacing: 8){
                    VStack{
                        Image(service.image)
                            .resizable()
                            .foregroundColor(.black)
                            .frame(width: 30,height: 30)
                            
                    }
                    .padding()
                    .background(Color("OrangeM"))
                    .cornerRadius(10)
                    Text(service.nameOfService)
                        .frame(width: 60)
                        .font(.caption)
                        .foregroundColor(.black.opacity(0.5))
                }
                .sheet(isPresented: $showFormServices){
                    ExpenceHomeServiceView(title: $serviceName)
                    ///costumizing sheet
                        .presentationDetents([.medium])
                        
                }
            }
            //Spacer(minLength: 40)
            }
            
            
            
//            Button(action: {
//
//            }){
//                VStack(spacing: 8){
//                    VStack{
//                        Image("rapido")
//                            .resizable()
//                            .aspectRatio( contentMode: .fit)
//                            .frame(width: 30,height: 30)
//                    }
//                    .padding()
//                    .background(Color("OrangeM"))
//                    .cornerRadius(10)
//                    Text("Rapido")
//                        .frame(width: 55)
//                        .font(.caption)
//                        .foregroundColor(.black.opacity(0.5))
//                }
//            }
            
//            Spacer(minLength: 15)
//            Button(action: {
//
//            }){
//                VStack(spacing: 8){
//                    VStack{
//                        Image("Ism")
//                            .resizable()
//                            .aspectRatio( contentMode: .fit)
//                            .frame(width: 30,height: 30)
//                    }
//                    .padding()
//                    .background(Color("OrangeM"))
//                    .cornerRadius(10)
//                    Text("Ism")
//                        .frame(width: 55)
//                        .font(.caption)
//                        .foregroundColor(.black.opacity(0.5))
//                }
//            }
            
//            Spacer(minLength: 15)
//            Button(action: {
//
//            }){
//                VStack(spacing: 8){
//                    VStack{
//                        Image(systemName: "arrowshape.zigzag.forward")
//                            .font(.title)
//                            .foregroundColor(.black)
//                            .frame(width: 30,height: 30)
//                    }
//                    .padding()
//                    .background(Color("OrangeM"))
//                    .cornerRadius(10)
//                    Text("Bicis")
//                        .frame(width: 55)
//                        .font(.caption)
//                        .foregroundColor(.black.opacity(0.5))
//                }
//            }
        }
        .padding(.leading,5)
        
        
        
    }
}
var name = ["Abdoulaye", "Baba","house","sall"]



