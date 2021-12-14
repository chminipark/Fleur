//
//  FleurApp.swift
//  Fleur
//
//  Created by minii on 2021/08/10.
//

import SwiftUI

@main
struct FleurApp: SwiftUI.App {
  
  var body: some Scene {
    WindowGroup {
      
      ContentView()
        .environmentObject(DiaryDBManager())
        
    }
  }
}
