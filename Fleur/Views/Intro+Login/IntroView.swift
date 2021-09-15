//
//  IntroView.swift
//  Fleur
//
//  Created by minii on 2021/08/10.
//

import SwiftUI

// Fixedsize
//https://stackoverflow.com/questions/60888495/how-to-get-text-width-with-swiftui

// MARK: Main View
struct IntroView: View {
  
  @State var isPresented1: Bool = false
  
  var body: some View {
    
    VStack(spacing: 0) {
      TopButtonView()
        .frame(height: 50)
      
      Rectangle()
        .frame(height: Constants.Intro.border)
        .foregroundColor(.black)
      IntroTextView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      Rectangle()
        .frame(height: Constants.Intro.border)
        .foregroundColor(.black)
      
      BottomButtonView()
        .frame(height: 70)
    }
    .background(Image("papertexture")
                  .resizable()
                  .edgesIgnoringSafeArea(.all)
    )
    
  }
}

struct TopButtonView: View {
  var body: some View {
    HStack(alignment: .center, spacing: 0) {
      Text("Fleur")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
  }
}


//https://stackoverflow.com/questions/63530255/swiftui-change-text-with-fade-animation

struct IntroTextView: View {
  
  func returnVisibleTimeArray(start: Double, cntup: Double) -> [Double] {
    
    let count = 3
    
    var visibleTimeArray = [Double]()
    var visibleTime: Double = start
    visibleTimeArray.append(start)
    
    for _ in 1...count {
      visibleTime = cntup + visibleTime
      // 소수점 둘째자리까지 반올림
      visibleTime = round(visibleTime*100)/100
      visibleTimeArray.append(visibleTime)
    }
    
    return visibleTimeArray
  }
  
  var visibleTimeArray: [Double] = []
  
  init() {
    self.visibleTimeArray = returnVisibleTimeArray(start: 0.6, cntup: 0.05)
  }
  
  var body: some View {
    GeometryReader { geo in
      ZStack {
//                IntroImage(width: geo.size.width/3*2)
//        
//                FloatingText(animationTime: 2, visibleTime: 1, cgSize: CGSize.init(width: geo.size.width/2, height: geo.size.height/3), cgPointZero: CGPoint.init(x: 0, y: 0))
//                FloatingText(animationTime: 2, visibleTime: 1, cgSize: CGSize.init(width: geo.size.width/2, height: geo.size.height/3), cgPointZero: CGPoint.init(x: geo.size.width/2, y: 0))
//                FloatingText(animationTime: 2, visibleTime: 1, cgSize: CGSize.init(width: geo.size.width/2, height: geo.size.height/3), cgPointZero: CGPoint.init(x: 0, y: geo.size.height/3))
//                FloatingText(animationTime: 2, visibleTime: 1, cgSize: CGSize.init(width: geo.size.width/2, height: geo.size.height/3), cgPointZero: CGPoint.init(x: geo.size.width/2, y: geo.size.height/3))
//                FloatingText(animationTime: 2, visibleTime: 1, cgSize: CGSize.init(width: geo.size.width/2, height: geo.size.height/3), cgPointZero: CGPoint.init(x: 0, y: geo.size.height/3*2))
//                FloatingText(animationTime: 2, visibleTime: 1, cgSize: CGSize.init(width: geo.size.width/2, height: geo.size.height/3), cgPointZero: CGPoint.init(x: geo.size.width/2, y: geo.size.height/3*2))
        
      }
    }
    //        IntroImage()
    //
    //        ForEach(visibleTimeArray, id: \.self) { visibleTime in
    //          FloatingText(animationTime: Double.random(in: 2.7...3.3), visibleTime: visibleTime)
    //        }
  }
}





struct IntroImage: View {
  
  static var width: CGFloat = 200
  static var height: CGFloat = width * 1.618
  
  @State var visible = false
  @State var imageFileName = "1"
  
  var timer = Timer.publish(every: 8, on: .main, in: .common).autoconnect()
  
  init(width: CGFloat) {
    IntroImage.width = width
    IntroImage.height = width * 1.618
  }
  
  var body: some View {
    Image(imageFileName)
      .resizable()
      .aspectRatio(contentMode: .fill)
      .frame(width: IntroImage.width, height: IntroImage.height, alignment: .center)
      .clipShape(RandomCircle())
      .animation(nil)
      .opacity(visible ? 1 : 0)
      .animation(.easeOut(duration: 3))
      .onReceive(timer, perform: { _ in
        self.imageFileName = dummyData.ImageArray.randomElement()!
        self.visible = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5)) {
          self.visible = false
        }
      })
  }
  
  
  struct RandomCircle: Shape {
    func path(in rect: CGRect) -> Path {
      
      let coordi_y = CGFloat.random(in: height/2-30...height/2+30)
      let coordi_x = {
        return CGFloat.random(in: width/2-50...width/2+50)
      }
      let cp: CGFloat = 20
      
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

// animation completion 부분 extention 으로 구현하기..
// visible time = 1
struct FloatingText: View {
  
  @State var randomCGPoint: CGPoint
  @State var randomCGSize: CGSize
  
  @State var text: String = ""
  
  @State var visible: Bool = false
  
  let visibleTime: Double
  let animationTime: Double
  let cgSize: CGSize
  let cgPoint_Zero: CGPoint
  
  var timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
  
  init(animationTime: Double, visibleTime: Double, cgSize: CGSize, cgPointZero: CGPoint) {
    self.animationTime = animationTime
    self.visibleTime = visibleTime
    self.timer = Timer.publish(every: TimeInterval(visibleTime*2 + animationTime*2), on: .main, in: .common).autoconnect()
    self.cgSize = cgSize
    self.cgPoint_Zero = cgPointZero
    self.randomCGSize = cgSize
    self.randomCGPoint = cgPointZero
  }
  
  var body: some View {
    Group {
      Rectangle()
        .border(Color.green, width: 5)
        .frame(width: cgSize.width, height: cgSize.height, alignment: .center)
        .position(x: cgPoint_Zero.x + cgSize.width/2, y: cgPoint_Zero.y + cgSize.height/2)
        .foregroundColor(.clear)
      
      Text(self.text)
        .border(Color.red, width: 5)
        .font(.custom("Times New Roman", size: 100))
        .minimumScaleFactor(0.001)
        .frame(width: randomCGSize.width, height: randomCGSize.height, alignment: .leading)
        .position(x: randomCGPoint.x, y: randomCGPoint.y)
        .animation(nil)
        .opacity(visible ? 1 : 0)
        .animation(.easeOut(duration: animationTime))
        .onReceive(timer, perform: { _ in
          text = dummyData.EnglishArray.randomElement()!
          randomCGSize = randomSize()
          randomCGPoint = randomPoint()
          self.visible = true
          DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Int(visibleTime+animationTime))) {
            self.visible = false
          }
        })
    }
  }
  
  func randomSize() -> CGSize {
    var randomSize = CGSize()
    
    let maxWidth = self.cgSize.width
    let maxHeight = self.cgSize.height
    let minWidth = self.cgSize.width/2
    let minHeight = self.cgSize.height/2
    
    randomSize.width = CGFloat.random(in: minWidth...maxWidth)
    randomSize.height = CGFloat.random(in: minHeight...maxHeight)
    
    return randomSize
  }
  
  func randomPoint() -> CGPoint {
    var randomPoint = CGPoint()
    
    // position기준(가운데) + randomsize/2
    let min_X = cgPoint_Zero.x + randomCGSize.width/2
    let min_Y = cgPoint_Zero.y + randomCGSize.height/2
    // position기준(가운데) + cgsize - randomsize/2
    let max_X = cgPoint_Zero.x + cgSize.width - randomCGSize.width/2
    let max_Y = cgPoint_Zero.y + cgSize.height - randomCGSize.height/2
    
    randomPoint.x = CGFloat.random(in: min_X...max_X)
    randomPoint.y = CGFloat.random(in: min_Y...max_Y)
    
    return randomPoint
  }
}


struct BottomButtonView: View {
  
  @State var showRegisterSheet: Bool = false
  @State var showLoginSheet: Bool = false
  
  var body: some View {
    
    HStack(alignment: .center, spacing: 0) {
      
      Button("Login") {
        showLoginSheet.toggle()
      }
      .sheet(isPresented: $showLoginSheet) {
        LoginView()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .foregroundColor(.black)
      
      Rectangle()
        .foregroundColor(Color.black)
        .frame(width: Constants.Intro.border)
        .frame(maxHeight: .infinity)
      
      Button("Register") {
        showRegisterSheet.toggle()
      }
      .sheet(isPresented: $showRegisterSheet) {
        RegisterView()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .foregroundColor(.black)
      
    }
    
  }
}



class dummyData {
  
  static let English = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  
  static let Korean = "사람들의 내 내 봅니다. 까닭이요, 벌레는 나는 듯합니다. 아무 우는 사람들의 잠, 다 별이 이름을 까닭입니다. 소녀들의 새겨지는 않은 하늘에는 버리었습니다. 이름과, 하나의 벌써 토끼, 새겨지는 별이 그리고 것은 없이 있습니다. 했던 위에 아름다운 덮어 밤을 그러나 이름과 까닭이요, 봅니다. 이름자를 어머니, 위에 별 나의 것은 계절이 버리었습니다. 나는 써 하나에 그리고 동경과 가을로 멀듯이, 계십니다. 위에 이네들은 가득 까닭입니다. 못 피어나듯이 아름다운 부끄러운 지나가는 잠, 봅니다. 이름과, 가을 별 아름다운 흙으로 별빛이 봅니다."
  
  static var arr1 = ["하나", "둘", "셋efegwgewg"]
  
  static var EnglishArray = English.components(separatedBy: " ")
  
  static let ImageArray: [String] = {
    var a = [String]()
    for i in stride(from: 1, through: 15, by: 1) {
      a.append(String(i))
    }
    return a
  }()
}


struct IntroView_Previews: PreviewProvider {
  static var previews: some View {
    IntroView()
  }
}
