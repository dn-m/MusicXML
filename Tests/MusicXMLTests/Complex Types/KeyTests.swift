//
//  KeyTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import XCTest
import XMLCoder
import MusicXML

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

    func testDecodingNonTraditional() throws {
        let xml = """
        <key>
          <key-step>C</key-step>
          <key-alter>-2</key-alter>
          <key-step>G</key-step>
          <key-alter>2</key-alter>
          <key-step>D</key-step>
          <key-alter>-1</key-alter>
          <key-step>B</key-step>
          <key-alter>1</key-alter>
          <key-step>F</key-step>
          <key-alter>0</key-alter>
          <key-octave number="1">2</key-octave>
          <key-octave number="2">3</key-octave>
          <key-octave number="3">4</key-octave>
          <key-octave number="4">5</key-octave>
          <key-octave number="5">6</key-octave>
        </key>
        """
        let decoded = try XMLDecoder().decode(Key.self, from: xml.data(using: .utf8)!)
    }
}
