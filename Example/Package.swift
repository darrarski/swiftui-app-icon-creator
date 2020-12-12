// swift-tools-version:5.3

import PackageDescription

let package = Package(
  name: "example-app-icon",
  platforms: [
    .macOS(.v11)
  ],
  products: [
    .library(
      name: "ExampleAppIcon",
      targets: [
        "ExampleAppIcon"
      ]
    ),
    .executable(
      name: "export",
      targets: [
        "Export"
      ]
    )
  ],
  dependencies: [
    .package(path: "../")
  ],
  targets: [
    .target(
      name: "ExampleAppIcon",
      dependencies: [
        .product(
          name: "AppIconCreator",
          package: "swiftui-app-icon-creator"
        )
      ]
    ),
    .target(
      name: "Export",
      dependencies: [
        "ExampleAppIcon"
      ]
    )
  ]
)
