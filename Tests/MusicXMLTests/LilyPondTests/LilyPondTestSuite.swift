//
//  LilyPondTestSuite.swift
//  MusicXMLTests
//
//  Created by James Bean on 9/28/19.
//

import Foundation

enum LilyPondTestSuite {
    enum Traversal: String {
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
