# MusicXML

A **work-in-progress** implementation of the [musicXML](https://www.musicxml.com) specification in Swift.

The goal of this project is to allow Swift users to read, manipulate, and write musicXML files in a richly-typed manner on any platform supported by Swift.

## Getting Started

### Requirements

Use the [Swift Package Manager](https://swift.org/package-manager/) to include the `MusicXML` module into your project.

### Usage

If you want to use the `MusicXML` module in your own project, add the `MusicXML` package to the `dependencies` section of your `Package.swift` file:

```Swift
let package = Package(
    name: ...,
    products: [ ... ],
    dependencies: [
        ...,
        .package(url: "https://github.com/dn-m/MusicXML", from: "0.1.0")
    ],
    targets: [ ... ]
)
```

Then, import the `MusicXML` module into a file which uses it:

```Swift
import MusicXML
let musicXML = "..."
let score = MusicXML.deserialize(musicXML) //=> MusicXML.Score
```

### Development

To contribute to the `MusicXML` package, clone the `git` repository:

```
git clone https://github.com/dn-m/MusicXML && cd MusicXML
```

Build the package:

```
swift build
```

Run the tests:

```
swift test
```

If you use the Xcode IDE, use the Swift Package Manager to generate an `.xcodeproj` file:

```
swift package generate-xcodeproj
```

