//
//  StartView.swift
//  Fleur
//
//  Created by minii on 2021/08/10.
//

import SwiftUI

struct StartView: View {
  
  @EnvironmentObject var fbAuth: FBAuth
  
  var body: some View {
    ZStack{
      if fbAuth.signedIn {
        HashTagView()
      } else {
        IntroView(animationTime: 2, visibleTime: 8)
      }
    }
    .onAppear {
      fbAuth.signedIn = fbAuth.isSignedIn
    }
    
    
  }
}

struct StartView_Previews: PreviewProvider {
  static var previews: some View {
    StartView()
  }
}
