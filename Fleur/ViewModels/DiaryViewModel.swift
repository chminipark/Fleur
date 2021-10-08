//
//  DiaryViewModel.swift
//  Fleur
//
//  Created by minii on 2021/09/27.
//

import SwiftUI
import PencilKit

class DiaryViewModel: ObservableObject {
  // MARK:- DiaryView
  @Published var contents: [DiaryContent] = []
  
  func addContentText() {
    contents.append(DiaryContent(text: nil, photo: UIImage(named: "1")))
  }
  
  func addContentImage() {
    contents.append(DiaryContent(text: "", photo: nil))
  }
  
  // MARK:- DrawingView
  
  @Published var canvas = PKCanvasView()
  @Published var isShowDrawingView = false
  @Published var rect: CGRect = .zero
  
  func saveImage() {
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 1)
    
    let drawingView = ZStack {
      if let image = UIImage(data: imageData) {
        Image(uiImage: image)
          .resizable()
//          .frame(width: rect.width-100, height: rect.width-100)
      }
      else {
        Rectangle()
          .foregroundColor(.bgColor)
//          .frame(width: rect.width-100, height: rect.width-100)
      }
      
      ForEach(textBoxes) { box in
        Text(box.text)
          .offset(box.currentPosition)
          .foregroundColor(box.textColor)
      }
    }
    
    let controller = UIHostingController(rootView: drawingView).view!
    controller.frame = rect
    controller.drawHierarchy(in: CGRect(origin: .zero, size: rect.size), afterScreenUpdates: true)
    canvas.drawHierarchy(in: CGRect(origin: .zero, size: rect.size), afterScreenUpdates: true)
    
    // get image
    let generatedImage = UIGraphicsGetImageFromCurrentImageContext()
    
    // ending render
    UIGraphicsEndImageContext()
    
    if let image = generatedImage {
      contents.append(DiaryContent(text: nil, photo: image))
    }
  }
  
  // MARK:- ImagePickerView
  @Published var isShowImgPicker: Bool = false
  @Published var imageData: Data = Data(count: 0)
  
  func cancelImageEditing() {
    imageData = Data(count: 0)
//    canvas = PKCanvasView()
  }
  
  // MARK:- AddTextInCanvasView
  @Published var textBoxes: [TextBox] = []
  @Published var isShowAddTextInCanvasView: Bool = false
  
  func addTextInCanvas(text: String) {
    textBoxes.append(TextBox(text: text))
  }
  
//  @Published var canvas = PKCanvasView()
//
//  @Published var toolPicker = PKToolPicker()
//
//  @Published var savedImage = UIImage()
  
//  @Published var fullString = NSMutableAttributedString()
  
  
  
}
