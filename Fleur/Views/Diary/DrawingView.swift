//
//  DrawingView.swift
//  Fleur
//
//  Created by minii on 2021/09/22.
//

import SwiftUI
import PencilKit

// MARK:- DrawingView
struct DrawingView: View {

  @EnvironmentObject var diaryViewModel: DiaryViewModel
  
  //  @State var isShowAddTextView = false
  
  // [textBox]에서 맞는 index 가져오기
  // ForEach에서 사용
  func getIndex(textBox: TextBox) -> Int {
    let index = diaryViewModel.textBoxes.firstIndex { (box) -> Bool in
      return box.id == textBox.id
    } ?? 0
    return index
  }
  
  var body: some View {
    
    GeometryReader { geo -> AnyView in
      
      let size = geo.frame(in: .global).size
      
      DispatchQueue.main.async {
        diaryViewModel.rect = geo.frame(in: .global)
      }
      
      return AnyView (
        ZStack {
          Color.black.opacity(0.3).ignoresSafeArea()
          
          VStack {
            DrawingViewCustomNavBar()
              .foregroundColor(.black)
            
            Spacer()
            
            ZStack {
              // Canvas Background Image
              if let image = UIImage(data: diaryViewModel.imageData) {
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
              CanvasView(rect: size, canvas: $diaryViewModel.canvas)
                .frame(width: size.width-100, height: size.width-100)
              
              // Text
              ForEach(diaryViewModel.textBoxes) { box in
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
                        diaryViewModel.textBoxes[index].currentPosition = current
                      })
                      .onEnded({ value in
                        let index = getIndex(textBox: box)
                        let last = box.lastPosition
                        let current = CGSize(width: value.translation.width + last.width, height: value.translation.height + last.height)
                        diaryViewModel.textBoxes[index].currentPosition = current
                        diaryViewModel.textBoxes[index].lastPosition = current
                      })
                  )
              }
            }
            
            Spacer()
            
          }
        } // ZStack
        .toolbar {
          ToolbarItemGroup(placement: ToolbarItemPlacement.bottomBar) {
            Button {
              diaryViewModel.isShowImgPicker.toggle()
            } label: {
              Image(systemName: "photo")
                .modifier(ButtonImageDesign())
            }
            
            Spacer()
            
            Button {
              diaryViewModel.isShowAddTextInCanvasView.toggle()
            } label: {
              Image(systemName: "textformat.abc")
                .modifier(ButtonImageDesign())
            }
            
            Spacer()
            
            Button {
              print(#fileID, #function, #line)
            } label: {
              Image(systemName: "pencil.tip.crop.circle")
                .modifier(ButtonImageDesign())
            }
          }
        }
        .sheet(isPresented: $diaryViewModel.isShowImgPicker) {
          ImagePickerView(isShowPicker: $diaryViewModel.isShowImgPicker, imgData: $diaryViewModel.imageData)
        }
        .overlay(diaryViewModel.isShowAddTextInCanvasView ?
                  AddTextInCanvasView() : nil
        )
        
      )// AnyView
    }// Geo
  }// body
}


struct DrawingViewCustomNavBar: View {
  
  @EnvironmentObject var diaryViewModel: DiaryViewModel
  
  var body: some View {
    HStack {
      
      Button(action: {
        diaryViewModel.isShowDrawingView.toggle()
      }, label: {
        Image(systemName: "chevron.backward")
          .font(.system(size: 20, weight: .bold))
          .foregroundColor(.white)
      })
      
      Spacer()
      
      Button(action: {
        diaryViewModel.saveImage()
        diaryViewModel.isShowDrawingView.toggle()
      }, label: {
        Image(systemName: "square.and.arrow.down")
          .font(.system(size: 20, weight: .bold))
          .foregroundColor(.white)
      })
      
    }
    .padding()
    .frame(height: 45)
  }
}


struct CanvasView: UIViewRepresentable {
  
  var rect: CGSize
  @Binding var canvas: PKCanvasView
  
  func makeUIView(context: Context) -> PKCanvasView {
    canvas.isOpaque = false
    canvas.drawingPolicy = .anyInput
    canvas.backgroundColor = .clear
    canvas.frame.size = rect
    //    let toolPicker = PKToolPicker()
    //
    //    toolPicker.setVisible(true, forFirstResponder: canvas)
    //    toolPicker.addObserver(canvas)
    //    canvas.becomeFirstResponder()
    
    return canvas
  }
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
    
  }
}

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
    .background(Color.black.opacity(0.7).ignoresSafeArea())
    
  }
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
//      DrawingView(isShowDrawingView: .constant(true))
//    }
//  }
//}