//
//  layout2.swift
//  Fleur
//
//  Created by minii on 2021/10/22.
//

import SwiftUI

struct layout2: View {
  
  let layoutData: [_DiaryContent]
  
  let width = UIScreen.main.bounds.width - 30
  let spacing: CGFloat = 4
  let radi: CGFloat = 5
  
  var body: some View {
    HStack(spacing: spacing/2) {
      CardView(card: layoutData[0])
        .frame(width: width/3, height: 123)
        .cornerRadius(radi)
      if layoutData.count >= 2 {
        CardView(card: layoutData[1])
          .frame(width: width/3, height: 123)
          .cornerRadius(radi)
      }
      if layoutData.count == 3 {
        CardView(card: layoutData[2])
          .frame(width: width/3, height: 123)
          .cornerRadius(radi)
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct layout2_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      layout2(layoutData: DiaryMock.LayoutData1())
      layout2(layoutData: DiaryMock.LayoutData2())
      layout2(layoutData: DiaryMock.LayoutData3())
    }
    .previewLayout(.sizeThatFits)
  }
}
