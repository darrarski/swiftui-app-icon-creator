import SwiftUI

public struct IconConfig: Equatable {
  public var name: String
  public var pointSize: CGFloat
  public var scales: [Int]

  public init(name: String, pointSize: CGFloat, scales: [Int]) {
    self.name = name
    self.pointSize = pointSize
    self.scales = scales
  }
}

extension IconConfig: Identifiable {
  public var id: String { "\(name) \(pointSizeString)" }
}

public extension IconConfig {
  var pointSizeString: String {
    "\(Self.pointSizeFormatter.string(from: NSNumber(value: Float(pointSize)))!)pt"
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
  static let iPhone_Notification = IconConfig(name: "iPhone Notification", pointSize: 20, scales: [2, 3])
  static let iPhone_Settings = IconConfig(name: "iPhone Settings", pointSize: 29, scales: [2, 3])
  static let iPhone_Spotlight = IconConfig(name: "iPhone Spotlight", pointSize: 40, scales: [2, 3])
  static let iPhone_App = IconConfig(name: "iPhone App", pointSize: 60, scales: [2, 3])
  static let iPad_Notification = IconConfig(name: "iPad Notification", pointSize: 20, scales: [1, 2])
  static let iPad_Settings = IconConfig(name: "iPad Settings", pointSize: 29, scales: [1, 2])
  static let iPad_Spotlight = IconConfig(name: "iPad Spotlight", pointSize: 40, scales: [1, 2])
  static let iPad_App = IconConfig(name: "iPad App", pointSize: 76, scales: [2, 3])
  static let iPad_Pro_12_9_App = IconConfig(name: "iPad Pro (12.9-inch) App", pointSize: 83.5, scales: [2])
  static let iOS_App_Store = IconConfig(name: "iOS App Store", pointSize: 1024, scales: [1])
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
  static let macOS_16pt = IconConfig(name: "Mac", pointSize: 16, scales: [1, 2])
  static let macOS_32pt = IconConfig(name: "Mac", pointSize: 32, scales: [1, 2])
  static let macOS_128pt = IconConfig(name: "Mac", pointSize: 128, scales: [1, 2])
  static let macOS_256pt = IconConfig(name: "Mac", pointSize: 256, scales: [1, 2])
  static let macOS_512pt = IconConfig(name: "Mac", pointSize: 512, scales: [1, 2])
}
