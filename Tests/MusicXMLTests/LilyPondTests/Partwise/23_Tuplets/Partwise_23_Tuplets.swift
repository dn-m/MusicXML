//
//  Partwise_23_Tuplets.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import XCTest
import MusicXML

class Partwise_23_Tuplets: XCTestCase {

    func DISABLE_test_Quarantine() throws {
        let _ = try MusicXML(string: E_Tremolo)
    }

    func test_23_Tuplets() throws {
        let _ = try MusicXML(string: A)
        let _ = try MusicXML(string: B_Styles)
        let _ = try MusicXML(string: C_DisplayNonStandard)
        let _ = try MusicXML(string: D_Nested)
        let _ = try MusicXML(string: F_DurationButNoBracket)
    }
}
