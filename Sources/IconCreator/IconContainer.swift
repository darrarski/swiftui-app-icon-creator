import SwiftUI

struct IconContainer<Content: View>: View {
  var size: CGFloat
  var content: Content

  init(
    size: CGFloat,
    @ViewBuilder content: @escaping (CGFloat) -> Content
  ) {
    self.size = size
    self.content = content(size)
  }

  var body: some View {
    content
      .frame(width: size, height: size, alignment: .center)
      .environment(\.colorScheme, .light)
      .background(Color.white)
  }
}
