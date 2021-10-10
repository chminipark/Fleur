//
//  AddTextInCanvasView.swift
//  Fleur
//
//  Created by minii on 2021/10/10.
//

import SwiftUI

struct AddTextInCanvasView: View {
  
  @EnvironmentObject var diaryViewModel: DiaryViewModel
  @State var text: String = ""
  
  var body: some View {
    VStack {
      HStack {
        Button {
          diaryViewModel.addTextInCanvas(text: text)
          diaryViewModel.isShowAddTextInCanvasView.toggle()
        } label: {
          Text("추가")
        }
        
        Spacer()
        
        Button {
          diaryViewModel.isShowAddTextInCanvasView.toggle()
        } label: {
          Text("취소")
        }
      }
      
      Spacer()
      
      TextField("단어를 입력하세용", text: $text)
        .padding()
        .colorScheme(.dark)
        .foregroundColor(.white)
      
      Spacer()
    }
    .background(Color.black.opacity(0.6).ignoresSafeArea())
    
  }
}


struct AddTextInCanvasView_Previews: PreviewProvider {
    static var previews: some View {
        AddTextInCanvasView()
    }
}
