//
//  layout1.swift
//  Fleur
//
//  Created by minii on 2021/10/22.
//

import SwiftUI



struct layout1: View {
  
  var sampleData: [Card]
  
  // width
  // padding = 30
  var width = UIScreen.main.bounds.width - 30
  
  var body: some View {
    HStack(spacing: 4) {
      Image(sampleData[0].image)
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: (width - (width/3) + 4), height: 250)
        .cornerRadius(4)
      
      VStack(spacing: 4) {
        
        // 123+123+4 = 250
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
      .frame(maxHeight: .infinity, alignment: .top)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
}

struct layout1_Previews: PreviewProvider {
  static var previews: some View {
    FeedView()
  }
}
