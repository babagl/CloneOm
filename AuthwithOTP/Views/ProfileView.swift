//
//  ProfileView.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 23/03/2023.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .frame(width: 510, height: 510)
                    .foregroundColor(Color("OrangeM"))
                    .padding(.top, -300)
                VStack {
                    Text("Abdoulaye Aliou SALL")
                        .font(.title)
                    .fontWeight(.bold)
                    Text("N°: 77 853 21 04")
                        .fontWeight(.bold)
                }
                
                VStack {
                    HStack {
                        Button(action: {
                            dismiss()
                        }){
                            Text("Retour")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(.leading , 90)
                                Spacer()
                        }
                    }
                    Spacer()
                }
            }
            
            
            VStack{
                ProfileSubview()
            }
            .padding(.top, -150)
                
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct ProfileSubview : View {
    @State var shouldShowImagePicker = false
    @State var image :UIImage?
    var body: some View{
        
        VStack{
            ZStack {
                Button(action: {
                    shouldShowImagePicker.toggle()
                }){
                    ZStack {
                        if let image = self.image{
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 130, height: 130)
                                .cornerRadius(80)
                            //.padding(.top, -80)
                            Image(systemName: "plus.app.fill")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color("OrangeM"))
                                .padding(.leading,60)
                            .padding(.top,80)
                            
                        }else{
                            Image("profil")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fill)
                        
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke(Color.black.opacity(0.3), lineWidth: 3))
                            .frame(width: 100, height: 100)
                        //.padding(.top, -80)
                        Image(systemName: "plus.app.fill")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("OrangeM"))
                            .padding(.leading,60)
                        .padding(.top,80)
                        }
                    }
                    
                }
                    
            }
                
            VStack{
                btnView(image: "PassCodeIcon", name: "Changer Code Secret")
                btnView(image: "NumberPadIcons", name: "Ajouter un Numero")
                btnView(image: "PlafondIcon", name: "Deplafonnement")
                btnView(image: "IconPlan", name: "Planifier un envoie")
                btnView(image: "UserAccount", name: "Changer de numero")
                
                Spacer()
            }
            .padding()
        }
        .padding(.top)
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil){
            ImagePicker(image: $image)
        }

        }
}

struct ImagePicker: UIViewControllerRepresentable {
 
    @Binding var image: UIImage?
 
    private let controller = UIImagePickerController()
 
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
 
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
 
        let parent: ImagePicker
 
        init(parent: ImagePicker) {
            self.parent = parent
        }
 
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }
 
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
 
    }
 
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.delegate = context.coordinator
        return controller
    }
 
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
 
    }
 
}
