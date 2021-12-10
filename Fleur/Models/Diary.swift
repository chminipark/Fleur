//
//  Diary.swift
//  Fleur
//
//  Created by minii on 2021/12/02.
//

import Foundation

struct Diary: Identifiable {
  let id: UInt64
  let date: String
  let contents: [_DiaryContent]
//  var id: UInt64 = 0
//  var date: String = "2021년 12월 2일"
//  var contents: [[_DiaryContent]] = [[]]
  
//  init(diaryDB: DiaryDB) {
//    self.id = diaryDB.id
//    self.date = DateFormatter.customFormatter.string(from: diaryDB.date)
//    self.contents =
//  }
  
//  convenience init(id: UInt64, date: String, contents: [[_DiaryContent]]) {
//    self.id = id
//    self.date = date
//    self.contents = contents
//  }
  
  
  
  
  static func returnDiaryMock() -> [Diary] {
    var dataArray = [Diary]()

    let data1 = Diary(id: 123, date: "2021년 12월 2일", contents: DiaryMock.LayoutData3())
    let data2 = Diary(id: 123, date: "2021년 12월 3일", contents: DiaryMock.LayoutData3())
    let data3 = Diary(id: 123, date: "2021년 12월 4일", contents: DiaryMock.LayoutData3())

    dataArray.append(data1)
    dataArray.append(data2)
    dataArray.append(data3)

    return dataArray
  }
}

extension Diary {
  init(diaryDB: DiaryDB) {
    self.id = diaryDB.id
    self.date = DateFormatter.customFormatter.string(from: diaryDB.date)
    self.contents = Array(diaryDB.contents)
  }
}
