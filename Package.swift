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
    ),
    .executable(
      name: "export",
      targets: [
        "Export"
      ]
    )
  ],
  targets: [
    .target(
      name: "IconCreator"
    ),
    .target(
      name: "Export",
      dependencies: [
        "IconCreator"
      ]
    )
  ]
)
