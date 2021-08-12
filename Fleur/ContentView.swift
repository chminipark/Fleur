//
//  ContentView.swift
//  Fleur
//
//  Created by minii on 2021/08/10.
//

import SwiftUI

struct ContentView: View {
  
  @State var isLogedIn: Bool = false
  
  var body: some View {
    
    if !isLogedIn {
      IntroView()
    } else {
      
        Text("this is contentview")
      
    }
    
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
