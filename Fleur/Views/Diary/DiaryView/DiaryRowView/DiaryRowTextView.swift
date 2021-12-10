//
//  DiaryRowTextView.swift
//  Fleur
//
//  Created by minii on 2021/11/20.
//

import SwiftUI

struct DiaryRowTextView: View {
  
  let data: TextContent
  @State private var text: String = ""
  
  init(data: TextContent) {
    self.data = data
    self._text = State(initialValue: data.text)
  }
  
  var body: some View {
    TextEditor(text: $text)
  }
}
