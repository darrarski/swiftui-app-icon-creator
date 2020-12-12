import SwiftUI

struct IconPreviews<Icon: View>: View {
  var icon: (CGFloat) -> Icon
  var configs: [IconConfig]

  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      ForEach(configs) { config in
        IconPreview(icon: icon, config: config)
      }
    }
    .background(Color.white)
    .fixedSize()
  }
}
