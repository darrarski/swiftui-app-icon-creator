// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "swiftui-app-icon-creator",
  platforms: [
    .macOS(.v11),
    .iOS(.v13),
  ],
  products: [
    .library(
      name: "AppIconCreator",
      targets: [
        "AppIconCreator"
      ]
    )
  ],
  targets: [
    .target(
      name: "AppIconCreator"
    )
  ]
)
