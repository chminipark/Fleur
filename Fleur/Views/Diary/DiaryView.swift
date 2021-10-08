//
//  DiaryView.swift
//  Fleur
//
//  Created by minii on 2021/08/17.
//

import SwiftUI

// MARK: - DiaryView
struct DiaryView: View {
  
  @StateObject var diaryViewModel = DiaryViewModel()
  
  @State private var isShowAddACSheet = false
  @State private var isEditMode = false
  
  init() {
    //    UINavigationBar.appearance().barTintColor = .clear
    //    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
    UITableView.appearance().backgroundColor = UIColor.bgColor
  }
  
  var body: some View {
    VStack {
      
      DiaryViewCustomNavBar()
      
      ZStack {
        List {
          ForEach(diaryViewModel.contents) { data in
            DiaryRowView(content: data)
          }
          .onDelete(perform: removeRows)
          .onMove(perform: moveRows)
          .listRowBackground(Color.bgColor)
        }
        .environment(\.editMode, .constant(isEditMode ? EditMode.active : EditMode.inactive))
        .navigationBarHidden(true)
//        .actionSheet(isPresented: $isShowAddACSheet) {
//          ActionSheet(title: Text("추가하기"), message: Text("선택해주세요"), buttons:
//                        [.default(Text("글"), action: {
//                          diaryViewModel.addContentText()
//                        }),
//                        .default(Text("그림"), action: {
//                          withAnimation {
//                            diaryViewModel.isShowDrawingView.toggle()
//                          }
//                        })
//                        ]
//          )
//        }
        .blur(radius: diaryViewModel.isShowDrawingView ? 7 : 0)
//        .fullScreenCover(isPresented: $isShowDrawingView) {
//          DrawingView(isShowDrawingView: $isShowDrawingView)
//        }
        
        if !(diaryViewModel.isShowDrawingView) {
          VStack {
            
            Spacer()
            
            HStack(alignment:.bottom) {
              
              Button {
                isEditMode.toggle()
              } label: {
                Image(systemName: "minus.circle")
                  .modifier(ButtonImageDesign())
              }
              
              Spacer()
              
              ExpandableButtonPanel(primaryButton: ExpandableButtonItem(label: Image(systemName: "plus")), expandedButtons: [
                ExpandableButtonItem(label: Image(systemName: "photo")),
                ExpandableButtonItem(label: Image(systemName: "textformat.abc")),
              ])
                .padding()
              
//              Button {
//                isShowAddACSheet.toggle()
//              } label: {
//                Image(systemName: "plus.circle")
//                  .modifier(ButtonImageDesign())
//              }
            }
            .padding()
          }
        }
      }
    }
    .background(Color.bgColor.ignoresSafeArea())
    .overlay(
      diaryViewModel.isShowDrawingView ? DrawingView().environmentObject(diaryViewModel) : nil
    )
    
  } // body
  
  func removeRows(at offsets: IndexSet) {
    diaryViewModel.contents.remove(atOffsets: offsets)
  }
  
  func moveRows(from source: IndexSet, to destination: Int) {
    diaryViewModel.contents.move(fromOffsets: source, toOffset: destination)
  }
} // DiaryView

// MARK: - DiaryViewCustomNavBar
struct DiaryViewCustomNavBar: View {
  var body: some View {
    HStack {
      
      Button(action: {
        print(#fileID, #function, #line)
      }, label: {
        Image(systemName: "chevron.backward")
          .modifier(ButtonImageDesign())
      })
      
      Spacer()
      
      Button(action: {
        print(#fileID, #function, #line)
      }, label: {
        Image(systemName: "square.and.arrow.down")
          .modifier(ButtonImageDesign())
      })
      
    }
    .padding()
    .frame(height: 45)
  }
}

// MARK: - DiaryRowView
struct DiaryRowView: View {
  
  var content: DiaryContent
  
  @State var text: String
  
  init(content: DiaryContent) {
    self.content = content
    self._text = .init(initialValue: content.text ?? "failed init")
  }
  
  var body: some View {
    
    if let img = content.photo {
      HStack {
        Spacer()
        Image(uiImage: img)
          .resizable()
          .frame(width: 200, height: 200)
        Spacer()
      }
    }
    
    else if content.text != nil {
      ZStack {
        TextEditor(text: $text)
        Text(text)
          .opacity(0)
          .padding(.all, 8)
      }
    }
    
    else {
      Text("nodata???")
    }
  }
}

// MARK: - ExpandableButtonPanel

struct ExpandableButtonItem: Identifiable {
  let id = UUID()
  let label: Image
  let action: (() -> Void)? = nil
  
  var image: ModifiedContent<Image, ButtonImageDesign> {
    get { label.modifier(ButtonImageDesign()) }
  }
}

struct ExpandableButtonPanel: View {
  
  let primaryButton: ExpandableButtonItem
  let expandedButtons: [ExpandableButtonItem]
  
  private let size: CGFloat = 60
  private var cornerRadius: CGFloat {
    get { size / 2 }
  }
  
  @State var isExpanded = false
  
  var body: some View {
    ZStack {
      
      
      VStack {
        if isExpanded {
          ForEach(expandedButtons) { button in
            Button {
              button.action?()
            } label: {
              button.label
            }
            .frame(width: size, height: size)
            
          }
        }
        
        Button {
          primaryButton.action?()
          withAnimation {
            isExpanded.toggle()
          }
        } label: {
          primaryButton.label.modifier(ButtonImageDesign())
        }
  //      .padding()
        
        .frame(width: size, height: size)
      }
    }
    .background(Color.white)
    
    
    .cornerRadius(cornerRadius)
    
    
    
  }
}


struct WriteDiaryView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DiaryView()
      //      DiaryCustomNavBar()
      
    }
  }
}
