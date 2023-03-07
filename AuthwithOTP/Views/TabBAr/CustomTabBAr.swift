//
//  CustomTabBAr.swift
//  AuthwithOTP
//
//  Created by Abdoulaye Aliou SALL on 07/03/2023.
//

import SwiftUI

struct CustomTabBAr: View {
    @Binding var selectedTab : String
    //Storing Each Tab MidPoint to animated it in future...
    @State var tabPoints :[CGFloat] = []
    var body: some View {
        HStack(spacing: 0){
            //tab bar Button ...
            TabBarButton(image: "house", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "envelope.arrow.triangle.branch", selectedTab: $selectedTab, tabPoints: $tabPoints)
            TabBarButton(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
            
        }
        .padding()
        .background(Color.white.clipShape(TabCurveView(tabPoint: getCurvePoint() - 15)))
        .overlay(Circle()
            .fill(Color.white)
            .frame(width: 10, height: 10)
            .offset(x: getCurvePoint() - 20), alignment: .bottomLeading)
        .cornerRadius(30)
        .padding(.horizontal)
    }
    
    //extrating points
    func getCurvePoint() -> CGFloat {
        if tabPoints.isEmpty {
            return 10
        }else{
            switch selectedTab{
            
            case "envelope.arrow.triangle.branch":
                return tabPoints[1]
            case "person":
                return tabPoints[2]
            default:
                return tabPoints[0]
            }
        }
    }
}

struct CustomTabBAr_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


struct TabBarButton: View {
    
    var image : String
    @Binding var selectedTab : String
    @Binding var tabPoints : [CGFloat]
    var body: some View{
        
        // for getting mid point of each button for curve animation
        GeometryReader{reader -> AnyView in
            
            //extrating ModPoint and storing
            let midX = reader.frame(in: .global).midX
            DispatchQueue.main.async {
                
                // avoiding junk data..
                if tabPoints.count <= 3{
                    tabPoints.append(midX)
                }
            }
            return AnyView(
                Button(action: {
                    //Changing tab
                    //Spring animation
                    
                    withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5))
                    { selectedTab = image}
                }
                       , label: {
                    Image(systemName: "\(image)\(selectedTab == image ? ".fill" : "")")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color("OrangeM"))
                    //lifting view ...
                    //if its selected...
                        .offset(y: selectedTab == image ? -10 : 0)
                })
                //max frame
                .frame(maxWidth: .infinity , maxHeight: .infinity)
            
            )
        }
        //max height
        .frame(height: 50)
    }
}
