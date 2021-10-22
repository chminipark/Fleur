//
//  FeedView.swift
//  Fleur
//
//  Created by minii on 2021/10/19.
//

import SwiftUI

struct FeedView: View {
  
  @StateObject var feedViewModel = FeedViewModel()
  
  var body: some View {
    VStack {
      FeedViewCustomNavBar()
      
      ScrollView {
        VStack(spacing:4) {
          
          ForEach(feedViewModel.compositionalLayoutData.indices, id: \.self) { index in
            if index == 0 || index%6 == 0 {
              layout1(sampleData: feedViewModel.compositionalLayoutData[index])
            }
            else if index%3 == 0 {
              layout3(sampleData: feedViewModel.compositionalLayoutData[index])
            }
            else {
              layout2(sampleData: feedViewModel.compositionalLayoutData[index])
            }
          }
          
        }
        .padding(.horizontal)
      }
    }
    .background(Color.bgColor)
    
    
    
  }
}

struct FeedView_Previews: PreviewProvider {
  static var previews: some View {
    FeedView()
  }
}
