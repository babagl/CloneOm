//
//  ServicesView.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 20/03/2023.
//

import SwiftUI

struct ServicesView: View {
    @State var index = 0
    var body: some View {
        VStack {
//            HStack{
//                Text("STAT")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .foregroundColor(Color("OrangeM"))
//                Spacer()
//            }
//            .padding(.horizontal)
            
            
            //tab view
            HStack(spacing: 0){
                
                Text("Pass")
                    .foregroundColor(self.index == 0 ? .white : Color("OrangeM").opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color("OrangeM").opacity(self.index == 0 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default){
                            self.index = 0
                        }
                    }
                Spacer(minLength: 0)
                Text("Payement")
                    .foregroundColor(self.index == 1 ? .white : Color("OrangeM").opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 35)
                    .background(Color("OrangeM").opacity(self.index == 1 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default){
                            self.index = 1
                        }
                    }
                Spacer(minLength: 0)
                Text("Banques")
                    .foregroundColor(self.index == 2 ? .white : Color("OrangeM").opacity(0.7))
                    .fontWeight(.bold)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 25)
                    .background(Color("OrangeM").opacity(self.index == 2 ? 1 : 0))
                    .clipShape(Capsule())
                    .onTapGesture {
                        withAnimation(.default){
                            self.index = 2
                        }
                    }
                
            }
            .background(Color.black.opacity(0.9))
            .clipShape(Capsule())
            .padding(.horizontal)
            //.padding(.top,25)
            
            
            //DashBoard Grid...
            
            //Tab View with swipe Gesture ....

                TabView(selection: self.$index){
                    
                    //week data
                    GridView(fitness_Data: fit_Data)
                        .tag(0)
                    
                    //month data
                    GridView(fitness_Data: week_fit_data)
                        .tag(1)
                        
                    
                    VStack{
                        Text("monthly data")
                    }
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
            
            
            
            
            Spacer(minLength: 0)
        }
        .padding(.top)
        
    }
}

struct ServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ServicesView()
    }
}

//Grid View
struct GridView : View{
    //View Propreties
    @State private var addExpense : Bool = false
    @State private var illiflexPage : Bool = false
    var fitness_Data : [Fitness]
    var columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 2)
    var body: some View{
        LazyVGrid(columns: columns, spacing: 30){
            ForEach(fitness_Data){fitness in
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                    VStack(alignment: .leading, spacing: 20){
                        Text(fitness.title)
                            .foregroundColor(.white)
                        Text(fitness.data)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top , 10)
                        
                        HStack{
                            Spacer(minLength: 0)
                            Text(fitness.suggest)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    //image name same set as Color name....
                    .background(Color.black.opacity(0.4))
                    .cornerRadius(20)
                    .shadow(color: Color.black.opacity(0.2),radius: 5 , x: 0 , y: 5)
                    .onTapGesture {
                        print("holla")
                        if fitness.title == "Pass Illiflex\n Conso"{
                            illiflexPage.toggle()
                        }else{
                            addExpense.toggle()
                        }
                            
                    }
                    
                    // top image
                    Image(fitness.image)
                        .renderingMode(.template)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 70,height: 80)
                        .background(Color.white.opacity(0.12))
                        .clipShape(Circle())
                }
                    .sheet(isPresented: $illiflexPage ){
                        TextFieldNumeroView(montantFlex: "")
                        ///costumizing sheet
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.hidden)
                            .interactiveDismissDisabled()
                        
                    }
                    .sheet(isPresented: $addExpense){
                        AddNewExpense(navTitle: "Nouvel envoie")
                            .presentationDetents([.medium])
                            .presentationDragIndicator(.hidden)
                            .interactiveDismissDisabled()
                    }
                
            }
            
        }
        .padding(.horizontal)
    }
}

//dashboard dgrid model Data...

struct Fitness: Identifiable {
    var id : Int
    var title :  String
    var image : String
    var data : String
    var suggest : String

}
var fit_Data = [
    Fitness(id: 0, title: "Internet \n Conso", image: "credit", data: "250 mbit", suggest: "Acheter"),
    Fitness(id: 1, title: "Payement\n marchant", image: "marchant", data: "124 points", suggest: "Payer"),
    Fitness(id: 2, title: "Illimix \n Restant", image: "timer", data: "15mn : 12s", suggest: "Payer"),
    Fitness(id: 3, title: "Point Sargal\n", image: "points", data: "155 points", suggest: "Utuliser"),
    Fitness(id: 4, title: "Pass Voyage\nmon compte", image: "travel", data: "12.000FR ", suggest: "Acheter"),
    Fitness(id: 5, title: "Pass Illiflex\n Conso", image: "CardMoney", data: "15mn : 2s", suggest: "Acheter")
]

var week_fit_data = [
    Fitness(id: 0, title: "Woyofal", image: "heart", data: "124 points", suggest: "80-120\n point"),
    Fitness(id: 1, title: "Senelec", image: "Senelec", data: "124 points", suggest: "80-120\n point"),
    Fitness(id: 2, title: "Sen'Eau", image: "heart", data: "124 points", suggest: "80-120\n point"),
    Fitness(id: 3, title: "Sonatel", image: "Sonatel", data: "124 points", suggest: "80-120\n point"),
    Fitness(id: 4, title: "Canal +", image: "Canal+", data: "124 points", suggest: "80-120\n point"),
    Fitness(id: 5, title: "Rapido", image: "heart", data: "124 points", suggest: "80-120\n point"),
]

var Month_fit_data = [
    Fitness(id: 0, title: "heart-Rate", image: "heart", data: "124 points", suggest: "80-120\n point"),
    Fitness(id: 1, title: "heart-Rate", image: "heart", data: "124 points", suggest: "80-120\n point"),
    Fitness(id: 2, title: "heart-Rate", image: "heart", data: "124 points", suggest: "80-120\n point"),
    Fitness(id: 3, title: "heart-Rate", image: "heart", data: "124 points", suggest: "80-120\n point"),
    Fitness(id: 4, title: "heart-Rate", image: "heart", data: "124 points", suggest: "80-120\n point"),
    Fitness(id: 5, title: "heart-Rate", image: "heart", data: "124 points", suggest: "80-120\n point"),
]
