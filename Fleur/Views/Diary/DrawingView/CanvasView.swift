//
//  CanvasView.swift
//  Fleur
//
//  Created by minii on 2021/10/10.
//

import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
  
  var rect: CGSize
  @Binding var canvas: PKCanvasView
  
  func makeUIView(context: Context) -> PKCanvasView {
    canvas.isOpaque = false
    canvas.drawingPolicy = .anyInput
    canvas.backgroundColor = .clear
    canvas.frame.size = rect
    //    let toolPicker = PKToolPicker()
    //
    //    toolPicker.setVisible(true, forFirstResponder: canvas)
    //    toolPicker.addObserver(canvas)
    //    canvas.becomeFirstResponder()
    
    return canvas
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
    
  }
}

//struct CanvasView_Previews: PreviewProvider {
//    static var previews: some View {
//        CanvasView()
//    }
//}
