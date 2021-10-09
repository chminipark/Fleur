//
//  DiaryViewCustomNavBar.swift
//  Fleur
//
//  Created by minii on 2021/10/09.
//

import SwiftUI

// MARK: - DiaryViewCustomNavBar
struct DiaryViewCustomNavBar: View {
  var body: some View {
    HStack {
      
      Button(action: {
        print(#fileID, #function, #line)
      }, label: {
        Image(systemName: "chevron.backward")
          .modifier(ButtonImageDesign())
      })
      
      Spacer()
      
      Button(action: {
        print(#fileID, #function, #line)
      }, label: {
        Image(systemName: "square.and.arrow.down")
          .modifier(ButtonImageDesign())
      })
      
    }
    .padding()
    .frame(height: 45)
  }
}
