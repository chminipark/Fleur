//
//  DiaryViewCustomNavBar.swift
//  Fleur
//
//  Created by minii on 2021/10/09.
//

import SwiftUI

// MARK: - DiaryViewCustomNavBar
struct DiaryViewCustomNavBar: View {

//  @EnvironmentObject var diaryViewModel: DiaryViewModel

  let date: String
  
  // Custom navigationBarBackButton
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    HStack {

      Button(action: {
        presentationMode.wrappedValue.dismiss()
      }, label: {
        Image(systemName: "chevron.backward")
          .modifier(ButtonImageDesign(color: .black))
      })

      Spacer()
      
      Text(date)
      
      Spacer()

      Button(action: {
        print(#fileID, #function, #line)
      }, label: {
        Image(systemName: "square.and.arrow.down")
          .modifier(ButtonImageDesign(color: .black))
      })

    }
    .padding()
    .frame(height: 45)
  }
}

