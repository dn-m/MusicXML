//
//  RestTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import MusicXML
import XCTest
import XMLCoder

class RestTests: XCTestCase {
    func testEmpty() throws {
        let xml = """
        <container>
            <rest/>
        </container>
        """
        let decoded = try XMLDecoder().decode(Rest.self, from: xml.data(using: .utf8)!)
        let expected = Rest( /* displayStep: nil, displayOctave: nil, measure: nil */ )
        XCTAssertEqual(decoded, expected)
    }
}
