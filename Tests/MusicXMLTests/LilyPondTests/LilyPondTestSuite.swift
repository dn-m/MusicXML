//
//  LilyPondTestSuite.swift
//  MusicXMLTests
//
//  Created by James Bean on 9/28/19.
//

import XCTest
import MusicXML

class LilyPondTests: XCTestCase {

    func testAll() throws {
        var successes: [String] = []
        var failures: [(name: String, error: Error)] = []
        for subdir in ["Partwise", "Timewise"] {
            let directory = testSuiteURL.appendingPathComponent(subdir, isDirectory: true)
            for fileName in try FileManager.default.contentsOfDirectory(atPath: directory.path) {
                let fileURL = directory.appendingPathComponent(fileName)
                do {
                    let _ = try MusicXML(url: fileURL)
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
