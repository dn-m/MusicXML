//
//  AccidentalTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/4/19.
//

import XCTest
import XMLCoder
import MusicXML

class AccidentalTests: XCTestCase {

    func testDecodingSimple() throws {
        let xml = """
        <accidental>sharp</accidental>
        """
        let decoded = try XMLDecoder().decode(Accidental.self, from: xml.data(using: .utf8)!)
        let expected = Accidental.sharp
        XCTAssertEqual(decoded, expected)
    }

    func testDecodingPlacement() throws {
        let xml = """
        <accidental-mark placement="above">double-sharp</accidental-mark>
        """
        let expected = AccidentalMark(.doubleSharp, placement: .above)
        try assertDecoded(xml, equals: expected)
    }
}
