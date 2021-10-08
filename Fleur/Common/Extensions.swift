//
//  Extensions.swift
//  Fleur
//
//  Created by minii on 2021/10/01.
//

import SwiftUI

// MARK:- Color
// hex값 -> Color로 변환
extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >> 8) & 0xFF) / 255.0
    let b = Double((rgb >> 0) & 0xFF) / 255.0
    
    self.init(red: r, green: g, blue: b)
  }
}

// hex로 만든 Color값들..
extension Color {
  static let bgColor = Color(hex: "#D4CCBC")
}

// MARK:- UIColor
extension UIColor {
  static func hexStringToUIColor(alpha: CGFloat = 1.0, hex: String) -> UIColor {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = CGFloat((rgb >> 16) & 0xFF) / 255.0
    let g = CGFloat((rgb >> 8) & 0xFF) / 255.0
    let b = CGFloat((rgb >> 0) & 0xFF) / 255.0
    
    return UIColor(red: r, green: g, blue: b, alpha: alpha)
  }
}

extension UIColor {
  static let bgColor = UIColor.hexStringToUIColor(hex: "#D4CCBC")
}
