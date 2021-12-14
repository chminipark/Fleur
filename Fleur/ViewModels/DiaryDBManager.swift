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
  func saveInDB(id: UInt64?, date: String, contents: [_DiaryContent]) {

    objectWillChange.send()

    do {
      // save 하는 요부분 효율적으로 다시 짜기...
      if !contents.isEmpty {
        let realm = try Realm()
        let diaryDB = DiaryDB()
        diaryDB.date = date
        diaryDB.contents.removeAll()
        contents.forEach { diaryDB.contents.append($0) }
        try realm.write {
          realm.add(diaryDB)
        }
      }

    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  
}
