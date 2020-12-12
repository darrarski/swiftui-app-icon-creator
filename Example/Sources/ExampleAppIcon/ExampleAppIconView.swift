import SwiftUI
import AppIconCreator

public struct ExampleAppIconView: View, Equatable {
  public init() {}

  public var body: some View {
    HStack(spacing: 0) {
      Color.red
      Color.green
      Color.blue
    }
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
