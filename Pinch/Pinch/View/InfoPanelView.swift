//
//  InfoPanelView.swift
//  Pinch
//
//  Created by Iwy2th on 6/2/23.
//

import SwiftUI

struct InfoPanelView: View {
  // MARK: - PROPERTY
  var scale: CGFloat
  var offset: CGSize
  @State private var isInfoPanelVisible: Bool = false
  var body: some View {
    HStack {
      // MARK: - HOTSPOT
      Image(systemName: "location.circle")
        .symbolRenderingMode(.hierarchical)
        .resizable()
        .frame(width: 30, height: 30)
        .onLongPressGesture(minimumDuration: 0.5) {
          withAnimation(.easeOut) {
            isInfoPanelVisible.toggle()
          }
        }
      Spacer()
      // MARK: - INFO PANEL
      HStack(spacing: 2) {
        Spacer()
        Image(systemName: "arrow.up.left.and.arrow.down.right")
        Text("\(scale, specifier: "%.4f")")
        Spacer()
        Image(systemName: "arrow.left.and.right")
        Text("\(offset.width, specifier: "%.4f")")
        Spacer()
        Image(systemName: "arrow.up.and.down")
        Text("\(offset.height, specifier: "%.4f")")
        Spacer()
      }
      .font(.footnote)
      .padding(8)
      .background(.ultraThinMaterial)
      .cornerRadius(8)
      .frame(maxWidth: 420)
      .opacity(isInfoPanelVisible ? 1 : 0)
      
      Spacer()
    }
  }
}

struct InfoPanelView_Previews: PreviewProvider {
  static var previews: some View {
    InfoPanelView(scale: 1, offset: .zero)
      .preferredColorScheme(.dark)
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
