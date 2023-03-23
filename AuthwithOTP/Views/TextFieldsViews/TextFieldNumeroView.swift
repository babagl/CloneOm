//
//  TextFieldNumeroView.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 10/03/2023.
//

import SwiftUI

struct TextFieldNumeroView: View {
    @State var bill :CGFloat = 750
    @State var offset : CGFloat = 0
    @State var montantFlex = "0"
    var totalAmount : CGFloat = 750
    //var totalAmount : CGFloat
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            VStack(spacing: 15){
                TextField("Montant", text: $montantFlex)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                    .padding(.top , 50)
                    .keyboardType(.numberPad)
                if (Int(montantFlex) ?? 00 >= 2500){
                    HStack {
                        Text("SOLDE INSUFFISANT")
                            .font(.caption)
                        .foregroundColor(.red)
                        .padding(.horizontal)
                        Spacer()
                    }
                    
                }
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.orange)
                    .padding(.leading, 16)
                    .padding(.trailing, 16)
                
                Text(montantFlex+" FRANCS")
                    .fontWeight(.bold)
                    .font(.title3)
                    .frame(width: 220,height: 80)
                    .background(.gray)
                    .cornerRadius(10)
                
                
                
                HStack {
                    VStack {
                        Text("Internet")
                            .font(.title2)
                            .fontWeight(.bold)
                        .foregroundColor(Color("OrangeM"))
                        
                        Text(getPrice()+"mn")
                            .fontWeight(.bold)
                            .font(.title3)
                            .cornerRadius(10)
                    }
                    
                    Spacer()
                    VStack {
                        Text("Appel")
                            .font(.title2)
                            .fontWeight(.bold)
                        .foregroundColor(.gray)
                        Text(getPrice()+"Mbit")
                            .fontWeight(.bold)
                            .font(.title3)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .padding(.bottom, -20)
                //custom slider...
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center), content: {
                    Capsule()
                        .fill(.black.opacity(0.25))
                        .frame(height: 30)
                    Capsule()
                        .fill(Color("OrangeM").opacity(0.6))
                        .frame(width: offset + 20,height: 30)
                    
                    //Dots
                    HStack(spacing: (UIScreen.main.bounds.width - 100 ) / 12){
                        
                        ForEach(0..<12, id: \.self) { index in
                            Circle()
                                .fill(Color.white)
                                .frame(width: index % 4 == 0 ? 7 : 4,height: index % 4 == 0 ? 7 : 4)
                        }
                       
                    }
                    .padding(.leading)
                    
                    
                    Circle()
                        .fill(Color("OrangeM"))
                        .frame(width: 35, height: 35)
                        .background(Circle().stroke(Color.white,lineWidth: 5))
                        .offset(x: offset)
                        .gesture(DragGesture().onChanged({(value) in
                            //padding Horizontal
                            //padding Horizontal = 30
                            //Circle raduis = 20
                            //total = 50
                            if value.location.x >= 20 && value.location.x <= UIScreen.main.bounds.width - 50{
                                //Circle Raduis = 20
                                withAnimation{
                                    offset = value.location.x - 20
                                }
                                
                            }
                        }))
                })
                .padding()
                .padding(.top, 33)

            }
            .navigationTitle("Illiflex")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Acheter",action: {
                        
                    })
                    .foregroundColor(Color("OrangeM"))
                    .font(.title3)
                    .fontWeight(.bold)
                }
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Retour"){
                        dismiss()
                    }
                    .font(.title3)
                    .fontWeight(.bold)
                }
            }
            Spacer()
        }
        
    }
    func getPrice() -> String{
        let percent = offset / (UIScreen.main.bounds.width - 70)
        let amount = percent * (totalAmount / 3)
        return String(format: "%.1f", amount)
    }
}

struct TextFieldNumeroView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldNumeroView()
    }
}


