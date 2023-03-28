//
//  ExpenceHomeServiceView.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 28/03/2023.
//

import SwiftUI

struct ExpenceHomeServiceView: View {
    @Binding var title :String
    @State var contenant :String = ""
    @State private var amoutSpent: Double = 0
    
    
    
    
    //Environment Propreties
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var context
    var body: some View {
        NavigationStack {
            VStack{
                TextField(title, text: $contenant)
                    .textFieldStyle(UnderlinedTextFieldStyle())
                    .keyboardType(.numberPad)
                    .previewLayout(.sizeThatFits)
                .padding()
                TextField(value: $amoutSpent, formatter: currencyFormatter){
                    
                }
                .textFieldStyle(UnderlinedTextFieldStyle())
                .labelsHidden()
                .keyboardType(.numberPad)
                .padding()
            }
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Envoyer", action: addExpense)
                        .foregroundColor(Color("OrangeM"))
                }
                
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Retour" , action: {
                        dismiss()
                    })
                }
            }
Spacer()
            
        }
}
    ///   Adding new expenses
    func addExpense(){
        do{
            let purchase = Purchase(context: context)
            purchase.id = .init()
            purchase.title = contenant
            purchase.dateOfPurchase = NSDate() as Date
            purchase.amountSpent = amoutSpent
            
            try context.save()
            ///  Dismissing After Successfull Addition
            dismiss()
        }catch{
            /// Do Action
            print(error.localizedDescription)
        }
    }
    
    
}

//struct ExpenceHomeServiceView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExpenceHomeServiceView()
//    }
//}

struct UnderlinedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.vertical, 8)
            .background(
                VStack {
                    Spacer()
                    Color(UIColor.systemGray4)
                        .frame(height: 2)
                }
            )
    }
}
