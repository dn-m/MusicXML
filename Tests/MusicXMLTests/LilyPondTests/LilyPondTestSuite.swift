//
//  LilyPondTestSuite.swift
//  MusicXMLTests
//
//  Created by James Bean on 9/28/19.
//

import MusicXML
import XCTest

class LilyPondTests: XCTestCase {
    func testAll() throws {
        let rootDir = try! prepareResultsDirectory()
        publishResultsDirectoryLocation(rootDir)
        for traversal in ["Partwise", "Timewise"] {
            let resultsDir = try prepareResultsDirectoryForTraversal(traversal, in: rootDir)
            let sourceDir = testSuiteURL.appendingPathComponent(traversal, isDirectory: true)
            let sources = try FileManager.default.contentsOfDirectory(atPath: sourceDir.path)
            let sanitizedSources = sources.lazy
                .filter { $0.hasSuffix("xml") }
                .filter { !blacklist.contains($0) }
                .sorted()
            try sanitizedSources.forEach { source in
                let sourceURL = sourceDir.appendingPathComponent(source)
                do {
                    let start = now()
                    let parsed = try Score(url: sourceURL)
                    let duration = now() - start

                    publishSuccessfulParsing(for: "\(traversal)/\(source)", in: duration)
                    let resultFileURL = resultsDir.appendingPathComponent("\(source).parsed")
                    try! String(describing: parsed).write(
                        to: resultFileURL,
                        atomically: true,
                        encoding: .utf8
                    )
                } catch {
                    publishFailedParsing(for: "\(traversal)/\(source)")
                    throw error
                }
            }
        }
    }

    /// Creates a directory for storing successfully parsed MusicXML files for a given traversal
    /// (either "Partwise" or "Timewise").
    func prepareResultsDirectoryForTraversal(_ traversal: String, in directory: URL) throws -> URL {
        let url = directory.appendingPathComponent(traversal)
        try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
        return url
    }

    /// Creates a temporary directory for storing successfully parsed MusicXML files.
    ///
    /// - Returns: The `URL` of the created directory.
    func prepareResultsDirectory() throws -> URL {
        let url = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent("LilyPondTestsResults")
        try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true)
        return url
    }

    func publishFailedParsing(for fileName: String) {
        print("❌ \(fileName)")
    }

    func publishSuccessfulParsing(for fileName: String, in secondsElapsed: Double) {
        print("✅ \(secondsElapsed.formatted(decimalPlaces: 3))s \(fileName)")
    }

    func publishResultsDirectoryLocation(_ url: URL) {
        print(
            """
            Created LilyPondTest result directory at:

                \(url.absoluteString)

            Parsed scores from LilyPond test suite will be written there for inspection.
            """
        )
    }
}

// All of the LilyPond tests which we will _not_ test, either because they require a breaking of
// the specification, or for some other good reason.
private let blacklist = [
    // This test requires our model to break the spec.
    "41g-PartNoId.xml",
    // I don't think this is our job (at least at this point in time)
    "90a-Compressed-MusicXML.mxl",
]

// The `URL` of the `LilyPondTestSuite` directory which contains two subdirectories:
//
//  - `Partwise`
//  - `Timewise`
//
// Each of these subdirectories contains all of the test music xml files for a given traversal.
private var testSuiteURL: URL {
    return URL(fileURLWithPath: "\(#file)")
        .deletingLastPathComponent() // => MusicXML/Tests/MusicXMLTests/LilyPondTests
        .deletingLastPathComponent() // => MusicXML/Tests/MusicXMLTests
        .deletingLastPathComponent() // => MusicXML/Tests
        .appendingPathComponent("LilyPondTestSuite", isDirectory: true)
}

// MARK: - Benchmarking

private func now() -> Double {
    return Double(DispatchTime.now().uptimeNanoseconds) / 1_000_000_000
}

private extension Double {
    func formatted(decimalPlaces: Int) -> String {
        return String(format: "%.\(decimalPlaces)f", self)
    }
}
