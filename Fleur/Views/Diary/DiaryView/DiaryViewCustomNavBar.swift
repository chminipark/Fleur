//
//  DiaryViewCustomNavBar.swift
//  Fleur
//
//  Created by minii on 2021/10/09.
//

import SwiftUI

// MARK: - DiaryViewCustomNavBar
struct DiaryViewCustomNavBar: View {
  
  @EnvironmentObject var dbManager: DiaryDBManager
//  @StateObject var diaryViewModel = DiaryViewModel()
  @ObservedObject var diaryForm: DiaryForm
  
  // Custom navigationBarBackButton
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    HStack {

      Button(action: {
        presentationMode.wrappedValue.dismiss()
      }, label: {
        Image(systemName: "chevron.backward")
          .modifier(ButtonImageDesign(color: .black))
      })

      Spacer()
      
      Text(diaryForm.date)
      
      Spacer()

      Button(action: {
        dbManager.saveInDB(id: diaryForm.id, date: diaryForm.date, contents: diaryForm.contents)
//        diaryViewModel.saveInDB(id: diaryForm.id, date: diaryForm.date, contents: diaryForm.contents)
        presentationMode.wrappedValue.dismiss()
      }, label: {
        Image(systemName: "square.and.arrow.down")
          .modifier(ButtonImageDesign(color: .black))
      })

    }
    .padding()
    .frame(height: 45)
  }
}

