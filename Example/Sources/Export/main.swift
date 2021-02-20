import AppIconCreator
import ExampleAppIcon
import Foundation

let exportURL = FileManager.default
  .homeDirectoryForCurrentUser
  .appendingPathComponent("Desktop")
  .appendingPathComponent("ExampleAppIcon")

[IconImage]
  .images(for: ExampleAppIconView(.iOS), with: .iOS)
  .forEach { $0.save(to: exportURL) }

[IconImage]
  .images(for: ExampleAppIconView(.macOS), with: .macOS)
  .forEach { $0.save(to: exportURL) }
