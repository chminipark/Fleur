//
//  DrawingViewCustomNavBar.swift
//  Fleur
//
//  Created by minii on 2021/10/10.
//

import SwiftUI

struct DrawingViewCustomNavBar: View {

  @EnvironmentObject var diaryViewModel: DiaryViewModel

  @Binding var contents: [_DiaryContent]
  @Binding var isShowDrawingView: Bool
  
  var body: some View {
    HStack {

      // Back Button
      Button(action: {
        isShowDrawingView.toggle()
      }, label: {
        Image(systemName: "chevron.backward")
          .modifier(ButtonImageDesign(color: .honeydew))
      })

      Spacer()

      // MARK: 저장하기 구현...
      // Save Image
      Button(action: {
        let diaryContent = _DiaryContent(type: ContentType.image, textContent: nil, imageContent: DiaryMock.image1)
        contents.append(diaryContent)
        isShowDrawingView.toggle()
      }, label: {
        Image(systemName: "square.and.arrow.down")
          .modifier(ButtonImageDesign(color: .honeydew))
      })

    }
    .padding()
    .frame(height: 45)
  }
}

//struct DrawingViewCustomNavBar_Previews: PreviewProvider {
//    static var previews: some View {
//        DrawingViewCustomNavBar()
//    }
//}
