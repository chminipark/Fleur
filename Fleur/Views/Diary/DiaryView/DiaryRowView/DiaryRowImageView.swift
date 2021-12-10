//
//  DiaryRowImageView.swift
//  Fleur
//
//  Created by minii on 2021/11/20.
//

import SwiftUI

struct DiaryRowImageView: View {
  
  let data: ImageContent
  
  var body: some View {
    if data.img.isEmpty {
      Text("Empty Image")
    } else {
      Image(uiImage: UIImage(data: data.img)!)
        .resizable()
    }
  }
}
