//
//  DiaryRowView.swift
//  Fleur
//
//  Created by minii on 2021/10/09.
//

import SwiftUI

// MARK: - DiaryRowView
struct DiaryRowView: View {
  
  var content: DiaryContent
  
  @State var text: String
  
  init(content: DiaryContent) {
    self.content = content
    self._text = .init(initialValue: content.text ?? "failed init")
  }
  
  var body: some View {
    
    if let img = content.photo {
      HStack {
        Spacer()
        Image(uiImage: img)
          .resizable()
          .frame(width: 200, height: 200)
        Spacer()
      }
    }
    
    else if content.text != nil {
      ZStack {
        TextEditor(text: $text)
          .tint(.principal)
//          .focused($isTextEditorFocused)
//        Text(text)
//          .opacity(0)
//          .padding(.all, 8)
      }
    }
    
    else {
      Text("nodata???")
    }
  }
}
