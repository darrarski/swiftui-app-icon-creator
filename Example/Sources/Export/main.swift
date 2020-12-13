import AppIconCreator
import ExampleAppIcon
import struct Foundation.URL

let icon = ExampleAppIconView()
let configs = [IconConfig].iOS
let images = [IconImage].images(for: icon, with: configs)
let directoryURL = URL(fileURLWithPath: "/Users/darrarski/Dev/swiftui-app-icon-creator/")
images.forEach { $0.save(to: exportURL) }
