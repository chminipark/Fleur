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
  
  @State private var isShowButton = true
  @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  @State private var time: Double = 0
  
  let animationTime: Double
  let visibleTime: Double
    
  init(animationTime: Double, visibleTime: Double) {
    self.animationTime = animationTime
    self.visibleTime = visibleTime
    
//    self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  }
  
  var body: some View {
    
    VStack(spacing: 0) {
      // top
      VStack(alignment: .center, spacing: 0) {
        Text("Fleur")
          .foregroundColor(.black)
          .font(.system(size: 30))
          .frame(height: 45)
        // line
        IntroLine()
      }
      .opacity(isShowButton ? 1 : 0)
      .animation(.easeInOut(duration: animationTime), value: isShowButton)
      
      // middle
      MiddleTextAndImageView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      
      // Bottom
      VStack(alignment: .center, spacing: 0) {
        // line
        IntroLine()
        // bottom
        BottomButtonView()
          .frame(height: 45)
      }
      .opacity(isShowButton ? 1 : 0)
      .animation(.easeInOut(duration: animationTime), value: isShowButton)
//      .onReceive(timer) { _ in
//        time += 1
//        print(time)
//        if time == (animationTime+visibleTime) {
//          isShowButton.toggle()
//          timerCancel()
//        }
//      }
      
    }
    .background(Color.bgColor.ignoresSafeArea())
    .onTapGesture {
      isShowButton.toggle()
      time = 0
      timerStart()
    }
    .onReceive(timer) { _ in
      time += 1
      print(time)
      if time == (animationTime+visibleTime) {
        isShowButton.toggle()
        timerCancel()
        print(isShowButton)
        print(time)
      }
    }
    
    
  }// body
  
  func timerCancel() {
    timer.upstream.connect().cancel()
  }
  
  func timerStart() {
    timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  }
}

struct IntroLine: View {
  var body: some View {
    Rectangle()
      .frame(height: Constants.Intro.border)
      .foregroundColor(.black)
  }
}

//https://stackoverflow.com/questions/63530255/swiftui-change-text-with-fade-animation

struct MiddleTextAndImageView: View {
  
  var body: some View {
    GeometryReader { geo -> AnyView in
      
      let width = geo.size.width
      let height = geo.size.height
      let middleplus = (height/3)/5
      
      return AnyView(
        ZStack {
          
          RandomImage(width: width/5*3, visibleTime: 8, invisibleTime: 1.5, animationTime: 4)
          
          VStack(spacing: 0) {
            HStack(spacing: 0) {
              FloatingText(animationTime: 2.8)
              FloatingText(animationTime: 3.1)
            }
            .frame(maxHeight: .infinity)
            VStack(spacing: 0) {
              FloatingText(animationTime: 3.2, visibleTime: 2.3, textColor: .white)
                .frame(width: width-(middleplus*2), height: ((height/3)+(middleplus))/2+(middleplus))
              HStack(spacing: 0) {
                FloatingText(animationTime: 2.6)
                FloatingText(animationTime: 2.4)
              }
            }
            .frame(height: (height/3)+(middleplus))
            HStack(spacing: 0) {
              FloatingText(animationTime: 3.1, visibleTime: 1.7)
                .frame(width: (width/2)+(middleplus))
              FloatingText(animationTime: 3)
                .frame(maxWidth: .infinity)
            }
            .frame(maxHeight: .infinity)
          }
          
        }
      )
    }
  }
}


struct BottomButtonView: View {
  
  @State var showRegisterSheet: Bool = false
  @State var showLoginSheet: Bool = false
  
  var body: some View {
    
    HStack(alignment: .center, spacing: 0) {
      
      Button {
        showLoginSheet.toggle()
      } label: {
        Text("Login")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .foregroundColor(.black)
      }
//      .sheet(isPresented: $showLoginSheet) {
////        LoginView()
//      }
                  
      Rectangle()
        .foregroundColor(Color.black)
        .frame(width: Constants.Intro.border)
        .frame(maxHeight: .infinity)
      
      Button {
        showRegisterSheet.toggle()
      } label: {
        Text("Register")
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .foregroundColor(.black)
      }
//      .sheet(isPresented: $showRegisterSheet) {
//        RegisterView()
//      }
                  
    }
  }
}





//struct BottomButtonView: View {
//
//  @State var showRegisterSheet: Bool = false
//  @State var showLoginSheet: Bool = false
//
//  var body: some View {
//
//    HStack(alignment: .center, spacing: 0) {
//
//      Button("Login") {
//        showLoginSheet.toggle()
//      }
//      .sheet(isPresented: $showLoginSheet) {
//        LoginView()
//      }
//      .frame(maxWidth: .infinity, maxHeight: .infinity)
//      .foregroundColor(.black)
//
//      Rectangle()
//        .foregroundColor(Color.black)
//        .frame(width: Constants.Intro.border)
//        .frame(maxHeight: .infinity)
//
//      Button("Register") {
//        showRegisterSheet.toggle()
//      }
//      .sheet(isPresented: $showRegisterSheet) {
//        RegisterView()
//      }
//      .frame(maxWidth: .infinity, maxHeight: .infinity)
//      .foregroundColor(.black)
//
//    }
//
//  }
//}



class dummyData {
  
  static let English = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  
  static let Korean = "???????????? ??? ??? ?????????. ????????????, ????????? ?????? ????????????. ?????? ?????? ???????????? ???, ??? ?????? ????????? ???????????????. ???????????? ???????????? ?????? ???????????? ??????????????????. ?????????, ????????? ?????? ??????, ???????????? ?????? ????????? ?????? ?????? ????????????. ?????? ?????? ???????????? ?????? ?????? ????????? ????????? ????????????, ?????????. ???????????? ?????????, ?????? ??? ?????? ?????? ????????? ??????????????????. ?????? ??? ????????? ????????? ????????? ????????? ?????????, ????????????. ?????? ???????????? ?????? ???????????????. ??? ??????????????? ???????????? ???????????? ???????????? ???, ?????????. ?????????, ?????? ??? ???????????? ????????? ????????? ?????????."
  
  static var arr1 = ["??????", "???", "???efegwgewg"]
  
  static var EnglishArray = English.components(separatedBy: " ")
  
  static let ImageArray: [String] = {
    var a = [String]()
    for i in stride(from: 1, through: 14, by: 1) {
      a.append(String(i))
    }
    return a
  }()
}


//struct IntroView_Previews: PreviewProvider {
//  static var previews: some View {
//    IntroView()
//  }
//}
