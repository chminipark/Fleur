//
//  layout2.swift
//  Fleur
//
//  Created by minii on 2021/10/22.
//

import SwiftUI

struct layout2: View {
  
  
  var sampleData: [Card]
  // width
  // padding = 30
  var width = UIScreen.main.bounds.width - 30
  
  var body: some View {
    HStack(spacing: 4) {
      Image(sampleData[0].image)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: (width/3), height: 123)
        .cornerRadius(4)
      
      if sampleData.count >= 2 {
        Image(sampleData[1].image)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: (width/3), height: 123)
          .cornerRadius(4)
      }
      
      if sampleData.count == 3 {
        Image(sampleData[2].image)
          .resizable()
          .aspectRatio(contentMode: .fill)
          .frame(width: (width/3), height: 123)
          .cornerRadius(4)
      }
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct layout2_Previews: PreviewProvider {
  static var previews: some View {
    FeedView()
  }
}
