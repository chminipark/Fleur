//
//  DiaryForm.swift
//  Fleur
//
//  Created by minii on 2021/12/11.
//

import Foundation

class DiaryForm: ObservableObject {
  @Published var date: String = DateFormatter.customFormatter.string(from: Date())
  @Published var contents: [_DiaryContent] = []
  
  var id: UInt64?
  
//  init(_ diary: )
}
