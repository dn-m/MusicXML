// swift-tools-version:4.2
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
        .package(url: "https://github.com/drmohundro/SWXMLHash", from: "4.7.5"),
        .package(url: "https://github.com/MaxDesiatov/XMLCoder", from: "0.2.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "MusicXML",
            dependencies: ["SWXMLHash", "XMLCoder"]),
        .testTarget(
            name: "MusicXMLTests",
            dependencies: ["MusicXML"]),
    ]
)
