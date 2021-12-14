//
//  DiaryRowView.swift
//  Fleur
//
//  Created by minii on 2021/10/09.
//

import SwiftUI

// MARK: - DiaryRowView

struct DiaryRowView: View {
  
  let content: _DiaryContent
  
  var body: some View {
    if content.type == ContentType.image.rawValue {
      DiaryRowImageView(data: content.imageContent!)
    }
    else if content.type == ContentType.text.rawValue {
      DiaryRowTextView(data: content.textContent!)
    }
  }
}
