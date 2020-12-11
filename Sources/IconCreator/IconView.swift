import SwiftUI

struct IconView: View {
  var size: CGFloat

  var body: some View {
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
