//
//  TextBox.swift
//  Fleur
//
//  Created by minii on 2021/10/01.
//

import SwiftUI
import PencilKit

struct TextBox: Identifiable {
  let id = UUID()
  var text: String = ""
  var currentPosition: CGSize = .zero
  var lastPosition: CGSize = .zero
  var textColor: Color = .black
  
  static func getDummy() -> [TextBox] {
    [
      TextBox(text: "test111"),
      TextBox(text: "test222"),
      TextBox(text: "test333"),
      TextBox(text: "test444")
    ]
  }
}
