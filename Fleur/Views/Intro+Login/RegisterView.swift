//
//  RegisterView.swift
//  Fleur
//
//  Created by minii on 2021/08/12.
//

import SwiftUI

struct RegisterView: View {
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
  var body: some View {
    VStack {
      Text("this is registerView")
      Button(action: {
        self.presentationMode.wrappedValue.dismiss()
      }, label: {
        Text("Dismiss")
      })
    }

  }
}

struct RegisterView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      RegisterView()
    }
  }
}
