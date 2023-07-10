//
//  Color:Gradient+NewVivids.swift
//  Memorize
//
//  Created by Treata Norouzi on 3/25/23.
//
import SwiftUI

extension Color {
    static let cream: Color = Color(red: 249/255, green: 223/255, blue: 205/255)
}

extension Gradient {
    static let animalsEmojisGradient = LinearGradient(
        colors: [.cream, .yellow, .pink],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let facesEmojisGradient = LinearGradient(
        colors: [.cream, .yellow, .orange, .pink,],
        startPoint: .bottomTrailing,
        endPoint: .topLeading
    )
    static let flagsEmojisGradient = LinearGradient(
        colors: [.purple, .white, .blue],
        startPoint: .bottom,
        endPoint: .topTrailing
    )
    static let foodEmojisGradient = LinearGradient(
        colors: [.pink, .red, .orange, .purple],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    static let halloweenEmojisGradient = LinearGradient(
        colors: [.orange, .red, .purple, .black],
        startPoint: .top,
        endPoint: .bottom
    )
    static let sportsEmojisGradient = LinearGradient(
        colors: [.blue, .white, .purple,],
        startPoint: .topTrailing,
        endPoint: .bottomLeading
    )
    static let plantsEmojisGradient = LinearGradient(
        colors: [.green, .cyan, .mint,],
        startPoint: .center,
        endPoint: .bottomLeading
    )
}
