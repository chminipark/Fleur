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
