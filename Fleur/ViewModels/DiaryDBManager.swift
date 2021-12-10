//
//  DiaryDBManager.swift
//  Fleur
//
//  Created by minii on 2021/12/01.
//

import Foundation
import RealmSwift

class DiaryDBManager: ObservableObject {
  
  @ObservedResults(DiaryDB.self) var allDiaryDBResults
  
  var dataDiary: [Diary] {
    allDiaryDBResults.map(Diary.init)
  }
  
}

extension DiaryDBManager {
  
//  func create(type: ContentType, content: Object) {
//    objectWillChange.send()
//
//    let data = _DiaryContent(type: type, content: content)
//
//    do {
//      let realm = try Realm()
//
//      try realm.write({
//
//      })
//    } catch let error {
//      print("#file: \(#file), #function: \(#function), #line: \(#line)")
//      print(error.localizedDescription)
//    }
//  }

  
}
