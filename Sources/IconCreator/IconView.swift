import SwiftUI

public struct IconView: View, Equatable {
  public var size: CGFloat

  public init(size: CGFloat) {
    self.size = size
  }

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
    IconPreviews(
      icon: IconView.init(size:),
      configs: .iOS
    )
  }
}
