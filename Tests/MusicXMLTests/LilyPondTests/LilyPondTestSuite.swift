//
//  LilyPondTestSuite.swift
//  MusicXMLTests
//
//  Created by James Bean on 9/28/19.
//

import Foundation
import MusicXML

enum LilyPondTestSuite {
    enum Traversal: String, CaseIterable {
        case partwise = "Partwise"
        case timewise = "Timewise"
    }
    static func url(testName: String, traversal: Traversal) -> URL {
        return URL(fileURLWithPath: "\(#file)")
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .deletingLastPathComponent()
            .appendingPathComponent("LilyPondTestSuite", isDirectory: true)
            .appendingPathComponent(traversal.rawValue, isDirectory: true)
            .appendingPathComponent("\(testName).xml")
    }
    static func string(testName: String, traversal: Traversal) throws -> String {
        return try String(contentsOf: url(testName: testName, traversal: traversal))
    }
}

extension MusicXML {

    /// Create a `MusicXML` structure with the given `testFileName` and the given `traversal`.
    ///
    /// This grabs the `.xml` file from the `Tests/LilyPondTestSuite` directory.
    init(testFileName: Swift.String, traversal: LilyPondTestSuite.Traversal) throws {
        try self.init(string: LilyPondTestSuite.string(testName: testFileName, traversal: traversal))
    }
}
