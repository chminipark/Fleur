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
  
  @State private var isEditMode = false
  //  @State private var isAddTextEditor = false
  
  @FocusState private var focusOnLastContent: Int?
  
//  var contentList: [_DiaryContent]
  
  let dataDiary: Diary
  
  init(diaryData: Diary) {
    //    UINavigationBar.appearance().barTintColor = .clear
    //    UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
//    self.contentList = contentList
    self.dataDiary = diaryData
    print(diaryData)
    UITableView.appearance().backgroundColor = UIColor.bgColor
  }
  
  //  private func getIndex(content: DiaryContent) -> Int {
  //    let index = diaryViewModel.contents.firstIndex { (data) -> Bool in
  //      return data.id == content.id
  //    } ?? 0
  //    return index
  //  }
  
  var body: some View {
    VStack {
      // MARK: CustomNavBar
//      DiaryViewCustomNavBar()
      DiaryViewCustomNavBar(date: dataDiary.date)
        .opacity(diaryViewModel.isShowDrawingView ? 0 : 1)
      
      ZStack {
        // MARK: List
        List {
          ForEach(dataDiary.contents.indices, id: \.self) { index in
            DiaryRowView(content: dataDiary.contents[index])
              .frame(height: 200)
            
              .focused($focusOnLastContent, equals: index)
            //              .onChange(of: isAddTextEditor) { _ in
            //
            //
            //              }
            
          }
          //          .onDelete(perform: removeRows)
          //          .onMove(perform: moveRows)
          .listRowBackground(Color.bgColor)
          
          
          
        }
        .environment(\.editMode, .constant(isEditMode ? EditMode.active : EditMode.inactive))
        .navigationBarHidden(true)
        .blur(radius: diaryViewModel.isShowDrawingView ? 7 : 0)
        
        // MARK: Expandable Button
        if !(diaryViewModel.isShowDrawingView) {
          VStack {
            
            Spacer()
            
            HStack(alignment:.bottom) {
              
              ExpandableButtonPanel(primaryButton: ExpandableButtonItem(label: Image(systemName: "minus"), action: {isEditMode.toggle()}), expandedButtons: [])
              
              Spacer()
              
              ExpandableButtonPanel(primaryButton: ExpandableButtonItem(label: Image(systemName: "plus")), expandedButtons: [
                
                ExpandableButtonItem(label: Image(systemName: "photo"), action: {
                  withAnimation {
                    diaryViewModel.isShowDrawingView.toggle()
                  }
                }),
                
                ExpandableButtonItem(label: Image(systemName: "textformat.abc"), action: {
                  diaryViewModel.addContentText()
                  DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
                    focusOnLastContent = diaryViewModel.contents.count-1
                  }
                })
                
              ])
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
}

// MARK: - Function
extension DiaryView {
//  mutating func removeRows(at offsets: IndexSet) {
//    //    diaryViewModel.contents.remove(atOffsets: offsets)
//    contentList.remove(atOffsets: offsets)
//  }
//
//  mutating func moveRows(from source: IndexSet, to destination: Int) {
//    //    diaryViewModel.contents.move(fromOffsets: source, toOffset: destination)
//    contentList.move(fromOffsets: source, toOffset: destination)
//  }
}

struct DiaryView_Previews: PreviewProvider {
  static var previews: some View {
    DiaryView(diaryData: Diary.returnDiaryMock()[0])
  }
}
