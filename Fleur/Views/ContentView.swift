//
//  ContentView.swift
//  Fleur
//
//  Created by minii on 2021/08/10.
//

import SwiftUI

struct ContentView: View {
  
  @EnvironmentObject var fbAuth: FBAuth
  
  var body: some View {
    ZStack{
      if fbAuth.signedIn {
        HashTagView()
      } else {
        IntroView()
      }
    }
    .onAppear {
      fbAuth.signedIn = fbAuth.isSignedIn
    }
    
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
