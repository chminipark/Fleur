//
//  DrawingViewCustomToolBar.swift
//  Fleur
//
//  Created by minii on 2021/10/10.
//

import SwiftUI
import PencilKit

struct DrawingViewCustomToolBar: View {
  
  @EnvironmentObject var diaryViewModel: DiaryViewModel
  
  var body: some View {
    HStack {
      Button {
        diaryViewModel.canvas.drawing = PKDrawing()
        diaryViewModel.textBoxes.removeAll()
        diaryViewModel.imageData = Data(count: 0)
      } label: {
        Image(systemName: "xmark.circle")
          .modifier(ButtonImageDesign(color: .honeydew))
      }
      
      Spacer()
      
      Button {
        diaryViewModel.isShowImgPicker.toggle()
      } label: {
        Image(systemName: "photo")
          .modifier(ButtonImageDesign(color: .honeydew))
      }
      
      Spacer()
      
      Button {
        diaryViewModel.isShowAddTextInCanvasView.toggle()
      } label: {
        Image(systemName: "textformat.abc")
          .modifier(ButtonImageDesign(color: .honeydew))
      }
      
      Spacer()
      
      Button {
        print(#fileID, #function, #line)
      } label: {
        Image(systemName: "pencil.tip.crop.circle")
          .modifier(ButtonImageDesign(color: .honeydew))
      }
    }
    .padding()
    .frame(height: 45)
    
  }
}

struct DrawingViewCustomToolBar_Previews: PreviewProvider {
    static var previews: some View {
        DrawingViewCustomToolBar()
    }
}
