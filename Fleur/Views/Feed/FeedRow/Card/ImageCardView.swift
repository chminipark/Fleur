//
//  ImageCardView.swift
//  Fleur
//
//  Created by minii on 2021/11/18.
//

import SwiftUI

struct ImageCardView: View {
  
  let card: ImageContent
  
  var body: some View {
    if card.img.isEmpty {
      Text("Empty Image")
    } else {
      Image(uiImage: UIImage(data: card.img)!)
        .resizable()
    }
  }
}

struct ImageCardView_Previews: PreviewProvider {
  static var previews: some View {
    ImageCardView(card: DiaryMock.image1)
  }
}
