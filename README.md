# MusicXML

![Swift Version](https://img.shields.io/badge/Swift-5.1-orange.svg)
![Platforms](https://img.shields.io/badge/platform-linux%20%7C%20macOS%20%7C%20iOS%20%7C%20watchOS%20%7C%20tvOS-lightgrey)
[![Build Status](https://travis-ci.org/dn-m/MusicXML.svg?branch=latest)](https://travis-ci.org/dn-m/MusicXML)
[![Code Coverage](https://codecov.io/gh/dn-m/MusicXML/branch/latest/graph/badge.svg)](https://codecov.io/github/dn-m/MusicXML)

A **work-in-progress** implementation of the [musicXML](https://www.musicxml.com) specification in Swift.

The goal of this project is to allow Swift users to read, manipulate, and write musicXML files in a richly-typed manner on any platform supported by Swift.

## Roadmap

The upcoming pre-release versions will be focused on completing different tasks.

### 0.3.0

Pre-release version **0.3.0** will be defined by completing the implementation of the **encoding** of **abstract musical content**. The LilyPond Test Suite tests will be transformed into round-trip tests to ensure that the plumbing is clean.

### 0.4.0

Pre-release version **0.4.0** will be defined by implementing decoding and encoding for attributes defined in attribute groups, which are generally used for graphical information. A standardized way of handling attributes (and attribute groups), elements, values will be chosen and implemented.

### 0.5.0

Pre-release version **0.5.0** will be defined by refining the public interfaces exposed by the `MusicXML` package. Up until this point, pubic initializers may be somewhat clumsy or completely non-existent.

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
```

You can decode a `MusicXML` structure in a variety of ways:

```Swift
let fromData: MusicXML = try MusicXML(data: data)
let fromString: MusicXML = try MusicXML(string: string)
let fromURL: MusicXML = try MusicXML(url: url)
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

## More Resources

See the [MusicXML XSD Schema Reference](http://usermanuals.musicxml.com/MusicXML/MusicXML.htm#MusicXMLReference.htm%3FTocPath%3DMusicXML%2520Reference%7C_____0) for more information about how musicXML is structured.
