//
//  FBAuth.swift
//  Fleur
//
//  Created by minii on 2021/09/14.
//

import FirebaseAuth

class FBAuth: ObservableObject {
  
  let auth = Auth.auth()
  
  @Published var signedIn = false
  
  var isSignedIn: Bool {
    return auth.currentUser != nil
  }
  
  func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
    auth.signIn(withEmail: email, password: password) { [weak self] result, error in
      guard result != nil, error == nil else {
        // fail
        completion(false)
        return
      }
      
      // Success
      DispatchQueue.main.async {
        self?.signedIn = true
      }
      completion(true)
    }
  }
  
  func signUp(email: String, password: String, completion: @escaping (Bool) -> Void) {
    auth.createUser(withEmail: email, password: password) { [weak self] result, error in
      guard result != nil, error == nil else {
        // fail
        completion(false)
        return
      }
      
      // Success
      DispatchQueue.main.async {
        self?.signedIn = true
      }
      completion(true)
    }
  }
  
  func signOut() {
    do {
      try auth.signOut()
      print("signOut Success")
      self.signedIn = false
    } catch let signOutError as NSError {
      print("signOut Error... : \(signOutError)")
    }
  }
  
  
}
