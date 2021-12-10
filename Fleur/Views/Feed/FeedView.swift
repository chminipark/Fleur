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
  
//  @ObservedRealmObject var diary: Diary
  
//  let compoLayoutData: [[_DiaryContent]]
//  let spacing: CGFloat = 4
  
//  @StateObject var feedViewModel = FeedViewModel()
  let dataDiary: [Diary]
  
  var body: some View {
    NavigationView {
      VStack {
        FeedViewCustomNavBar()
        
        
        
        ScrollView {
//          VStack(spacing: spacing) {
//            ForEach(compoLayoutData.indices, id:\.self) { idx in
//              if idx % 3 == 0 {
//                layout1(layoutData: compoLayoutData[idx])
//              }
//              else if idx % 3 == 1 {
//                layout2(layoutData: compoLayoutData[idx])
//              }
//              else {
//                layout3(layoutData: compoLayoutData[idx])
//              }
//            }
//          }
          if dataDiary.isEmpty {
            Text("Empty data....")
          } else {
            ForEach(dataDiary) { data in
              FeedRowView(date: data.date, compoLayoutData: feedViewModel.contentsToLayoutData(contents: data.contents))
            }
            .padding(.horizontal)
          }
        }
        
//        ScrollView {
//          VStack(spacing:4) {
//
//            ForEach(feedViewModel.compositionalLayoutData.indices, id: \.self) { index in
//              if index == 0 || index%6 == 0 {
//                layout1(sampleData: feedViewModel.compositionalLayoutData[index])
//              }
//              else if index%3 == 0 {
//                layout3(sampleData: feedViewModel.compositionalLayoutData[index])
//              }
//              else {
//                layout2(sampleData: feedViewModel.compositionalLayoutData[index])
//              }
//            }
//
//          }
//          .padding(.horizontal)
//        }
      }
      .navigationBarHidden(true)
      .background(Color.bgColor)
    }
    
  }
}

struct FeedView_Previews: PreviewProvider {
  static var previews: some View {
    FeedView(dataDiary: Diary.returnDiaryMock())
  }
}
