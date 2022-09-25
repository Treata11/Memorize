//
//  Pie.swift
//  Memorize
//
//  Created by Treata Norouzi on 9/25/22.
//

import SwiftUI

struct Pie: Shape {
    var startAngel: Angle   //
    var endAngle: Angle     // are vars for animation purposes
    var clockwise: Bool = false     //is var to not get initialized
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngel.radians)),
            y: center.y + radius * CGFloat(sin(startAngel.radians))
            
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
                 radius: radius,
                 startAngle: startAngel,
                 endAngle: endAngle,
                 clockwise: !clockwise
        )
        p.addLine(to: center)
        
        
        return p
    }
     
}
