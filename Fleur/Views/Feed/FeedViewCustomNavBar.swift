//
//  FeedViewCustomNavBar.swift
//  Fleur
//
//  Created by minii on 2021/10/19.
//

import SwiftUI
import RealmSwift


// MARK: - FeedViewCustomNavBar
struct FeedViewCustomNavBar: View {
  
  var body: some View {
    HStack {

      Button(action: {
        print(#fileID, #function, #line)
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
      
      NavigationLink {
        DiaryView(diaryForm: DiaryForm())
      } label: {
        Image(systemName: "square.and.pencil")
          .modifier(ButtonImageDesign(color: .black))
      }

    } // HStack
    .padding()
    .frame(height: 45)
  }
}
