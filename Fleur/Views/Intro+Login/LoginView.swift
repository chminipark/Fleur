//
//  LoginView.swift
//  Fleur
//
//  Created by minii on 2021/09/14.
//

import SwiftUI

struct LoginView: View {
  
  @EnvironmentObject var fbAuth: FBAuth
  
  @Environment(\.presentationMode) var presentationMode
  @State var email: String = ""
  @State var password: String = ""
  
  var body: some View {
    NavigationView {
      VStack(spacing: 30) {
        VStack(alignment: .leading) {
          Text("Email")
            .font(.callout)
            .bold()
          TextField("Enter Email...", text: $email)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(.top, 40)
        
        VStack(alignment: .leading) {
          Text("Password")
          SecureField("Enter Password...", text: $password)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        
        // Login Button
        Button("Login") {
          guard !email.isEmpty, !password.isEmpty else {
            print("no input..")
            return
          }
          
          fbAuth.signIn(email: email, password: password, completion: { result in
            if result {
              print("Email: \(email), Password: \(password)")
              print("login success")
              presentationMode.wrappedValue.dismiss()
            } else {
              print("login failed...")
            }
          })
          
        }
        .frame(width: 200, height: 50, alignment: .center)
        .background(Color.blue)
        .foregroundColor(.white)
        .clipShape(Capsule())
        
        
        Spacer()
      }
      .padding()
      .navigationBarTitle(Text("Login"), displayMode: .large)
      .navigationBarItems(trailing:
                            Button("Close") {
                              presentationMode.wrappedValue.dismiss()
                            })
      
      
    }
    
  }
}

struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LoginView()
    }
  }
}
