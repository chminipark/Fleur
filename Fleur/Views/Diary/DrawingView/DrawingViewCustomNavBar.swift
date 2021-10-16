//
//  DrawingViewCustomNavBar.swift
//  Fleur
//
//  Created by minii on 2021/10/10.
//

import SwiftUI

struct DrawingViewCustomNavBar: View {

  @EnvironmentObject var diaryViewModel: DiaryViewModel

  var body: some View {
    HStack {

      Button(action: {
        diaryViewModel.isShowDrawingView.toggle()
      }, label: {
        Image(systemName: "chevron.backward")
          .modifier(ButtonImageDesign(color: .honeydew))
      })

      Spacer()

      Button(action: {
        diaryViewModel.saveImage()
        diaryViewModel.isShowDrawingView.toggle()
      }, label: {
        Image(systemName: "square.and.arrow.down")
          .modifier(ButtonImageDesign(color: .honeydew))
      })

    }
    .padding()
    .frame(height: 45)
  }
}

struct DrawingViewCustomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        DrawingViewCustomNavBar()
    }
}
