//
//  MidmeasureClefTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/12/19.
//

import XCTest
import MusicXML
import XMLCoder

class MidmeasureClefTests: XCTestCase {

    func testImplicitMeasureStringNumber() throws {
        let xml = """
        <measure implicit="yes" number="X1"></measure>
        """
        let decoded = try MusicXMLDecoder().decode(Partwise.Measure.self, from: xml.data(using: .utf8)!)
        let expected = Partwise.Measure(number: "X1", implicit: true)
        XCTAssertEqual(decoded, expected)
    }
}
