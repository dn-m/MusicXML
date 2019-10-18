//
//  RestTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import XCTest
import XMLCoder
import MusicXML

class RestTests: XCTestCase {

    func testEmpty() throws {
        let xml = """
        <container>
            <rest/>
        </container>
        """
        let decoded = try MusicXMLDecoder().decode(Rest.self, from: xml)
        let expected = Rest(/*displayStep: nil, displayOctave: nil, measure: nil*/)
        XCTAssertEqual(decoded, expected)
    }
}
