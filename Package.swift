// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MusicXML",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "MusicXML",
            targets: ["MusicXML"]),
    ],
    dependencies: [
        .package(url: "https://github.com/bwetherfield/XMLCoder", .branch("fix-nested-choice-array"))
    ],
    targets: [
        .target(
            name: "MusicXML",
            dependencies: ["XMLCoder"]),
        .testTarget(
            name: "MusicXMLTests",
            dependencies: ["MusicXML"]),
    ]
)
