//
//  WhetherDataView.swift
//  WhetherApp
//
//  Created by Suraj-KU on 18/02/25.
//

import SwiftUI

struct WhetherDataView: View {
    var body: some View {
        VStack(spacing : 8){
            CustomeStackView {
                Label {
                    Text("Air Quality")
                } icon: {
                    Image(systemName: "aqi.low")
                }

            } contentView: {
                VStack(alignment: .leading,spacing : 10){
                    Text("143 - Modretly Pollutad")
                        .font(.title3.bold())
                    Text("May cause Brething disscomfort for people with lung deces such as asthema and discomfort for people with heart disease children and older adults")
                        .fontWeight(.semibold)
                    
                }
                .foregroundStyle(.white)
            }
            
            HStack{
                CustomeStackView {
                    Label {
                        Text("UV Index")
                    } icon: {
                        Image(systemName: "sun.min")
                    }

                } contentView: {
                    VStack(alignment: .leading , spacing: 10) {
                        Text("0")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("Low")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .leading)
                }
                
                CustomeStackView {
                    Label {
                        Text("Rain Fall")
                    } icon: {
                        Image(systemName: "cloud.rain")
                    }
                } contentView: {
                    VStack(alignment: .leading , spacing: 10) {
                        Text("0")
                            .font(.title)
                            .fontWeight(.semibold)
                        
                        Text("in last 24 hours")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity , maxHeight: .infinity, alignment: .leading)
                }
                
                

            }
            .frame(maxHeight: .infinity)
            
            CustomeStackView {
                Label {
                    Text("10-Day Forcast")
                } icon: {
                    Image(systemName: "calendar")
                }

            } contentView: {
                VStack(alignment: .leading , spacing: 10) {
                    ForEach(foreCast) { cast in
                        VStack {
                            HStack(spacing : 15) {
                                Text(cast.day)
                                    .font(.title3.bold())
                                    .foregroundStyle(.white)
                                    .frame(width: 60 , alignment: .leading)
                                
                                Image(systemName: cast.image)
                                    .font(.title3)
                                    .symbolVariant(.fill)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.yellow , .white)
                                    .frame(width: 30)
                                
                                
                                Text("\(Int(cast.fareheit - 8))")
                                    .font(.title3.bold())
                                    .foregroundStyle(.secondary)
                                    .foregroundStyle(.white)
                                
                                ZStack(alignment:.leading){
                                    Capsule()
                                        .fill(.tertiary)
                                        .foregroundStyle(.white)
                                    
                                    GeometryReader{ proxy in
                                        Capsule()
                                            .fill(.linearGradient(.init(colors: [.orange,.red]), startPoint: .leading, endPoint: .trailing))
                                            .frame(width : (cast.fareheit / 140) * proxy.size.width)
                                    }
                                }
                                .frame(height : 4)
                                
                                Text("\(Int(cast.fareheit))")
                                    .font(.title3.bold())
                                    .foregroundStyle(.white)
                                
                            }
                            
                            Divider()
                        }
                        .padding(.vertical , 8)
                    }
                }
            }


        }
    }
}

#Preview {
    ContentView()
}
