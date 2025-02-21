//
//  Sunny.swift
//  WhetherApp
//
//  Created by Suraj-KU on 19/02/25.
//

import SwiftUI

struct SunnyView: View {
    
    var topEdge : CGFloat
    @State var offset : CGFloat = 0
    @State var showRain : Bool = false
    
    var body: some View {
        ZStack{
            GeometryReader { proxy in
                Image("Sunny3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width , height: proxy.size.height)
                
            }
            .ignoresSafeArea()
            
            
            
            ScrollView(.vertical , showsIndicators: false) {
                VStack{
                    VStack(alignment: .center , spacing: 5) {
                        Text("Ratnagiri")
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                        
                        Text(" 34°")
                            .font(.system(size: 75))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                        
                        Text("Sunny")
                            .foregroundStyle(.primary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpacity())
                        
                    }
                    .offset(y : -offset)
                    .offset(y : offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                    .offset(y : getTitleOffSet())
                    
                    VStack(spacing: 8) {
                        
                        CustomeStackView {
                            Label {
                                Text("Hourly Forcast")
                            } icon: {
                                Image(systemName: "clock")
                            }
                            
                        } contentView: {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 15) {
                                    ForcastView(time : "12 PM" , celcius : 94 , image : "sun.min")
                                    ForcastView(time : "1 PM" , celcius : 95 , image : "sun.haze")
                                    ForcastView(time : "2 PM" , celcius : 96 , image : "sun.min")
                                    ForcastView(time : "3 PM" , celcius : 97 , image : "cloud.sun")
                                    ForcastView(time : "4 PM" , celcius : 99 , image : "sun.haze")
                                }
                            }
                        }
                        
                        WhetherDataView()
                        
                    }
//                    .overlay(
//                        GeometryReader{ proxy in
//                            SpriteView(scene: SnowFallLanding() , options: [.allowsTransparency] )
//                                .offset(y : -10)
//                        }
//                            .offset(y : -(offset + topEdge) > 90 ? -(offset + (90 + topEdge)) : 0)
//                            .opacity(showRain ? 1 : 0)
//                        
//                    )
                    
                    .padding(.top , 20)
                    
                }
                .padding(.top,25)
                .padding(.top,topEdge)
                .padding([.horizontal , .bottom])
                .overlay {
                    GeometryReader{ proxy -> Color in
                        
                        let minY = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async{
                            self.offset = minY
                        }
                        
                        return Color.clear
                    }
                }
                
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8){
                withAnimation {
                    showRain = true
                }
            }
        }
    }
    
    func getTitleOpacity()->CGFloat{
        let titleOffset = -getTitleOffSet()
        let progress = titleOffset / 20
        
        let opacity = 1 - progress
        
        return opacity
    }
    
    func getTitleOffSet()->CGFloat{
        
        if (offset < 0){
            let progress = -offset / 120
            
            let newOffset = (progress <= 1.0 ? progress : 1 ) * 20
            return -newOffset
        }
        return 0
        
    }
    
    
}
