//
//  ExpandableButtonPanel.swift
//  Fleur
//
//  Created by minii on 2021/10/09.
//

import SwiftUI

// MARK: - ExpandableButtonPanel
struct ExpandableButtonPanel: View {
  
  let primaryButton: ExpandableButtonItem
  let expandedButtons: [ExpandableButtonItem]
  
  private let size: CGFloat = 40
//  private let border: CGFloat = 5
  
  @State private var isExpanded = false
  
  var body: some View {
    ZStack {
      
      // border
//      VStack {
//        if isExpanded && expandedButtons.count > 0 {
//          ForEach(1...expandedButtons.count, id: \.self) { any in
//            Rectangle()
//              .foregroundColor(.clear)
//              .frame(width: size+border, height: size)
//          }
//        }
//        Rectangle()
//          .foregroundColor(.clear)
//          .frame(width: size+border, height: size+border)
//      }
//      .background(Color.black)
//      .clipShape(Capsule())
      
      // button
      // https://stackoverflow.com/questions/59012083/how-to-increase-tappable-area-of-navigationbaritem-in-swiftui
      // how to increase tappable area
      VStack {
        if isExpanded {
          ForEach(expandedButtons) { button in
            Button {
              button.action?()
            } label: {
              button.label
                .modifier(ButtonImageDesign(color: .black))
                .frame(width: size, height: size)
            }
//            .frame(width: size, height: size)
            
          }
        }
        
        Button {
          primaryButton.action?()
          withAnimation {
            isExpanded.toggle()
          }
        } label: {
          primaryButton.label
            .modifier(ButtonImageDesign(color: .black))
            .frame(width: size, height: size)
        }
//        .frame(width: size, height: size)
      }
      
    }
  }
}

// MARK: - ExpandableButtonItem
struct ExpandableButtonItem: Identifiable {
  let id = UUID()
  let label: Image
  let action: (() -> Void)?
  
  init (label: Image, action: (() -> Void)? = nil) {
    self.label = label
    self.action = action
  }
  
}
