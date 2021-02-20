import SwiftUI

public struct IconConfig: Equatable {
  public var name: String
  public var size: Float
  public var scales: [Int]

  public init(name: String, size: Float, scales: [Int]) {
    self.name = name
    self.size = size
    self.scales = scales
  }
}

extension IconConfig: Identifiable {
  public var id: String { "\(name) \(sizeString)" }
}

extension IconConfig {
  var sizeString: String {
    "\(Self.pointSizeFormatter.string(from: NSNumber(value: size))!)pt"
  }

  private static let pointSizeFormatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.decimalSeparator = "."
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 1
    return formatter
  }()
}

public extension Sequence where Element == IconConfig {
  static var iOS: [Element] {[
    .iPhone_Notification,
    .iPhone_Settings,
    .iPhone_Spotlight,
    .iPhone_App,
    .iPad_Notification,
    .iPad_Settings,
    .iPad_Spotlight,
    .iPad_App,
    .iPad_Pro_12_9_App,
    .iOS_App_Store
  ]}
}

public extension IconConfig {
  static let iPhone_Notification = IconConfig(name: "iPhone Notification", size: 20, scales: [2, 3])
  static let iPhone_Settings = IconConfig(name: "iPhone Settings", size: 29, scales: [2, 3])
  static let iPhone_Spotlight = IconConfig(name: "iPhone Spotlight", size: 40, scales: [2, 3])
  static let iPhone_App = IconConfig(name: "iPhone App", size: 60, scales: [2, 3])
  static let iPad_Notification = IconConfig(name: "iPad Notification", size: 20, scales: [1, 2])
  static let iPad_Settings = IconConfig(name: "iPad Settings", size: 29, scales: [1, 2])
  static let iPad_Spotlight = IconConfig(name: "iPad Spotlight", size: 40, scales: [1, 2])
  static let iPad_App = IconConfig(name: "iPad App", size: 76, scales: [1, 2])
  static let iPad_Pro_12_9_App = IconConfig(name: "iPad Pro (12.9-inch) App", size: 83.5, scales: [2])
  static let iOS_App_Store = IconConfig(name: "iOS App Store", size: 1024, scales: [1])
}

public extension Sequence where Element == IconConfig {
  static var macOS: [IconConfig] {[
    .macOS_16pt,
    .macOS_32pt,
    .macOS_128pt,
    .macOS_256pt,
    .macOS_512pt
  ]}
}

public extension IconConfig {
  static let macOS_16pt = IconConfig(name: "Mac", size: 16, scales: [1, 2])
  static let macOS_32pt = IconConfig(name: "Mac", size: 32, scales: [1, 2])
  static let macOS_128pt = IconConfig(name: "Mac", size: 128, scales: [1, 2])
  static let macOS_256pt = IconConfig(name: "Mac", size: 256, scales: [1, 2])
  static let macOS_512pt = IconConfig(name: "Mac", size: 512, scales: [1, 2])
}
