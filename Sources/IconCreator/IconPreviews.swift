import SwiftUI

struct IconPreviews<Icon: View>: View {
  var icon: (CGFloat) -> Icon
  var configs: [IconConfig]

  var body: some View {
    Group {
      ForEach(configs) { config in
        IconContainer(size: config.pointSize, content: icon)
          .clipShape(RoundedRectangle(cornerRadius: config.pointSize * 0.2, style: .continuous))
          .background(Color(.darkGray))
          .previewDisplayName(config.id)
      }
    }
  }
}
