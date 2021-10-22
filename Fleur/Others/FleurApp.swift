//
//  FleurApp.swift
//  Fleur
//
//  Created by minii on 2021/08/10.
//

import SwiftUI
import Firebase

@main
struct FleurApp: App {
  
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
  
  var body: some Scene {
    WindowGroup {
      
      // environmentObject
      StartView()
        .environmentObject(FBAuth())
        
    }
  }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    
    FirebaseApp.configure()
    
    return true
  }
}
