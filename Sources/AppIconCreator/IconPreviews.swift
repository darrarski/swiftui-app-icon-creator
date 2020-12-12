import SwiftUI

public struct IconPreviews<Icon: View>: View {
  public var icon: Icon
  public var configs: [IconConfig]

  public init(icon: Icon, configs: [IconConfig]) {
    self.icon = icon
    self.configs = configs
  }

  public var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      ForEach(configs) { config in
        IconPreview(icon: icon, config: config)
      }
    }
    .background(Color.white)
    .fixedSize()
  }
}
