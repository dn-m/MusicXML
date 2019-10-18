//
//  RepeatWithAlternativesTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/12/19.
//

import XCTest
import XMLCoder
import MusicXML

class RepeatWithAlternativesTests: XCTestCase {

    func testBarlineDiscontinue() throws {
        let xml = """
        <barline location="right">
          <ending number="2" type="discontinue"/>
        </barline>
        """
        let decoded = try MusicXMLDecoder().decode(Barline.self, from: xml.data(using: .utf8)!)
        let expected = Barline(
            location: .right,
            ending: Ending(number: "2", type: StartStopDiscontinue.discontinue)
        )
        XCTAssertEqual(decoded, expected)
    }
}
