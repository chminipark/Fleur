//
//  FeedViewModel.swift
//  Fleur
//
//  Created by minii on 2021/10/19.
//

import SwiftUI
import RealmSwift

// Environment로 만들기.....

//class FeedViewModel: ObservableObject {
//  @Published var sampledata: [Card] = Card.getDummy()
//  @Published var compositionalLayoutData: [[Card]] = []
//
//  init() {
//    setCompositionalLayout()
//  }
//
//  func setCompositionalLayout() {
//    var currentArray: [Card] = []
//
//    sampledata.forEach { data in
//      currentArray.append(data)
//
//      if currentArray.count == 3 {
//        compositionalLayoutData.append(currentArray)
//        currentArray.removeAll()
//      }
//
//      if currentArray.count != 3 && data.id == sampledata.last!.id {
//        compositionalLayoutData.append(currentArray)
//        currentArray.removeAll()
//      }
//
//    }
//  }
//}

//class FeedViewModel: ObservableObject {
//  var
//}

class FeedViewModel: ObservableObject {

//  @ObservedResults(DiaryDB.self) var allDiaryResults
  
//  private var allDiaryResults: Results<DiaryDB>

//  @ObservedResults(DiaryDB.self) var results

//  init() {
//    let realm = try! Realm()
//    let realm = try! Realm()
//    print(realm.configuration.fileURL)
//    self.allDiaryResults = realm.objects(DiaryDB.self)
//  }
  
//  var dataDiary: [Diary] {
//    allDiaryResults.map { data in
//      Diary(id: data.id,
//            date: DateFormatter.customFormatter.string(from: data.date),
//            contents: contentsToLayoutData(contents: Array(data.contents))
//      )
//    }
//
//  }
  
//  var dataDiary: [Diary] {
//    allDiaryResults.map(Diary.init)
//  }


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

/*
 
 1. allResults environment형태로..
    feedviewmodel에는 func만 남아있음 <------- o
 2. model, allresults, func 모두 각 뷰에 맞춰서 만들기 <-------- x
    
 */
