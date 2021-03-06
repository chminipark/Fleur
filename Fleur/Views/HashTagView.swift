//
//  HashTagView.swift
//  Fleur
//
//  Created by minii on 2021/08/17.
//

// lazy stack 사용해보기..
import SwiftUI

// swiftui에서 콜렉션뷰 만들기
//https://stackoverflow.com/questions/56466306/uicollectionview-and-swiftui

struct HashTagView: View {
  
  @ObservedObject var hashTagViewModel = HashTagViewModel()
  
  @State var data = dummyData.EnglishArray
  
  @State var searchText: String = ""
  
  var body: some View {
    NavigationView {
      VStack {
        SearchBar(searchText: $searchText)
        
        ScrollView(.vertical, showsIndicators: false, content: {
          
          VStack(spacing: 20) {
            ForEach(searchText.isEmpty ? data : data.filter({($0.lowercased()).contains(self.searchText.lowercased())}),
                    id: \.self,
                    content: { data in
                      HashTagText(text: data, animatedText: searchText)
                    })
          }
        })
        .padding([.horizontal, .bottom])
        .frame(maxWidth: .infinity)
      }
      .navigationBarTitle("")
      .navigationBarHidden(true)
      .modifier(SetBackground())
    }
  }
}

// searchable List 헤더부분에 고정? (searchable)
struct SearchBar: View {
  
  @State var isSearch = false
  @Binding var searchText: String
  
  var body: some View {
    
    if isSearch {
      HStack {
        HStack {
          Image(systemName: "magnifyingglass")
            .foregroundColor(.gray)
          TextField("Search...", text: $searchText)
          Button(action: {
            withAnimation {
              searchText = ""
            }
          }, label: {
            Image(systemName: "xmark.circle")
              .foregroundColor(.gray)
          })
        }
        .padding()
        .background(Color.init(.systemGray5))
        .clipShape(RoundedRectangle(cornerRadius: 15))
        
        Button(action: {
          withAnimation {
            isSearch.toggle()
          }
        }, label: {
          Text("Cancel")
        })
        
      }
      .padding(.horizontal)
    }
    
    
    else {
      HStack {
        Text("Sep. 16.")
          .font(.system(size: 30))
          .fontWeight(.semibold)
        
        Spacer()
        
        Button(action: {
          withAnimation(.easeOut) {
            isSearch.toggle()
//            fbAuth.signOut()
          }
        }, label: {
          Image(systemName: "magnifyingglass")
            .font(.system(size: 20, weight: .bold))
            .foregroundColor(.black)
        })
        
//        NavigationLink(
//          destination: DiaryView(),
//          label: {
//            Image(systemName: "pencil.tip.crop.circle")
//              .font(.system(size: 20, weight: .bold))
//              .foregroundColor(.black)
//          })
      }
      .padding(.top, 20)
      .padding(.bottom, 10)
      .padding(.horizontal)
      
    }// View
  }
}

//struct HashTagTextView: View {
//  var body: some View {
//
//  }
//}

//class ViewModel: ObservableObject {
//  var items = [[0, 1], [2, 3], [4, 5]]
//}
//
//struct ExampleView: View {
//  @ObservedObject var viewModel = ViewModel()
//  @State var selection: Bool? = false
//  @State var itemIndex = 0
//
//  var body: some View {
//
//    VStack {
//      NavigationLink(destination: Text(String(self.itemIndex)), tag: true, selection: self.$selection, label: {EmptyView()})
//      List {
//        ForEach(self.viewModel.items, id: \.self) { row in
//          HStack {
//            ForEach(row, id: \.self) { item in
//              Text(String(item))
//                .frame(width: 180, height: 200)
//                .background(Color.green)
//                .onTapGesture {
//                  self.selection = true
//                  self.itemIndex = item
//                }
//            }
//          }
//        }
//      }
//
//    }
//  }
//}





// Hstack 으로 활용..
struct HashTagText: View {
  
  var text: String
  
  var animatedText: String
  
  @State var animation = false
  
  var body: some View {
    
    ZStack {
      
      Text(text)
        .font(.system(size: 50, weight: .semibold))
        .foregroundColor(Color.black.opacity(0.5))
      
      // MultiColor Text
      if !animatedText.isEmpty {
        HStack(spacing:0) {
          ForEach(0..<text.count, id: \.self, content: { index in
            Text(String(text[text.index(text.startIndex, offsetBy: index)]))
              .font(.system(size: 50, weight: .semibold))
              .foregroundColor(searchTextIndex(sentence: text, search: animatedText).contains(index) ? randomColor() : Color.black.opacity(0.5))
            
          })
        }
        .mask(
          
          Rectangle()
            
            // 색상 그라데이션
            .fill(
              
              LinearGradient(gradient: .init(colors: [Color.black.opacity(1)]), startPoint: .top, endPoint: .bottom)
            )
            
            .rotationEffect(.init(degrees: 70))
            .padding(20)
            
            .offset(x: -250)
            .offset(x: animation ? 500 : 0)
          
        )
        .onAppear(perform: {
          
          withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
            animation.toggle()
          }
          
        })
      }
      
    }
  }
  
  func randomColor() -> Color {
    let color = UIColor(red: CGFloat.random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1)
    return Color(color)
  }
  
  func searchTextIndex(sentence: String, search searchText: String) -> [Int] {
    
    var sentence = sentence
    var start = 0
    var cnt = 1
    var indexS = [Int]()
    
    while let range = sentence.range(of: searchText, options: .caseInsensitive) {
      start += sentence.distance(from: sentence.startIndex, to: range.lowerBound)
      indexS.append(start)
      while cnt != searchText.count {
        let index = start + cnt
        indexS.append(index)
        cnt += 1
      }
      cnt = 1
      start += sentence.distance(from: sentence.startIndex, to: range.upperBound) - 1
      sentence = String(sentence[sentence.index(range.upperBound, offsetBy: 0)...])
    }
    
    return indexS
  }
  
  
}

struct HashTagView_Previews: PreviewProvider {
  static var previews: some View {
    HashTagView()
  }
}
