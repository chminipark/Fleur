//
//  RandomImage.swift
//  Fleur
//
//  Created by minii on 2021/10/17.
//

import SwiftUI

struct RandomImage: View {
  
  static var width: CGFloat = 150
  static var height: CGFloat = width * 1.618
  
  let invisibleTime: Double
  let animationTime: Double
  let visibleTime: Double
  
  @State var opacity = false
  @State var imageFileName = "1"
  
  var timer = Timer.publish(every: 8, on: .main, in: .common).autoconnect()
  
  init(width: CGFloat, visibleTime: Double, invisibleTime: Double, animationTime: Double) {
    RandomImage.width = width
    RandomImage.height = width * 1.618
    self.visibleTime = visibleTime
    self.invisibleTime = invisibleTime
    self.animationTime = animationTime
    self.timer = Timer.publish(every: (animationTime*2) + visibleTime + invisibleTime, on: .main, in: .common).autoconnect()
  }
  
  var body: some View {
    Image(imageFileName)
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: RandomImage.width, height: RandomImage.height, alignment: .center)
      .clipShape(RandomCircle())
      .animation(nil, value: imageFileName)
      .opacity(opacity ? 1 : 0)
      .animation(.easeOut(duration: animationTime), value: opacity)
      .onReceive(timer, perform: { _ in
        self.imageFileName = dummyData.ImageArray.randomElement()!
        self.opacity = true
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(animationTime + visibleTime))) {
          self.opacity = false
        }
      })
  }
  
  
  struct RandomCircle: Shape {
    func path(in rect: CGRect) -> Path {
      
      let coordi_y = CGFloat.random(in: height/2-30...height/2+30)
      let coordi_x = {
        return CGFloat.random(in: width/2-50...width/2+50)
      }
      //      let cp: CGFloat = 20
      
      return Path { path in
        path.move(to: CGPoint(x: 0, y: coordi_y))
        
        //        path.addQuadCurve(to: CGPoint(x: coordi_x(), y: 0), control: CGPoint(x: 0+cp, y: 0+cp))
        //        path.addQuadCurve(to: CGPoint(x: width, y: coordi_y), control: CGPoint(x: width-cp, y: 0+cp))
        //        path.addQuadCurve(to: CGPoint(x: coordi_x(), y: height), control: CGPoint(x: width-cp, y: height-cp))
        //        path.addQuadCurve(to: CGPoint(x: 0, y: coordi_y), control: CGPoint(x: 0+cp, y: height-cp))
        
        path.addQuadCurve(to: CGPoint(x: coordi_x(), y: 0), control: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: width, y: coordi_y), control: CGPoint(x: width, y: 0))
        path.addQuadCurve(to: CGPoint(x: coordi_x(), y: height), control: CGPoint(x: width, y: height))
        path.addQuadCurve(to: CGPoint(x: 0, y: coordi_y), control: CGPoint(x: 0, y: height))
        
      }
    }
  }
}

//struct RandomImage_Previews: PreviewProvider {
//  static var previews: some View {
//    RandomImage()
//  }
//}
