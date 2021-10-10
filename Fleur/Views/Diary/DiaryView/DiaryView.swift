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
        .blur(radius: diaryViewModel.isShowDrawingView ? 7 : 0)
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
        
        //        .fullScreenCover(isPresented: $isShowDrawingView) {
        //          DrawingView(isShowDrawingView: $isShowDrawingView)
        //        }
        
        if !(diaryViewModel.isShowDrawingView) {
          VStack {
            
            Spacer()
            
            HStack(alignment:.bottom) {
              
//              Button {
//                isEditMode.toggle()
//              } label: {
//                Image(systemName: "minus")
//                  .modifier(ButtonImageDesign())
//              }
//              .frame(width: 50, height: 50)
              ExpandableButtonPanel(primaryButton: ExpandableButtonItem(label: Image(systemName: "minus"), action: {isEditMode.toggle()}), expandedButtons: [])
//                .padding()
              
              Spacer()
              
              ExpandableButtonPanel(primaryButton: ExpandableButtonItem(label: Image(systemName: "plus")), expandedButtons: [
                ExpandableButtonItem(label: Image(systemName: "photo"), action: {
                  withAnimation {
                    diaryViewModel.isShowDrawingView.toggle()
                  }
                }),
                ExpandableButtonItem(label: Image(systemName: "textformat.abc"), action: {
                  diaryViewModel.addContentText()
                }),
              ])
//                .padding()
              
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

struct WriteDiaryView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      DiaryView()
    }
  }
}
