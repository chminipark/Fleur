//
//  DrawingViewCustomToolBar.swift
//  Fleur
//
//  Created by minii on 2021/10/10.
//

import SwiftUI

struct DrawingViewCustomToolBar: View {
  
  @EnvironmentObject var diaryViewModel: DiaryViewModel
  
  var body: some View {
    HStack {
      Button {
        diaryViewModel.isShowImgPicker.toggle()
      } label: {
        Image(systemName: "xmark.circle")
          .modifier(ButtonImageDesign())
      }
      
      Spacer()
      
      Button {
        diaryViewModel.isShowImgPicker.toggle()
      } label: {
        Image(systemName: "photo")
          .modifier(ButtonImageDesign())
      }
      
      Spacer()
      
      Button {
        diaryViewModel.isShowAddTextInCanvasView.toggle()
      } label: {
        Image(systemName: "textformat.abc")
          .modifier(ButtonImageDesign())
      }
      
      Spacer()
      
      Button {
        print(#fileID, #function, #line)
      } label: {
        Image(systemName: "pencil.tip.crop.circle")
          .modifier(ButtonImageDesign())
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
