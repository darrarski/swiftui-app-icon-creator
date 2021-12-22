#if os(macOS)
import SwiftUI

public struct IconPreview<Icon: View>: View {
  public var icon: Icon
  public var config: IconConfig
  public var clip: Bool

  public init(icon: Icon, config: IconConfig, clip: Bool = true) {
    self.icon = icon
    self.config = config
    self.clip = clip
  }

  public var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text(config.id).font(.title2)
      HStack(alignment: .top, spacing: 16) {
        ForEach(config.scales.sorted(by: >), id: \.self) { scale in
          VStack(alignment: .center, spacing: 8) {
            Text("\(scale)x").font(.title3)
            iconView(size: config.size, scale: scale)
          }
        }
      }
    }
    .padding()
    .fixedSize()
  }

  private func iconView(size: Float, scale: Int) -> some View {
    let screenScale = NSScreen.main!.backingScaleFactor
    let viewSize = CGFloat(config.size) * CGFloat(scale) / screenScale
    return icon
      .environment(\.colorScheme, .light)
      .frame(width: viewSize, height: viewSize, alignment: .center)
      .if(clip) {
        $0.clipShape(RoundedRectangle(
          cornerRadius: viewSize * 0.2,
          style: .continuous
        ))
      }
  }
}
#endif
