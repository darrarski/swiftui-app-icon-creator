# SwiftUI App Icon Creator

![Swift 5](https://img.shields.io/badge/swift-5-orange.svg)
![platform macOS 11](https://img.shields.io/badge/platform-macOS%2011-blue.svg)

Create iOS and macOS application icon with SwiftUI

## 📝 How to

1. Create new Swift Package with following products:
    - Library that will contain your app icon source code
    - Executable that you will use to export icon to images
2. Add this package as a dependency
3. Create icon view in the library taget, using SwiftUI
4. Use `IconPreviews` to live-preview your icon in Xcode
5. Add exporting code to `main.swift` in the executable target
6. Run the executable from Xcode via command line to export your icon to images

## ☕️ Do you like the project?

<a href="https://www.buymeacoffee.com/darrarski" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

## 📄 License

Copyright © 2020 Dariusz Rybicki Darrarski

License: [MIT](LICENSE)
