# Chaining Function

[![Build Status](https://travis-ci.org/ddddxxx/ChainingFunction.svg?branch=master)](https://travis-ci.org/ddddxxx/ChainingFunction)
![supports](https://img.shields.io/badge/supports-Carthage%20%7C%20Swift_PM-brightgreen.svg)
![swift](https://img.shields.io/badge/swift-4.0-orange.svg)

Syntactic sugar for Swift optional chaining. Allows you to add a non-optional funcion invocation into a optional chaining.

## Why?

> Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil.
> 
> -- The Swift Programming Language

Swift optional chaining is an elegant way to work with methods that successively return optional values, instead of unwrapping them at each stage. However, it isn't able to pass optional values as parameters into functions that do not take optional types.

Introducing binary operator `?>`, which tests the left-hand operand for `nil`, and passes the unwrapped value to the right-hand operand (a function taking non-optional values). The `?` indicates optional chaining, and the `>` means passing left-hand operand to right.

It's super useful when you want to `(pass?.aLongOptionalChaining()?.to ?< aFunctionTakingNonOptionalValues(:))?.ThenDoSomethingElse()`.

## Quick Look

```
let result = (data, String.Encoding.utf8) ?> String.init(data:encoding:) ?> Double.init ?> Int.init(exactly:)
```

is equivalent to:

```
let result = data.flatMap({String(data: $0, encoding: .utf8)}).flatMap({Double($0)}).flatMap({Int(exactly: $0)})
```

or more redundant:

```
let result: Int?
if let data = data,
    let str = String.init(data: data, encoding: .utf8),
    let double = Double(str),
    let int = Int.init(exactly: double) {
    result = int
} else {
    result = nil
}
```

## Installation

### [Carthage](https://github.com/Carthage/Carthage)

Add the project to your `Cartfile`:

```
github "ddddxxx/ChainingFunction"
```

### [Swift Package Manager](https://github.com/apple/swift-package-manager)

Add the project to your `Package.swift` file:

```swift
let package = Package(
    dependencies: [
        .Package(url: "https://github.com/ddddxxx/ChainingFunction")
    ]
)
```

## License

ChainingFunction is available under the MIT license. See the [LICENSE file](LICENSE).
