#if os(macOS)
import SwiftUI

public struct IconImage {
  public var name: String
  public var image: NSImage
}

public extension Sequence where Element == IconImage {
  static func images<Icon: View>(
    for icon: Icon,
    with configs: [IconConfig]
  ) -> [Element] {
    configs.flatMap { config in
      images(for: icon, with: config)
    }
  }

  static func images<Icon: View>(
    for icon: Icon,
    with config: IconConfig
  ) -> [Element] {
    config.scales.map { scale in
      IconImage(
        name: "\(config.id) \(scale)x",
        image: NSView.icon(icon, size: config.size * Float(scale))
          .toImage()
          .unscaled()
      )
    }
  }
}

public extension IconImage {
  func save(to directoryUrl: URL) {
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: directoryUrl.path) == false {
      try! fileManager.createDirectory(at: directoryUrl, withIntermediateDirectories: true)
    }
    let data = image.pngData()
    let url = directoryUrl
      .appendingPathComponent(name)
      .appendingPathExtension("png")
    try! data.write(to: url)
  }
}

extension NSView {
  static func icon<Icon: View>(_ icon: Icon, size: Float) -> NSView {
    let view = NSHostingView(rootView: icon)
    let viewSize = CGFloat(size)
    view.frame = NSRect(
      origin: .zero,
      size: NSSize(width: viewSize, height: viewSize)
    )
    return view
  }

  func toImage() -> NSImage {
    let cacheRep = bitmapImageRepForCachingDisplay(in: bounds)!
    cacheDisplay(in: bounds, to: cacheRep)
    let image = NSImage(size: bounds.size)
    image.addRepresentation(cacheRep)
    return image
  }
}

extension NSImage {
  func unscaled() -> NSImage {
    let image = NSImage(size: size)
    image.addRepresentation(unscaledBitmapImageRep())
    return image
  }

  func unscaledBitmapImageRep() -> NSBitmapImageRep {
    let imageRep = NSBitmapImageRep(
      bitmapDataPlanes: nil,
      pixelsWide: Int(size.width),
      pixelsHigh: Int(size.height),
      bitsPerSample: 8,
      samplesPerPixel: 4,
      hasAlpha: true,
      isPlanar: false,
      colorSpaceName: .deviceRGB,
      bytesPerRow: 0,
      bitsPerPixel: 0
    )!
    imageRep.size = size
    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = NSGraphicsContext(bitmapImageRep: imageRep)
    draw(at: .zero, from: .zero, operation: .sourceOver, fraction: 1)
    NSGraphicsContext.restoreGraphicsState()
    return imageRep
  }

  func pngData() -> Data {
    let tiffData = tiffRepresentation!
    let imageRep = NSBitmapImageRep(data: tiffData)!
    return imageRep.representation(using: .png, properties: [.compressionFactor: 1])!
  }
}
#endif
