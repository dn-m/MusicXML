//
//  MidmeasureClefTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/12/19.
//

import MusicXML
import XCTest
import XMLCoder

class MidmeasureClefTests: XCTestCase {
    func testImplicitMeasureStringNumber() throws {
        let xml = """
        <measure implicit="yes" number="X1"></measure>
        """
        let decoded = try XMLDecoder().decode(Partwise.Measure.self, from: xml.data(using: .utf8)!)
        let expected = Partwise.Measure(number: "X1", implicit: true)
        XCTAssertEqual(decoded, expected)
    }
}
