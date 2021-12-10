//
//  DiaryData.swift
//  Fleur
//
//  Created by minii on 2021/09/27.
//

import SwiftUI

struct DiaryData {
  var date: String
  var id: String { date }
  var content: [String: [DiaryContent]]
}

struct DiaryContent: Identifiable {
//  var date: Date
  let id = UUID()
  var text: String?
  var photo: UIImage?
  
  static func getDummy() -> [DiaryContent] {
    return [
      DiaryContent(text: "TEST1111", photo: nil),
      DiaryContent(text: nil, photo: UIImage(named: "1")),
      DiaryContent(text: nil, photo: UIImage(named: "2")),
      DiaryContent(text: "2222TEST2222", photo: nil)
    ]
  }
}

// MARK: -


 



//struct _Diary {
//  var diary: [_DiaryContent]
//}
//
//struct _DiaryContent {
//  var content: [Date: [Any]]
//}
//
//
//struct TextData: Identifiable, Hashable {
//  let id = UUID()
//  var text: String
//}
//
//struct ImageData: Identifiable, Hashable {
//  let id = UUID()
//  var image: UIImage
//}
//
//func getDummyDiaryContent() -> [Any] {
//  return [
//    TextData(text: "111111"),
//    ImageData(image: UIImage(named: "1")!),
//    ImageData(image: UIImage(named: "1")!),
//    TextData(text: "222222"),
//    ImageData(image: UIImage(named: "1")!),
//    TextData(text: "111111"),
//    ImageData(image: UIImage(named: "1")!),
//    ImageData(image: UIImage(named: "1")!),
//    TextData(text: "222222"),
//    ImageData(image: UIImage(named: "1")!),
//    TextData(text: "111111"),
//    ImageData(image: UIImage(named: "1")!),
//    ImageData(image: UIImage(named: "1")!),
//    TextData(text: "222222"),
//    ImageData(image: UIImage(named: "1")!)
//  ]
//}
