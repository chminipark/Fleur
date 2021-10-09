//
//  ViewModifiers.swift
//  Fleur
//
//  Created by minii on 2021/09/30.
//

import SwiftUI

struct SetBackground: ViewModifier {
  func body(content: Content) -> some View {
    content
      .background(Image("papertexture")
                    .resizable()
                    .ignoresSafeArea())
  }
}

struct ButtonImageDesign: ViewModifier {
  func body(content: Content) -> some View {
    content
      .font(.system(size: 20, weight: .semibold))
      .foregroundColor(.black)
  }
}

