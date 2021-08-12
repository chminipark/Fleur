//
//  IntroView.swift
//  Fleur
//
//  Created by minii on 2021/08/10.
//

import SwiftUI

struct IntroView: View {
  
  var body: some View {
    VStack(spacing: 0) {
      
//      Image("papertexture")
//        .resizable()
//        .scaledToFill()
//        .edgesIgnoringSafeArea(.all)
      
      TopButtonView()
        .frame(height: 50)
      Rectangle()
        .frame(height: 3)
        .foregroundColor(.black)
      TextView()
      Rectangle()
        .frame(height: 3)
        .foregroundColor(.black)
      BottomButtonView()
        .frame(height: 100)
      
        
    }
    .background(Image("papertexture")
                  .resizable()
                  .edgesIgnoringSafeArea(.all)
    )
    
    
    
  }
}

struct TopButtonView: View {
  
  var body: some View {
    GeometryReader { geometry in
      HStack(alignment: .center, spacing: 0) {
        Text("Login")
          .frame(maxWidth: .infinity)
        Rectangle()
          .foregroundColor(Color.black)
          .frame(width: 3, height: geometry.size.height)
        Text("Register")
          .frame(maxWidth: .infinity)
      }
    }
 

  }
  
}

struct TextView: View {
  
  @State var coordinate: [CGFloat] = randomCoordinate()
  
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  
  var body: some View {
    Text("Fleur")
      
      .position(x: 300, y: 300)
//      .position(x: coordinate[0], y: coordinate[1])
//        .onReceive(timer, perform: { _ in
//          self.coordinate = randomCoordinate()
    //        })
  }
}

struct BottomButtonView: View {
  
  var body: some View {
//    GeometryReader { geometry in
//      HStack(alignment: .center, spacing: 0) {
//        Text("Login")
//          .frame(maxWidth: .infinity)
//        Rectangle()
//          .foregroundColor(Color.black)
//          .frame(width: 3, height: geometry.size.height)
//        Text("Register")
//          .frame(maxWidth: .infinity, maxHeight: .infinity)
//      }
//
//    }
    HStack(alignment: .center, spacing: 0) {
      Text("Login")
        .frame(maxWidth: .infinity)
      Rectangle()
        .foregroundColor(Color.black)
        .frame(width: 3)
        .frame(maxHeight: .infinity)
      Text("Register")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
 
    
    
    
  }
  
}

func randomCoordinate() -> [CGFloat] {
  var coordinate = [CGFloat]()
  
  // device 가로 세로 길이
  let width = UIScreen.main.bounds.width
  let height = UIScreen.main.bounds.height
  // safearea
  guard let topPadding = UIApplication.shared.windows.first?.safeAreaInsets.top,
        let bottomPadding = UIApplication.shared.windows.first?.safeAreaInsets.bottom else {
    print("no safe area???")
    return [300, 300]
  }
  
//  print("device size : \(width), \(height)")
//  print("safearea : \(topPadding), \(bottomPadding)")
  
  let x = CGFloat.random(in: 0...width)
  let y = CGFloat.random(in: topPadding...height-(topPadding+bottomPadding))
  
  coordinate.append(x)
  coordinate.append(y)
  
//  print(coordinate)
  
  return coordinate
}

struct IntroView_Previews: PreviewProvider {
  static var previews: some View {
    IntroView()
  }
}



