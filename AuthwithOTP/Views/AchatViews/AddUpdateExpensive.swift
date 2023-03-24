//
//  AddUpdateExpensive.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 24/03/2023.
//

import SwiftUI

struct AddUpdateExpensive: View {
    //View propreties
    @State private var title : String = ""
    //Search Text
    @State var searchQuery = ""
    //Contact Model
    let contactModel : Contact
    @State var phoneNumber = ""
    
    @State private var dateOfPurchase: Date = .init()
    @State private var amoutSpent: Double = 0
    @State var autoSuggest: Bool = false
    
    @ObservedObject var viewModel = LoginViewModel()
    
    @State var filteredRecipes = LoginViewModel().contacts
    var navTitle : String
    
    //Environment Propreties
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var context
    var body: some View {
        
        NavigationStack {
            List{
                Section("Destinataire :"){
                    
                    TextField("Numero Téléphone", text: $phoneNumber)
                        .keyboardType(.numberPad)
                        .onChange(of: searchQuery, perform: {value in
                            if !value.isEmpty{
                                autoSuggest = true
                            }else{
                                autoSuggest = false
                            }
                            
                        })
                    if autoSuggest == true{
                        
                        ForEach(viewModel.contacts.filter{$0.phoneNumber.lowercased().filter{$0 != " "}.contains(searchQuery.lowercased())}){contact in
                                // Contact row View
                                Button(action: {
                                    searchQuery = contact.phoneNumber
                                    autoSuggest.toggle()
                                }){
                                        ContactRowView(contact: contact)
                                }
                            }
                        
                    }
                }
                .onAppear(perform: {
                    self.phoneNumber = contactModel.phoneNumber
                })
                    
                    
                Section("Date D'envoie :"){
                    DatePicker("", selection: $dateOfPurchase, displayedComponents: [.date])
                        .labelsHidden()
                }
                Section("Montant :"){
                    TextField(value: $amoutSpent, formatter: currencyFormatter){
                        
                    }
                    .labelsHidden()
                    .keyboardType(.numberPad)
                }
            }
            .navigationTitle(navTitle)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Envoyer", action: addExpense)
                        .foregroundColor(Color("OrangeM"))
                }
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Retour"){
                        dismiss()
                    }
                }
            }
            .onAppear{(viewModel.fetchContacts())}
        }
    }
    
    
        
    ///   Adding new expenses
    func addExpense(){
        do{
            let purchase = Purchase(context: context)
            purchase.id = .init()
            purchase.title = phoneNumber
            purchase.dateOfPurchase = dateOfPurchase
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

struct AddUpdateExpensive_Previews: PreviewProvider {
    
    static var previews: some View {
        let contactModels = Contact(givenName: "baba", familyName: "galle", phoneNumber: "77853")
        AddUpdateExpensive( contactModel: contactModels, navTitle: "Bonjour")
    }
}
