import SwiftUI
import AppIconCreator

public struct ExampleAppIconView: View, Equatable {
  public init() {}

  public var body: some View {
    GeometryReader { geometry in
      Image(systemName: "leaf.fill")
        .resizable()
        .scaledToFit()
        .font(Font.body.bold())
        .overlayMask(LinearGradient(
          gradient: Gradient(colors: [.green, .yellow]),
          startPoint: .top,
          endPoint: .bottom
        ))
        .padding(geometry.size.width * 0.15)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    .background(
      LinearGradient(
        gradient: Gradient(colors: [.blue, .purple]),
        startPoint: .top,
        endPoint: .bottom
      )
    )
  }
}

extension View {
  func overlayMask<Overlay: View>(_ overlay: Overlay) -> some View {
    self.overlay(overlay).mask(self)
  }
}

struct ExampleAppIconView_Preivews: PreviewProvider {
  static var previews: some View {
    IconPreviews(
      icon: ExampleAppIconView(),
      configs: .iOS
    )
  }
}
