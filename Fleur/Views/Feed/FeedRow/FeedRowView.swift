//
//  FeedRowView.swift
//  Fleur
//
//  Created by minii on 2021/12/02.
//

import SwiftUI

struct FeedRowView: View {
  
  let date: String
  let compoLayoutData: [[_DiaryContent]]
  let spacing: CGFloat = 4
  
  var body: some View {
    
    VStack {
      
      Text(date)
      
      VStack(spacing: spacing) {
        ForEach(compoLayoutData.indices, id:\.self) { idx in
          if idx % 3 == 0 {
            layout1(layoutData: compoLayoutData[idx])
          }
          else if idx % 3 == 1 {
            layout2(layoutData: compoLayoutData[idx])
          }
          else {
            layout3(layoutData: compoLayoutData[idx])
          }
        }
      }
      
      // Spacer..
      Rectangle()
        .foregroundColor(.clear)
        .frame(height: 50)
      
    } // VStack
  } // body
}

struct FeedRowView_Previews: PreviewProvider {
  static var previews: some View {
    FeedRowView(date: "2021.12.02.", compoLayoutData: DiaryMock.compoLayoutData())
  }
}
