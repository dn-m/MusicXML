//
//  KeyTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class KeyTests: XCTestCase {

    func testDecodingTraditional() throws {
        let xml = """
        <key>
          <fifths>0</fifths>
          <mode>major</mode>
        </key>
        """
        let decoded = try XMLDecoder().decode(Key.self, from: xml.data(using: .utf8)!)
        let expected = Key(fifths: 0, mode: .major)
        XCTAssertEqual(decoded, expected)
    }
}
