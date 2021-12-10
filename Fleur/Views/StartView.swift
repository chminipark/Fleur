//
//  StartView.swift
//  Fleur
//
//  Created by minii on 2021/08/10.
//

import SwiftUI

struct StartView: View {
  
//  @StateObject var feedViewModel = FeedViewModel()
  
  @EnvironmentObject var diaryDBManager: DiaryDBManager
  
  var body: some View {
    
//    FeedView(dataDiary: feedViewModel.dataDiary)
//    FeedView(dataDiary: feedViewModel.dataDiary)
    FeedView(dataDiary: diaryDBManager.dataDiary)
//    FeedView(dataDiary: [])
    
    
//    ZStack{
//      if fbAuth.signedIn {
////        HashTagView()
//        FeedView()
//      } else {
//        IntroView(animationTime: 2, visibleTime: 8)
//      }
//    }
//    .onAppear {
//      fbAuth.signedIn = fbAuth.isSignedIn
//    }
    
    
  }
}

struct StartView_Previews: PreviewProvider {
  static var previews: some View {
    StartView()
  }
}
