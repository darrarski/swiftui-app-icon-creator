import SwiftUI

public struct IconView: View, Equatable {
  public init() {}

  public var body: some View {
    HStack(spacing: 0) {
      Color.red
      Color.green
      Color.blue
    }
  }
}

struct IconView_Preivews: PreviewProvider {
  static var previews: some View {
    #if os(macOS)
    IconPreviews(
      icon: IconView(),
      configs: .iOS
    )
    #endif
  }
}
