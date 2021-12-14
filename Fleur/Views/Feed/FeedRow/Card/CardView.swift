//
//  CardView.swift
//  Fleur
//
//  Created by minii on 2021/11/18.
//

import SwiftUI
import RealmSwift

struct CardView: View {
  
  let card: _DiaryContent
  
  var body: some View {
    if card.type == ContentType.image.rawValue {
      ImageCardView(card: card.imageContent!)
    }
    else if card.type == ContentType.text.rawValue {
      TextCardView(card: card.textContent!)
    }
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    let data = DiaryMock.LayoutData3()
    CardView(card: data[1])
  }
}
