//
//  Pie.swift
//  Memorize
//
//  Created by Treata Norouzi on 9/25/22.
//

import SwiftUI

struct Pie: Shape, InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var insetAmount = 0.0
    var clockwise: Bool = false
    
    // the Shape protocol inherits from Animatable
    // and this var is the only thing in Animatable
    // so by implementing it to get/set our pair of angles
    // we are thus animatable
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set {
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        
        // we did this by creating a path and returning it
        // but there is also a Path { } version we could have used
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
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
