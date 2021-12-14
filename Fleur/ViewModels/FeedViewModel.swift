//
//  FeedViewModel.swift
//  Fleur
//
//  Created by minii on 2021/10/19.
//

import SwiftUI

class FeedViewModel: ObservableObject {

}

extension FeedViewModel {
  
  func contentsToLayoutData(contents: [_DiaryContent]) -> [[_DiaryContent]] {
    var toAdd = [_DiaryContent]()
    var layoutData = [[_DiaryContent]]()

    for item in contents {
      if toAdd.count == 3 {
        layoutData.append(toAdd)
        toAdd.removeAll()
      }
      toAdd.append(item)
    }

    layoutData.append(toAdd)
    return layoutData
  }
  
}
