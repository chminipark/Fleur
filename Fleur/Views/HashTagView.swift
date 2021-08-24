//
//  HashTagView.swift
//  Fleur
//
//  Created by minii on 2021/08/17.
//


import SwiftUI

struct SearchBar: View {
  @Binding var text: String
  
  @State private var isEditing = false
  
  var body: some View {
    HStack {
      
      TextField("Search ...", text: $text)
        .padding(7)
        .padding(.horizontal, 25)
        .background(Color(.white))
        .cornerRadius(8)
        .padding(.horizontal, 10)
        .onTapGesture {
          self.isEditing = true
        }
      
      if isEditing {
        Button(action: {
          self.isEditing = false
          self.text = ""
        }, label: {
          Text("search")
        })
        .padding(.trailing, 10)
        .transition(.move(edge: .trailing))
        .animation(.default)
      }
    }
  }
}

struct HashTagView: View {
  var body: some View {
    VStack {
      SearchBar(text: .constant(""))
      
      VStack() {
        Spacer()
        Text("This is HashTagView")
          
        Spacer()
      }
      .background(Image("papertexture")
                    .resizable()
                    .edgesIgnoringSafeArea(.all))
    }
   
  }
}

struct HashTagView_Previews: PreviewProvider {
  static var previews: some View {
    HashTagView()
  }
}
