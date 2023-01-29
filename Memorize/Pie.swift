//
//  Pie.swift
//  Memorize
//
//  Created by Treata Norouzi on 9/25/22.
//

import SwiftUI

struct Pie: InsettableShape {
    var insetAmount = 0.0
    
    var startAngel: Angle
    var animatableDataStartPoint: Angle {
        get { startAngel }
        set { startAngel = newValue}
    }
    
    var endAngle: Angle
    var animatableDataEndPoint: Angle {
        get { endAngle }
        set { endAngle = newValue }
    }
    
    var clockwise = false     // has value for not getting initialized only
    
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
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var line = self
        line.insetAmount += amount
        return line
    }
}
