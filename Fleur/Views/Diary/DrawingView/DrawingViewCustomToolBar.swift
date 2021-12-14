//
//  DrawingViewCustomToolBar.swift
//  Fleur
//
//  Created by minii on 2021/10/10.
//

import SwiftUI
import PencilKit

struct DrawingViewCustomToolBar: View {
  
  @Binding var isShowImgPicker: Bool
  @Binding var isShowAddTextInCanvasView: Bool
  @ObservedObject var drawingViewModel: DrawingViewModel
//  @EnvironmentObject var diaryViewModel: DiaryViewModel
  
  var body: some View {
    HStack {
      
      // Clear
      Button {
        drawingViewModel.canvas.drawing = PKDrawing()
        drawingViewModel.textBoxes.removeAll()
        drawingViewModel.imageData = Data(count: 0)
//        diaryViewModel.canvas.drawing = PKDrawing()
//        diaryViewModel.textBoxes.removeAll()
//        diaryViewModel.imageData = Data(count: 0)
      } label: {
        Image(systemName: "xmark.circle")
          .modifier(ButtonImageDesign(color: .honeydew))
      }
      
      Spacer()
      
      // Image Picker
      Button {
        isShowImgPicker.toggle()
      } label: {
        Image(systemName: "photo")
          .modifier(ButtonImageDesign(color: .honeydew))
      }
      
      Spacer()
      
      // Add Text
      Button {
        isShowAddTextInCanvasView.toggle()
      } label: {
        Image(systemName: "textformat.abc")
          .modifier(ButtonImageDesign(color: .honeydew))
      }
      
      Spacer()
      
      // Drawing tool
      Button {
        print(#fileID, "||", #function, "||", #line)
      } label: {
        Image(systemName: "pencil.tip.crop.circle")
          .modifier(ButtonImageDesign(color: .honeydew))
      }
    }
    .padding()
    .frame(height: 45)
    
  }
}

//struct DrawingViewCustomToolBar_Previews: PreviewProvider {
//    static var previews: some View {
//        DrawingViewCustomToolBar()
//    }
//}
