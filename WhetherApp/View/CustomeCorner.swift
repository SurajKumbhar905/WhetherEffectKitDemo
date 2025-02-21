//
//  CustomeCorner.swift
//  WhetherApp
//
//  Created by Suraj-KU on 18/02/25.
//

import SwiftUI

struct CustomeCorner:  Shape{
    
    var corner : UIRectCorner
    var redius : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: redius, height: redius))
        return Path(path.cgPath)
    }
}


