//
//  Home.swift
//  SearchList
//
//  Created by Abdoulaye Aliou SALL on 13/03/2023.
//

import SwiftUI

struct CustomContactHome: View {
    //Search Text
    @State var searchQuery = ""
    //Offset ...
    @State var offset : CGFloat = 0
    //startOffset
    @State var starOffset : CGFloat = 0
    
    //to move tittle to center were getting the tittle width
    @State var titleOffset: CGFloat = 0
    
    @State var titleBarHeight : CGFloat = 0
    
    @ObservedObject var viewModel = LoginViewModel()
    
    @State var filteredRecipes = LoginViewModel().contacts
    
    var body: some View {
        
        VStack(alignment: .leading){
            VStack{
                if searchQuery == "" {
                    HStack{
                        Button(action: {}, label: {
                            Image(systemName: "star")
                                .font(.title2)
                                .foregroundColor(.primary)
                        })
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "plus")
                                .font(.title2)
                                .foregroundColor(.primary)
                        })
                        
                    }
                    .padding()
                    HStack{
                        (
                            Text("My ")
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            +
                            Text("Contacts")
                                .foregroundColor(.black.opacity(0.6))
                        )
                        .font(.largeTitle)
//                        .overlay(
//                            GeometryReader{ reader -> Color in
//                                let width = reader.frame(in: .global).maxX
//                                DispatchQueue.main.async {
//                                    if titleOffset == 0{
//                                        titleOffset = width
//                                    }
//                                }
//
//                                return Color.clear
//                        }
//                                .frame(width: 0, height: 0)
                        //)
                        //.padding()
                        //getting offset and moving the view
//                        .scaleEffect(getScale())
//                        .offset(getOffset())
                        
                        Spacer()
                    }
                    .padding()
                }
                
                VStack{
                    //search bar
                    HStack(spacing: 15){
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 23, weight: .bold))
                            .foregroundColor(.gray)
                        
                        TextField("Search", text: $searchQuery)
                        
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(.primary.opacity(0.05))
                    .cornerRadius(8)
                    .padding(.horizontal)
                    
                    if searchQuery == ""{
                        //Divider Line
                        HStack{
                            Text("Contacts")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                            Rectangle()
                                .fill(.primary.opacity(0.6))
                                .frame(height:0.5)
                        }
                        .padding()

                    }
                    

                }
                .offset(y: offset > 0 && searchQuery == "" ? (offset <= 90 ? -offset : -90) : 0)
            }
            .padding(.top, 20)
            .zIndex(1)
            .padding(.bottom,searchQuery == "" ? getOffset().height : 0)
            .background(Color.white.ignoresSafeArea())
//            .overlay(
//                GeometryReader{reader -> Color in
//                    let height = reader.frame(in: .global).maxX
//                    DispatchQueue.main.async {
//                        if titleBarHeight == 0{
//                            titleBarHeight = height - (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
//                        }
//                    }
//                    return Color.clear
//                }
//            )
            .animation(.easeOut, value: searchQuery != "" )
            
            
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing: 15){
                    ForEach(searchQuery == "" ? viewModel.contacts : viewModel.contacts.filter{$0.givenName.lowercased().contains(searchQuery.lowercased())}){contact in
                        // Contact row View
                        ContactRowView(contact: contact)
                    }
                }
                .padding(.top, 10)
                .padding(.top,searchQuery == "" ?  titleBarHeight : 90 )
                //getting offset by using geometry Reader..
//                .overlay(
//                    GeometryReader{proxy -> Color in
//                        let minY = proxy.frame(in: .global).minY
//                        //print(minY)
//                        DispatchQueue.main.async {
//                            if starOffset == 0{
//                                starOffset = minY
//                            }
//                            offset = offset - minY
//                            print(offset)
//                        }
//                        return Color.clear
//                    }
//                        .frame(width: 0, height: 0)
//                    ,alignment: .top
//                )
            })
        }
        .onAppear{(viewModel.fetchContacts())}
    }
    
    func getOffset() -> CGSize {
        var size : CGSize = .zero
        let screenWidth = UIScreen.main.bounds.width / 2
        size.width = offset > 0 ? (offset * 1.5 <= (screenWidth - titleOffset) ? offset * 1.5: (screenWidth - titleOffset)) : 0
        size.height = offset > 0 ? (offset <= 75 ? -offset : -75) : 0
        
        return size
    }
    
    func getScale() -> CGFloat {
        if offset > 0 {
            let screenWidth = UIScreen.main.bounds.width
            let progress = 1 - (getOffset().width / screenWidth)
            return progress >= 0.9 ? progress : 0.9
        }else{
            return 1
        }
    }
    func filterRecipes() {
      if searchQuery.isEmpty {
        // 1
          filteredRecipes = viewModel.contacts
      } else {
        // 2
          filteredRecipes = viewModel.contacts.filter {
          $0.givenName
            .localizedCaseInsensitiveContains(searchQuery)
        }
      }
    }
        
}

struct CustomContactHome_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
