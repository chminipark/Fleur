//
//  DrawingViewModel.swift
//  Fleur
//
//  Created by minii on 2021/09/22.
//

import SwiftUI
import PencilKit

class DrawingViewModel: ObservableObject {
  @Published var rect: CGRect = .zero
  @Published var imageData: Data = Data(count: 0)
  @Published var canvas = PKCanvasView()
  @Published var textBoxes: [TextBox] = []
}

// MARK: - ImagePicker
extension DrawingViewModel {
  func cancelImageEditing() {
    imageData = Data(count: 0)
//    canvas = PKCanvasView()
  }
}

// MARK: - Canvas
extension DrawingViewModel {
  func saveCanvas() {
    
  }
}

// MARK: - TextBox
extension DrawingViewModel {
  func addTextInCanvas(text: String) {
    textBoxes.append(TextBox(text: text))
  }
}
