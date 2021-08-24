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
      TextView()
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

struct TextView: View {
  
  @State var coordinate: [CGFloat] = [30, 30]
  
  @State var text: String = ""
  
  @State var visible: Bool = false
  
  let timer = Timer.publish(every: 6, on: .main, in: .common).autoconnect()
  let width = UIScreen.main.bounds.width
  
  var body: some View {
    
    Text(self.text)
      .opacity(visible ? 1 : 0)
      .animation(.linear(duration: 2))
      .position(x: coordinate[0], y: coordinate[1])
      .onReceive(timer, perform: { _ in
        
        self.text = dummyData.EnglishArray.randomElement()!
        self.visible = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
          self.visible = false
          DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.coordinate = randomCoordinate()
          }
        }
      })
    
    
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
    
    let x_zero: CGFloat = 30
    let y_zero: CGFloat = 30
    
    let x = CGFloat.random(in: 0...width)
    let y = CGFloat.random(in: topPadding...height-(topPadding+bottomPadding))
    
    coordinate.append(x)
    coordinate.append(y)
    
    //  print(coordinate)
    
    return coordinate
  }
  
}


struct BottomButtonView: View {
  
  @State var isPresented1: Bool = false
  @State var isPresented2: Bool = false
  
  var body: some View {
    
    HStack(alignment: .center, spacing: 0) {
//      Text("Register")
//        .frame(maxWidth: .infinity)
//        .onTapGesture {
//          self.isPresented1.toggle()
//        }
//        .sheet(isPresented: self.$isPresented1) {
//          RegisterView()
//        }
      Button(action: {
        self.isPresented1.toggle()
      }, label: {
        Text("Register")
      })
      .sheet(isPresented: self.$isPresented1) {
        RegisterView()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .foregroundColor(.black)
      
      Rectangle()
        .foregroundColor(Color.black)
        .frame(width: Constants.Intro.border)
        .frame(maxHeight: .infinity)
      
      Text("Login")
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      
    }
    
  }
}



class dummyData {
  
  static let English = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  
  static let Korean = "사람들의 내 내 봅니다. 까닭이요, 벌레는 나는 듯합니다. 아무 우는 사람들의 잠, 다 별이 이름을 까닭입니다. 소녀들의 새겨지는 않은 하늘에는 버리었습니다. 이름과, 하나의 벌써 토끼, 새겨지는 별이 그리고 것은 없이 있습니다. 했던 위에 아름다운 덮어 밤을 그러나 이름과 까닭이요, 봅니다. 이름자를 어머니, 위에 별 나의 것은 계절이 버리었습니다. 나는 써 하나에 그리고 동경과 가을로 멀듯이, 계십니다. 위에 이네들은 가득 까닭입니다. 못 피어나듯이 아름다운 부끄러운 지나가는 잠, 봅니다. 이름과, 가을 별 아름다운 흙으로 별빛이 봅니다."
  
  static var arr1 = ["하나", "둘", "셋efegwgewg"]
  
  static var EnglishArray = English.components(separatedBy: " ")
  
}


struct IntroView_Previews: PreviewProvider {
  static var previews: some View {
    IntroView()
  }
}
