import AppIconCreator
import ExampleAppIcon
import Foundation

let icon = ExampleAppIconView()
let configs = [IconConfig].iOS
let images = [IconImage].images(for: icon, with: configs)
let exportURL = FileManager.default
  .homeDirectoryForCurrentUser
  .appendingPathComponent("Desktop")
  .appendingPathComponent("ExampleAppIcon")
images.forEach { $0.save(to: exportURL) }
