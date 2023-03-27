//
//  ScannerView.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 27/03/2023.
//

import SwiftUI
import CodeScanner
struct ScannerView: View {
    @State var PresentingScannerView = false
    @State var ExpenseToScanView = false
    //Environment Propreties
    @Environment(\.dismiss) private var dismiss
    @State var phoneNumbers = ""
    var body: some View {
        NavigationStack {
            VStack {
                CodeScannerView(codeTypes: [.qr], completion: {result in
                    if case let .success(code) = result{
                        self.phoneNumbers = code.string
                        print("mon code est:: \(phoneNumbers)")
                        self.ExpenseToScanView = true
                        self.PresentingScannerView = false
                    }
                    print("am Here mon code est // \(phoneNumbers)")
       
                })
                .sheet(isPresented:$ExpenseToScanView ){
                    AuthwithOTP.ExpenseToScanView(phoneNumbers: $phoneNumbers, navTitle: "Envoie par Scan")
                }
                
            }
            .navigationTitle("Scan")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Retour"){
                        dismiss()
                    }
                }
            }
        }
        
        
    }
}

struct ScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScannerView()
    }
}
