//
//  BarlineTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/4/19.
//

import XCTest
import XMLCoder
import MusicXML

class BarlineTests: XCTestCase {

    func testDecodingSimple() throws {
        let xml = """
        <barline location="right">
          <bar-style>light-heavy</bar-style>
        </barline>
        """
        let decoded = try MusicXMLDecoder().decode(Barline.self, from: xml.data(using: .utf8)!)
        let expected = Barline(location: .right, barStyle: .lightHeavy)
        XCTAssertEqual(decoded, expected)
    }
}
