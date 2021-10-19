//
//  FeedView.swift
//  Fleur
//
//  Created by minii on 2021/10/19.
//

import SwiftUI

struct FeedView: View {
  var body: some View {
    VStack {
      FeedViewCustomNavBar()
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    .background(Color.bgColor)
  }
}

struct FeedView_Previews: PreviewProvider {
  static var previews: some View {
    FeedView()
  }
}
