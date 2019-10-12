//
//  PartNameLineBreakTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/12/19.
//

import XCTest
import XMLCoder
import MusicXML

class PartNameLineBreakTests: XCTestCase {

    func testMeasurePrintNewSystem() throws {
        let xml = """
        <measure number="6">
          <print new-system="yes"/>
        </measure>
        """
        let decoded = try XMLDecoder().decode(Partwise.Measure.self, from: xml.data(using: .utf8)!)
        let expected = Partwise.Measure(
            number: 6,
            musicData: [.print(Print(newSystem: true))]
        )
        XCTAssertEqual(decoded, expected)
    }
}
