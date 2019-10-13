//
//  LilyPondTestSuite.swift
//  MusicXMLTests
//
//  Created by James Bean on 9/28/19.
//

import XCTest
import MusicXML

class LilyPondTests: XCTestCase {

    // All of the LilyPond tests which we will _not_ test, either because they require a breaking of
    // the specification, or for some other good reason.
    private let blacklist = [
        // This test requires our model to break the spec.
        "41g-PartNoId.xml",
    ]

    func testAll() throws {
        // Create temporary directory successfully parsed scores from the LilyPond test suite
        let tempDirUrl = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent("LilyPondTestsResults")
        try FileManager.default.createDirectory(
            at: tempDirUrl,
            withIntermediateDirectories: true,
            attributes: nil
        )
        print(
            """
            Created LilyPondTest result directory at \(tempDirUrl.absoluteString).
            Parsed scores from LilyPond test suite will be written there for inspection.
            """
        )
        var successes: [String] = []
        var failures: [(name: String, error: Error)] = []
        for subdir in ["Partwise", "Timewise"] {
            try FileManager.default.createDirectory(
                at: tempDirUrl,
                withIntermediateDirectories: true,
                attributes: nil
            )
            let directory = testSuiteURL.appendingPathComponent(subdir, isDirectory: true)
            try FileManager.default
                .contentsOfDirectory(atPath: directory.path)
                .sorted()
                .filter { !blacklist.contains($0) }
                .forEach { fileName in
                    let fileURL = directory.appendingPathComponent(fileName)
                    do {
                        let parsed = try MusicXML(url: fileURL)
                        let parsedResultDirUrl = tempDirUrl.appendingPathComponent(subdir)
                        try FileManager.default.createDirectory(
                            at: parsedResultDirUrl,
                            withIntermediateDirectories: true,
                            attributes: nil
                        )
                        let parsedResultFileUrl = parsedResultDirUrl
                            .appendingPathComponent("\(fileName).parsed")
                        do {
                            try String(describing: parsed).write(
                                to: parsedResultFileUrl,
                                atomically: true,
                                encoding: String.Encoding.utf8
                            )
                        } catch {
                            print("Failed to write result for \(fileName)")
                        }
                        successes.append("\(subdir)/\(fileName)")
                    } catch {
                        failures.append((name: "\(subdir)/\(fileName)", error: error))
                    }
                }
        }
        print()
        print("# Successfully parsed \(successes.count) files:")
        successes.forEach { print("- \($0)") }
        print()
        print("# Failed to parse \(failures.count) files:")
        failures.forEach { name, error in
            print("- \(name)")
            print("  error: \(error))")
        }
    }
}

extension LilyPondTests {

    // The `URL` of the `LilyPondTestSuite` directory which contains two subdirectories:
    //
    //  - `Partwise`
    //  - `Timewise`
    //
    // Each of these subdirectories contains all of the test music xml files for a given traversal.
    var testSuiteURL: URL {
        return URL(fileURLWithPath: "\(#file)")
            .deletingLastPathComponent() // => MusicXML/Tests/MusicXMLTests/LilyPondTests
            .deletingLastPathComponent() // => MusicXML/Tests/LilyPondTests
            .deletingLastPathComponent() // => MusicXML/Tests
            .appendingPathComponent("LilyPondTestSuite", isDirectory: true)
    }
}
