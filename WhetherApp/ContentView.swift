//
//  ContentView.swift
//  WhetherApp
//
//  Created by Suraj-KU on 18/02/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        GeometryReader{proxy in
            TabView{
                let topEdge = proxy.safeAreaInsets.top + 60
                Rainy(topEdge : topEdge)
                    .ignoresSafeArea()
                
                
                WinterView(topEdge : topEdge)
                    .ignoresSafeArea()
                
                SunnyView(topEdge : topEdge)
                    .ignoresSafeArea()
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        .ignoresSafeArea(.all)
        
        
    }
    
    
    
}


#Preview {
    ContentView()
}
