import SwiftUI
import AppIconCreator

public struct ExampleAppIconView: View {
  public enum Platform {
    case iOS
    case macOS
  }

  public init(_ platform: Platform) {
    self.platform = platform
  }

  var platform: Platform

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
        .padding(geometry.size.width * 0.18)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
          LinearGradient(
            gradient: Gradient(colors: [.blue, .purple]),
            startPoint: .top,
            endPoint: .bottom
          )
        )
        .if(platform == .macOS) {
          $0.overlay(
            RoundedRectangle(
              cornerRadius: geometry.size.width * 0.4,
              style: .continuous
            )
            .strokeBorder(
              lineWidth: geometry.size.width * 0.06
            )
            .overlayMask(
              LinearGradient(
                gradient: Gradient(colors: [.purple, .blue]),
                startPoint: .top,
                endPoint: .bottom
              )
            )
            .shadow(
              color: Color.black.opacity(0.5),
              radius: geometry.size.width * 0.015
            )
          )
          .clipShape(
            RoundedRectangle(
              cornerRadius: geometry.size.width * 0.4,
              style: .continuous
            )
          )
        }
    }
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
      icon: ExampleAppIconView(.iOS),
      configs: .iOS
    )
    IconPreviews(
      icon: ExampleAppIconView(.macOS),
      configs: .macOS,
      clip: false
    )
  }
}
