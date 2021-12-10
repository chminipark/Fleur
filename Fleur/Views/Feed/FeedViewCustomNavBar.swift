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
        print("#file: \(#file), #function: \(#function), #line: \(#line)")
      }, label: {
        Image(systemName: "line.horizontal.3.circle")
          .modifier(ButtonImageDesign(color: .black))
      })

      Spacer()
      
      Button(action: {
        print("#file: \(#file), #function: \(#function), #line: \(#line)")
      }, label: {
        Image(systemName: "magnifyingglass")
          .modifier(ButtonImageDesign(color: .black))
      })
      
      NavigationLink {
//        DiaryView(contentList: Array(DiaryMock.diary1.contents))
        DiaryView(diaryData: Diary.init(diaryDB: DiaryDB()))
      } label: {
        Image(systemName: "square.and.pencil")
          .modifier(ButtonImageDesign(color: .black))
      }

    }
    .padding()
    .frame(height: 45)
  }
}
