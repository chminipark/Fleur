//
//  AddTextInCanvasView.swift
//  Fleur
//
//  Created by minii on 2021/10/10.
//

import SwiftUI

struct AddTextInCanvasView: View {
  
  @Binding var isShowAddTextInCanvasView: Bool
//  @EnvironmentObject var diaryViewModel: DiaryViewModel
  @ObservedObject var drawingViewModel: DrawingViewModel
  @State var text: String = ""
  
  var body: some View {
    VStack {
      HStack {
        Button {
          isShowAddTextInCanvasView.toggle()
          self.text = ""
        } label: {
          Image(systemName: "chevron.backward")
            .modifier(ButtonImageDesign(color: .honeydew))
        }

        Spacer()
        
        Button {
//          diaryViewModel.addTextInCanvas(text: text)
//          diaryViewModel.isShowAddTextInCanvasView.toggle()
          drawingViewModel.addTextInCanvas(text: text)
          isShowAddTextInCanvasView.toggle()
        } label: {
          Image(systemName: "square.and.arrow.down")
            .modifier(ButtonImageDesign(color: .honeydew))
        }
      }
      .padding()
      .frame(height: 45)
      
      Spacer()
      
      TextField("단어를 입력하세용", text: $text)
        .padding()
        .colorScheme(.dark)
        .foregroundColor(.white)
        .padding([.leading, .trailing], 40)
        .multilineTextAlignment(.center)
      
      Spacer()
      
      Rectangle()
        .foregroundColor(.clear)
        .frame(height: 45)
    }
    .background(Color.black.opacity(0.4).ignoresSafeArea())
    
  }
}


//struct AddTextInCanvasView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddTextInCanvasView()
//    }
//}
