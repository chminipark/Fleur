//
//  TextCardView.swift
//  Fleur
//
//  Created by minii on 2021/11/18.
//

import SwiftUI

struct TextCardView: View {
  
  let card: TextContent
  
  var body: some View {
    Text("\(card.text)")
  }
}

//struct TextCardView_Previews: PreviewProvider {
//  static var previews: some View {
//    TextCardView()
//  }
//}
