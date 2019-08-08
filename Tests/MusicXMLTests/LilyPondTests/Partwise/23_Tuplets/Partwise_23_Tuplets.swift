//
//  Partwise_23_Tuplets.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import XCTest
import MusicXML

class Partwise_23_Tuplets: XCTestCase {

    #warning("FIXME: #56 Notations.Notation.tuplet not decoding properly yet")
    func DISABLED_test_23_Tuplets_E_Tremolo() throws {
        let _ = try MusicXML(string: E_Tremolo)
    }

    func test_23_Tuplets() throws {
        let _ = try MusicXML(string: A)
        let _ = try MusicXML(string: B_Styles)
        let _ = try MusicXML(string: C_DisplayNotStandard)
        let _ = try MusicXML(string: D_Nested)
        let _ = try MusicXML(string: F_DurationButNoBracket)
    }
}
