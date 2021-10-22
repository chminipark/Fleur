//
//  FeedViewModel.swift
//  Fleur
//
//  Created by minii on 2021/10/19.
//

import SwiftUI

class FeedViewModel: ObservableObject {
  @Published var sampledata: [Card] = Card.getDummy()
  @Published var compositionalLayoutData: [[Card]] = []
  
  init() {
    setCompositionalLayout()
  }
  
  func setCompositionalLayout() {
    var currentArray: [Card] = []
    
    sampledata.forEach { data in
      currentArray.append(data)
      
      if currentArray.count == 3 {
        compositionalLayoutData.append(currentArray)
        currentArray.removeAll()
      }
      
      if currentArray.count != 3 && data.id == sampledata.last!.id {
        compositionalLayoutData.append(currentArray)
        currentArray.removeAll()
      }
      
    }
  }
}
