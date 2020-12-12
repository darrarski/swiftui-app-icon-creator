import SwiftUI

struct IconPreview<Icon: View>: View {
  var icon: (CGFloat) -> Icon
  var config: IconConfig

  var body: some View {
    VStack(alignment: .leading, spacing: 16) {
      Text(config.id).font(.title2)
      HStack(alignment: .top, spacing: 16) {
        ForEach(config.scales.sorted(by: >), id: \.self) { scale in
          VStack(alignment: .center, spacing: 8) {
            Text("\(scale)x").font(.title3)
            iconView(scale: scale)
          }
        }
      }
    }
    .padding()
    .background(Color.white)
    .environment(\.colorScheme, .light)
    .fixedSize()
  }

  private func iconView(scale: Int) -> some View {
    let screenScale = NSScreen.main!.backingScaleFactor
    let size = CGFloat(config.size) * CGFloat(scale) / screenScale
    return iconView(size: size)
  }

  private func iconView(size: CGFloat) -> some View {
    icon(size)
      .frame(width: size, height: size, alignment: .center)
      .clipShape(RoundedRectangle(cornerRadius: size * 0.2, style: .continuous))
  }
}
