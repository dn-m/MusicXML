//
//  ScoreTestSuite.swift
//  MusicXMLTests
//
//  Created by Ben Lu on 10/14/19.
//

import XCTest
import MusicXML
import Yams

class ScoreTests: XCTestCase {

    func testAll() throws {
        let paths = try FileManager.default.contentsOfDirectory(atPath: testSuiteURL.path)
        for path in paths {
            let testCaseURL = testSuiteURL.appendingPathComponent(path)
            guard directoryExists(at: testSuiteURL.path) else {
                continue
            }
            let manifestURL = testSuiteURL
                .appendingPathComponent(path)
                .appendingPathComponent("manifest.yaml")
            guard let manifestData = FileManager.default.contents(atPath: manifestURL.path),
                let manifestString = String(data: manifestData, encoding: .utf8) else {
                continue
            }
            let manifest = try YAMLDecoder().decode(ScoreTestCaseManifest.self, from: manifestString)
            try runTest(forManifest: manifest, testCaseURL: testCaseURL)
        }
    }

    private func runTest(forManifest manifest: ScoreTestCaseManifest, testCaseURL: URL) throws {
        let musicXMLURL = testCaseURL.appendingPathComponent(manifest.parsing.xmlFileName)

        print("🎼 Test score: \(manifest.metadata.displayName)")
        print("  Path: \(musicXMLURL.path)")
        if let description = manifest.metadata.description {
            print("  Description: \(description)")
        }
        if let source = manifest.metadata.source {
            print("  Source: \(source)")
        }

        do {
            let parsed = try Score(url: musicXMLURL)
            print("  ✅ Parsing succeeded")

            guard let comparison = manifest.comparison,
                let expectationClazz = expectationClass(forManifest: manifest) else {
                return
            }

            let expected = expectationClazz.expected

            // TODO: Generate diff

            if comparison.assert {
                XCTAssertEqual(parsed, expected, "Parsed \(manifest.metadata.displayName) is not equal to expected")
            }
            if parsed == expected {
                print("  ✅ Compared equal to expectation")
            } else {
                print("  ❌ Not equal to expectation")
            }
        } catch {
            print("  ❌ Parsing failed: \(error)")

            if manifest.parsing.assert {
                throw error
            }

            if let _ = expectationClass(forManifest: manifest) {
                print("  ⚠️ Skipped comparison test because score failed to parse")
            }
        }
    }

    private func expectationClass(forManifest manifest: ScoreTestCaseManifest) -> ScoreTestExpectation.Type? {
        guard let comparisonTestSpecs = manifest.comparison, let clazz = Bundle(for: Self.self).classNamed("MusicXMLTests.\(comparisonTestSpecs.expectationClassName)"), let expectationClazz = clazz as? ScoreTestExpectation.Type else {
            print("  - ❓ Expectation class not found. Make sure to specify SwiftClassName in the manifest and make the class conform to ScoreTestExpectation.")
            return nil
        }
        return expectationClazz
    }
}

private var testSuiteURL: URL {
    return URL(fileURLWithPath: "\(#file)")
        .deletingLastPathComponent() // => MusicXML/Tests/MusicXMLTests/ScoreTests
}

private func directoryExists(at path: String) -> Bool {
    var isDirectory = ObjCBool(true)
    let exists = FileManager.default.fileExists(atPath: path, isDirectory: &isDirectory)
    return exists && isDirectory.boolValue
}
