//
//  DrawingView.swift
//  Fleur
//
//  Created by minii on 2021/09/22.
//

import SwiftUI
import PencilKit

// MARK: - DrawingView
struct DrawingView: View {

  @State private var isShowAddTextInCanvasView = false
  @State private var isShowImgPicker = false
  @Binding var isShowDrawingView: Bool
  
  @ObservedObject var diaryForm: DiaryForm
  @StateObject var drawingViewModel = DrawingViewModel()
  
  // [textBox]에서 맞는 index 가져오기
  // ForEach에서 사용
  func getIndex(textBox: TextBox) -> Int {
    let index = drawingViewModel.textBoxes.firstIndex { (box) -> Bool in
      return box.id == textBox.id
    } ?? 0
    return index
  }
  
  var body: some View {
    
    GeometryReader { geo -> AnyView in
      
      let size = geo.frame(in: .global).size
      
      DispatchQueue.main.async {
        drawingViewModel.rect = geo.frame(in: .global)
      }
      
      return AnyView (
        ZStack {
          Color.black.opacity(0.3).ignoresSafeArea()
          
          VStack {
            // CustomNavBar
            DrawingViewCustomNavBar(contents: $diaryForm.contents, isShowDrawingView: $isShowDrawingView)
              .opacity(isShowAddTextInCanvasView ? 0 : 1)
            
            Spacer()
            
            // DrawingPanel
            ZStack {
              // Background Image
              if let image = UIImage(data: drawingViewModel.imageData) {
                Image(uiImage: image)
                  .resizable()
                  .frame(width: size.width-100, height: size.width-100)
              }
              else {
                Rectangle()
                  .foregroundColor(.bgColor)
                  .frame(width: size.width-100, height: size.width-100)
              }
              
              // Canvas
              CanvasView(rect: size, canvas: $drawingViewModel.canvas)
                .frame(width: size.width-100, height: size.width-100)
              
              // TextBox
              ForEach(drawingViewModel.textBoxes) { box in
                Text(box.text)
                  .offset(box.currentPosition)
                  .foregroundColor(box.textColor)
                  .animation(.default)
                  // drag gesture
                  .gesture(
                    DragGesture()
                      .onChanged({ value in
                        let index = getIndex(textBox: box)
                        let last = box.lastPosition
                        let current = CGSize(width: value.translation.width + last.width, height: value.translation.height + last.height)
                        drawingViewModel.textBoxes[index].currentPosition = current
                      })
                      .onEnded({ value in
                        let index = getIndex(textBox: box)
                        let last = box.lastPosition
                        let current = CGSize(width: value.translation.width + last.width, height: value.translation.height + last.height)
                        drawingViewModel.textBoxes[index].currentPosition = current
                        drawingViewModel.textBoxes[index].lastPosition = current
                      })
                  )
              }
            }
            
            Spacer()
            
            DrawingViewCustomToolBar(isShowImgPicker: $isShowImgPicker, isShowAddTextInCanvasView: $isShowAddTextInCanvasView, drawingViewModel: drawingViewModel)
              .opacity(isShowAddTextInCanvasView ? 0 : 1)
          }
        } // ZStack
          .sheet(isPresented: $isShowImgPicker) {
            ImagePickerView(isShowPicker: $isShowImgPicker, imgData: $drawingViewModel.imageData)
        }
        .overlay(isShowAddTextInCanvasView ?
                 AddTextInCanvasView(isShowAddTextInCanvasView: $isShowAddTextInCanvasView, drawingViewModel: drawingViewModel) : nil
        )
      )// AnyView
    }// Geo
  }// body
}





// MARK:- BackgroundView
//struct BackgroundClearView: UIViewRepresentable {
//  func makeUIView(context: Context) -> some UIView {
//
//    let view = UIView()
//    DispatchQueue.main.async {
//      view.superview?.superview?.backgroundColor = .clear
//    }
//    return view
//  }
//
//  func updateUIView(_ uiView: UIViewType, context: Context) {
//
//  }
//}
//
//struct BackgroundBlurView: UIViewRepresentable {
//  func makeUIView(context: Context) -> UIView {
//    let blurEffect = UIBlurEffect(style: .light)
//    let blurView = UIVisualEffectView(effect: blurEffect)
//
//    let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
//    let vibrancyView = UIVisualEffectView(effect: vibrancyEffect)
//
//    blurView.contentView.addSubview(vibrancyView)
//
//    DispatchQueue.main.async {
//      blurView.superview?.superview?.backgroundColor = .clear
//    }
//
//    return blurView
//  }
//
//  func updateUIView(_ uiView: UIViewType, context: Context) {
//
//  }
//}



//struct DrawingView_Previews: PreviewProvider {
//
//  static var previews: some View {
//    Group {
//      DrawingView()
//        .environmentObject(DiaryViewModel())
//    }
//  }
//}
