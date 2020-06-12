# Pipeline

Reverse function application with optional chaining support.

## Quick Look

```swift
let attributedString = fileURLString
    |> URL.init(fileURLWithPath:)
    |> { try! Data(contentsOf: $0) }
    ?> UIImage.init(data:)
    ?> NSTextAttachment.init(image:)
    ?> NSAttributedString.init(attachment:)
```

is equivalent to:

```swift
if let image = UIImage(data: try! Data(contentsOf: URL(fileURLWithPath: fileURLString))),
    let attachment = NSTextAttachment(image: image) {
    let attributedString = NSAttributedString(attachment: attachment)
    // use attributedString here
}
```

## Installation

### [Swift Package Manager](https://github.com/apple/swift-package-manager)

Add the project to your `Package.swift` file:

```swift
package.dependencies += [
    .package(url: "https://github.com/ddddxxx/Pipeline", from: "0.2.0"),
]
```

## License

Pipeline is available under the MIT license. See the [LICENSE file](LICENSE).
