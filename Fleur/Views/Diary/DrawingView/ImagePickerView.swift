//
//  ImagePicker.swift
//  Fleur
//
//  Created by minii on 2021/09/22.
//

import SwiftUI

struct ImagePickerView: UIViewControllerRepresentable {
  @Binding var isShowPicker: Bool
  @Binding var imgData: Data
  
  func makeCoordinator() -> Coordinator {
    return ImagePickerView.Coordinator(parent: self)
  }
  
  func makeUIViewController(context: Context) -> UIImagePickerController {
    let controller = UIImagePickerController()
    controller.delegate = context.coordinator
    controller.sourceType = .photoLibrary
    return controller
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
  
  class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var parent: ImagePickerView
    
    init(parent: ImagePickerView) {
      self.parent = parent
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let imgData = (info[.originalImage] as! UIImage).pngData() {
        parent.imgData = imgData
        parent.isShowPicker.toggle()
      }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      parent.isShowPicker.toggle()
    }
    
  }
}
