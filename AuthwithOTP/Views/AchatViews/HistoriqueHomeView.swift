//
//  HistoriqueHomeView.swift
//  CoreDataToJson
//
//  Created by Abdoulaye Aliou SALL on 17/03/2023.
//

import SwiftUI
import CoreData

struct HistoriqueHomeView: View {
    //View Propreties
    @State private var addExpense : Bool = false
    
    /// Fetching Core data entity
    @FetchRequest(entity: Purchase.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Purchase.dateOfPurchase, ascending: false)], animation: .easeInOut(duration: 0.3)) private var purchasedItems: FetchedResults<Purchase>
    
    
    var body: some View {
        NavigationStack{
            List{
                /// Displaying Sending History
                ForEach(purchasedItems){purchase in
                    HStack(spacing: 15){
                        VStack(alignment: .leading, spacing: 6){
                            Text(purchase.title ?? "")
                                .fontWeight(.semibold)
                            Text((purchase.dateOfPurchase ?? .init()).formatted(date: .abbreviated, time: .omitted))
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Spacer(minLength: 0)
                        Text(currencyFormatter.string(from: NSNumber(value: purchase.amountSpent)) ?? "")
                            .fontWeight(.bold)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Historiques")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        addExpense.toggle()
                    }label: {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.orange)
                    }
                }
            }
            .sheet(isPresented: $addExpense){
                AddNewExpense()
                ///costumizing sheet
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.hidden)
                    .interactiveDismissDisabled()
                
            }
        }
    }
}

struct HistoriqueHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
