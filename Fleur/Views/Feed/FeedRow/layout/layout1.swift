//
//  layout1.swift
//  Fleur
//
//  Created by minii on 2021/10/22.
//

import SwiftUI


//struct layout1: View {
//  
//  var sampleData: [Card]
//  
//  // width
//  // padding = 30
//  var width = UIScreen.main.bounds.width - 30
//  
//  var body: some View {
//    HStack(spacing: 4) {
//      Image(sampleData[0].image)
//        .resizable()
//        .aspectRatio(contentMode: .fill)
//        .frame(width: (width - (width/3) + 4), height: 250)
//        .cornerRadius(4)
//      
//      VStack(spacing: 4) {
//        
//        // 123+123+4 = 250
//        if sampleData.count >= 2 {
//          Image(sampleData[1].image)
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: (width/3), height: 123)
//            .cornerRadius(4)
//          
//        }
//        
//        if sampleData.count == 3 {
//          Image(sampleData[2].image)
//            .resizable()
//            .aspectRatio(contentMode: .fill)
//            .frame(width: (width/3), height: 123)
//            .cornerRadius(4)
//        }
//      }
//      .frame(maxHeight: .infinity, alignment: .top)
//    }
//    .frame(maxWidth: .infinity, alignment: .leading)
//  }
//}

struct layout1: View {
  
  let layoutData: [_DiaryContent]
  
  let width = UIScreen.main.bounds.width - 30
  let spacing: CGFloat = 4
  let radi: CGFloat = 5
  
  var body: some View {
    HStack(alignment: .top , spacing: spacing) {
      
      CardView(card: layoutData[0])
        .frame(width: width - (width/3), height: 250)
        .cornerRadius(radi)
      
      VStack(spacing: spacing) {
        
        if layoutData.count >= 2 {
          CardView(card: layoutData[1])
            .frame(width: width/3, height: 123)
            .cornerRadius(radi)
        }
        
        if layoutData.count == 3 {
          CardView(card: layoutData[2])
            .frame(width: width/3, height: 123)
            .cornerRadius(radi)
        }
      }
    }
  }
}

struct layout1_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      layout1(layoutData: DiaryMock.LayoutData1())
      layout1(layoutData: DiaryMock.LayoutData2())
      layout1(layoutData: DiaryMock.LayoutData3())
    }
    .previewLayout(.sizeThatFits)
    
  }
}
