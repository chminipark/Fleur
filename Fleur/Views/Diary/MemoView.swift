//
//  MemoView.swift
//  Fleur
//
//  Created by minii on 2021/09/26.
//

// 재생목록 순서이동 하듯이..

//import SwiftUI
//
//struct MemoView: UIViewRepresentable {
//  @Binding var imgData: Data
////  @Binding var fullString: NSMutableAttributedString
//
//  var rect: CGSize
//
////  class Coordinator: NSObject, UITextViewDelegate {
////    var parent: TextView
////
////    init(parent: TextView) {
////      self.parent = parent
////    }
////  }
////
////  func makeCoordinator() -> Coordinator {
////    return Coordinator(parent: self)
////  }
//
//  func makeUIView(context: Context) -> UITextView {
//    let textView = UITextView()
////    textView.delegate = context.coordinator
//    return textView
//  }
//
//
//  func updateUIView(_ uiView: UITextView, context: Context) {
//
//    if let image = UIImage(data: imgData) {
//
////      uiView.addImage(image: image) {
////        // updateUIView가 너무 많이 실행되서 이미지가 여러장 붙여져서 viewModel의 이미지를 지움
////        imgData = Data(count: 0)
////      }
//
//
//    }
//  }
//}
//
//extension UITextView {
//  func addImage(image: UIImage, completion: @escaping (()->())) {
//    let attachment = NSTextAttachment()
//    attachment.image = image
//    attachment.bounds = CGRect.init(x: 0, y: 0, width: 100, height: 100)
//    let attString = NSAttributedString(attachment: attachment)
//
//    self.textStorage.insert(attString, at: self.selectedRange.location)
//
//    completion()
//  }
//}
