//
//  FloatingText.swift
//  Fleur
//
//  Created by minii on 2021/10/17.
//

import SwiftUI

// animation completion 부분 extention 으로 구현하기..
struct FloatingText: View {
  
  @State private var text: String = ""
  @State private var opacity: Bool = false
  @State private var randomCGRect: CGRect = CGRect.init(origin: .zero, size: .zero)
  
  let visibleTime: Double
  let invisibleTime: Double
  let animationTime: Double
  let textColor: Color
  
  var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
  
  init(animationTime: Double, visibleTime: Double = 1.5, invisibleTime: Double = 1, textColor: Color = .black) {
    self.visibleTime = visibleTime
    self.invisibleTime = invisibleTime
    self.animationTime = animationTime
    self.timer = Timer.publish(every: (animationTime*2) + visibleTime + invisibleTime, on: .main, in: .common).autoconnect()
    self.textColor = textColor
  }
  
  var body: some View {
    GeometryReader { geo -> AnyView in
      
      let rect = geo.frame(in: .global)
      
      AnyView(
        ZStack {
          Text(text)
            .border(Color.red, width: 5)
            .font(.custom("Times New Roman", size: 100))
            .foregroundColor(textColor)
            .minimumScaleFactor(0.001)
            .frame(width: randomCGRect.width, height: randomCGRect.height, alignment: .leading)
            .position(randomCGRect.origin)
            .animation(nil, value: randomCGRect)
            .opacity(opacity ? 1 : 0)
            .animation(.easeOut(duration: animationTime), value: opacity)
            .onReceive(timer, perform: { _ in
              text = dummyData.EnglishArray.randomElement()!
              randomCGRect = createRandomCGRect(rect: rect)
              opacity = true
              DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(animationTime + visibleTime))) {
                opacity = false
              }
            })
        } // ZStack
          .border(Color.green, width: 4)
      ) // AnyView
    } // Geo
  } // body
  
  func createRandomCGRect(rect: CGRect) -> CGRect {
    // MARK: CGSize
    var randomSize = CGSize()
    
    let maxWidth = rect.width
    let maxHeight = rect.height
    let minWidth = rect.width/2
    let minHeight = rect.height/2
    
    randomSize.width = CGFloat.random(in: minWidth...maxWidth)
    randomSize.height = CGFloat.random(in: minHeight...maxHeight)
    
    // MARK: CGPoint
    var randomPoint = CGPoint()
    
    // position기준: 가운데
    // (0,0): 왼쪽위를 0,0 위치로 옮기기
    let min_X = randomSize.width/2
    let min_Y = randomSize.height/2
    // (cgsize크기) - (오른쪽 아래를 maxX,maxY 위치로 옮기기)
    let max_X = rect.width - randomSize.width/2
    let max_Y = rect.height - randomSize.height/2
    
    randomPoint.x = CGFloat.random(in: min_X...max_X)
    randomPoint.y = CGFloat.random(in: min_Y...max_Y)
    
    return CGRect(origin: randomPoint, size: randomSize)
  }
}

//struct FloatingText_Previews: PreviewProvider {
//  static var previews: some View {
//    FloatingText()
//  }
//}
