//
//  Card.swift
//  Fleur
//
//  Created by minii on 2021/10/22.
//

import SwiftUI

struct Card: Identifiable, Hashable {
  let id = UUID()
  var image: String = ""
  
  static func getDummy() -> [Card] {
    let dummyString = dummyData.ImageArray
    var dummyCard: [Card] = []
    
    dummyString.forEach { data in
      dummyCard.append(Card(image: data))
    }
    
    return dummyCard
  }
}
