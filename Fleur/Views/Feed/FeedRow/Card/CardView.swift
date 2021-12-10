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
      let content = card.imageContent as! ImageContent
      ImageCardView(card: content)
    }
    else if card.type == ContentType.text.rawValue {
      let content = card.textContent as! TextContent
      TextCardView(card: content)
    }
  }
}

struct CardView_Previews: PreviewProvider {
  static var previews: some View {
    let data = DiaryMock.LayoutData3()
    CardView(card: data[1])
  }
}
