//
//  SimpleRepeatTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/12/19.
//

import XCTest
import XMLCoder
import MusicXML

class SimpleRepeatTests: XCTestCase {

    func testBarlineRepeatBackward() throws {
        let xml = """
        <barline location="right">
          <bar-style>light-heavy</bar-style>
          <repeat direction="backward" times="5"/>
        </barline>
        """
        let decoded = try MusicXMLDecoder().decode(Barline.self, from: xml)
        let expected = Barline(
            location: .right,
            barStyle: .lightHeavy,
            repeat: Repeat(direction: .backward, times: 5)
        )
        XCTAssertEqual(decoded, expected)
    }
}
