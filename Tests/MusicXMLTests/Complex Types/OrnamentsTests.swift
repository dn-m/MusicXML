//
//  OrnamentsTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/12/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class OrnamentsTests: XCTestCase {

    func testWavyLine() throws {
        let xml = """
        <wavy-line number="1" type="stop"/>
        """
        let expected = WavyLine(type: .stop, number: 1)
        try assertDecoded(xml, equals: expected)
    }

    #warning("FIXME: #56 Notations.Notation.tuplet not decoding properly yet")
    func DISABLED_testWavyLineOrnament() throws {
        let xml = """
        <wavy-line number="1" type="stop"/>
        """
        let expected = Ornament.wavyLine(WavyLine(type: .stop, number: 1))
        try assertDecoded(xml, equals: expected)
    }
}
