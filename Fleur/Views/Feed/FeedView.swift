//
//  FeedView.swift
//  Fleur
//
//  Created by minii on 2021/10/19.
//

import SwiftUI
import RealmSwift

struct FeedView: View {
  
  @StateObject var feedViewModel = FeedViewModel()
  
  let dataDiary: [Diary]
  
  var body: some View {
    NavigationView {
      VStack {
        
        FeedViewCustomNavBar()
        
        ScrollView {
          if dataDiary.isEmpty {
            Text("Empty data....")
          } else {
            ForEach(dataDiary) { data in
              FeedRowView(date: data.date, compoLayoutData: feedViewModel.contentsToLayoutData(contents: data.contents))
            }
            .padding(.horizontal)
          }
        }
        
      } // VStack
      .navigationBarHidden(true)
      .background(Color.bgColor)
    } // NavigationView
  } // body
}

struct FeedView_Previews: PreviewProvider {
  static var previews: some View {
    FeedView(dataDiary: Diary.returnDiaryMock())
  }
}
