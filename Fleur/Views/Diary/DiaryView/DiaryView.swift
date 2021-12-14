//
//  DiaryView.swift
//  Fleur
//
//  Created by minii on 2021/08/17.
//

import SwiftUI

// MARK: - DiaryView
struct DiaryView: View {
  
  @State private var isShowDrawingView = false
  @State private var isEditMode = false
  
  @StateObject var diaryViewModel = DiaryViewModel()
  @FocusState private var focusOnLastContent: Int?
  @ObservedObject var diaryForm: DiaryForm
  
  init(diaryForm: DiaryForm) {
    self.diaryForm = diaryForm
    UITableView.appearance().backgroundColor = UIColor.bgColor
  }
  
  var body: some View {
    VStack {
      // MARK: CustomNavBar
      DiaryViewCustomNavBar(diaryForm: diaryForm)
        .opacity(isShowDrawingView ? 0 : 1)
      
      ZStack {
        // MARK: List
        List {
          ForEach(diaryForm.contents.indices, id: \.self) { index in
            DiaryRowView(content: diaryForm.contents[index])
              .frame(height: 200)
              .focused($focusOnLastContent, equals: index)
          }
          //          .onDelete(perform: removeRows)
          //          .onMove(perform: moveRows)
          .listRowBackground(Color.bgColor)
        } // List
//        .environment(\.editMode, .constant(isEditMode ? EditMode.active : EditMode.inactive))
        .navigationBarHidden(true)
        .blur(radius: isShowDrawingView ? 7 : 0)
        
        // MARK: Expandable Button
        if !(isShowDrawingView) {
          VStack {
            
            Spacer()
            
            HStack(alignment:.bottom) {
              
              // minus
              ExpandableButtonPanel(
                primaryButton: ExpandableButtonItem(
                  label: Image(systemName: "minus"),
                  action: {isEditMode.toggle()}
                ),
                expandedButtons: []
              )
              
              Spacer()
              
              // plus
              ExpandableButtonPanel(
                primaryButton: ExpandableButtonItem(
                  label: Image(systemName: "plus")
                ),
                
                expandedButtons: [
                  ExpandableButtonItem(
                    label: Image(systemName: "photo"),
                    action: {
                      withAnimation {
                        isShowDrawingView.toggle()
                      }
                    }
                  ),
                  
                  ExpandableButtonItem(
                    label: Image(systemName: "textformat.abc"),
                    action: {
                      diaryForm.contents.append(_DiaryContent())
                      DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(300)) {
                        focusOnLastContent = diaryForm.contents.count-1
                      }
                    }
                  )
                ] // expanded item
              ) // plus
            }
            .padding()
          }
        } // Expandable Button
      }
    }
    .background(Color.bgColor.ignoresSafeArea())
    .overlay(
      isShowDrawingView ?
      DrawingView(isShowDrawingView: $isShowDrawingView, diaryForm: diaryForm)
        .environmentObject(diaryViewModel)
      : nil
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

//struct DiaryView_Previews: PreviewProvider {
//  static var previews: some View {
//    DiaryView(diaryData: Diary.returnDiaryMock()[0])
//  }
//}
