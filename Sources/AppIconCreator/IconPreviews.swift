#if os(macOS)
import SwiftUI

public struct IconPreviews<Icon: View>: View {
  public var icon: Icon
  public var configs: [IconConfig]
  public var clip: Bool

  public init(icon: Icon, configs: [IconConfig], clip: Bool = true) {
    self.icon = icon
    self.configs = configs
    self.clip = clip
  }

  public var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      ForEach(configs) { config in
        IconPreview(icon: icon, config: config, clip: clip)
      }
    }
    .fixedSize()
  }
}
#endif
