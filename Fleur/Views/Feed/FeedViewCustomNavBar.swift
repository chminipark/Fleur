//
//  FeedViewCustomNavBar.swift
//  Fleur
//
//  Created by minii on 2021/10/19.
//

import SwiftUI

// MARK: - FeedViewCustomNavBar
struct FeedViewCustomNavBar: View {

//  @EnvironmentObject var diaryViewModel: DiaryViewModel

  // Custom navigationBarBackButton
//  @Environment(\.presentationMode) var presentationMode

  @EnvironmentObject var fbAuth: FBAuth
  
  var body: some View {
    HStack {

      Button(action: {
//        presentationMode.wrappedValue.dismiss()
        fbAuth.signOut()
      }, label: {
        Image(systemName: "line.horizontal.3.circle")
          .modifier(ButtonImageDesign(color: .black))
      })

      Spacer()

      Button(action: {
        print(#fileID, #function, #line)
      }, label: {
        Image(systemName: "magnifyingglass")
          .modifier(ButtonImageDesign(color: .black))
      })
      
      Button(action: {
        print(#fileID, #function, #line)
      }, label: {
        Image(systemName: "square.and.pencil")
          .modifier(ButtonImageDesign(color: .black))
      })

    }
    .padding()
    .frame(height: 45)
  }
}
