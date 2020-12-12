// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "swiftui-app-icon-creator",
  platforms: [
    .macOS(.v11)
  ],
  products: [
    .library(
      name: "IconCreator",
      targets: [
        "IconCreator"
      ]
    )
  ],
  targets: [
    .target(
      name: "IconCreator"
    )
  ]
)
