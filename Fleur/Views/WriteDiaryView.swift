//
//  WriteDiaryView.swift
//  Fleur
//
//  Created by minii on 2021/08/17.
//

import SwiftUI

struct WriteDiaryView: View {
  
  @EnvironmentObject var fbAuth: FBAuth
  
  var body: some View {
  
    VStack(spacing: 30) {
      Text("This is WirteDiaryView")
      
      Button {
        fbAuth.signOut()
      } label: {
        Text("SignOut")
          .frame(width: 200, height: 50, alignment: .center)
          .foregroundColor(.white)
          .background(Color.blue)
          .clipShape(Capsule())
      }

    }
    
  }
}


struct WriteDiaryView_Previews: PreviewProvider {
  static var previews: some View {
    WriteDiaryView()
  }
}
