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

    func testDecodingKeyOctave() throws {
        let xml = """
        <key-octave number="1">2</key-octave>
        """
        let decoded = try XMLDecoder().decode(KeyOctave.self, from: xml.data(using: .utf8)!)
        let expected = KeyOctave(2, number: 1)
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
        let expected = Key(
            kind: .nonTraditional([
                Key.AlteredTone(step: .c, alter: -2),
                Key.AlteredTone(step: .g, alter: 2),
                Key.AlteredTone(step: .d, alter: -1),
                Key.AlteredTone(step: .b, alter: 1),
                Key.AlteredTone(step: .f, alter: 0),
            ]),
            keyOctaves: [
                KeyOctave(2, number: 1),
                KeyOctave(3, number: 2),
                KeyOctave(4, number: 3),
                KeyOctave(5, number: 4),
                KeyOctave(6, number: 5),
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDeocdingNonTraditionalWithAccidental() throws {
        let xml = """
        <key>
          <key-step>B</key-step>
          <key-alter>-1</key-alter>
          <key-accidental>quarter-flat</key-accidental>
          <key-step>E</key-step>
          <key-alter>-2</key-alter>
          <key-accidental>slash-flat</key-accidental>
          <key-step>A</key-step>
          <key-alter>-2</key-alter>
          <key-accidental>slash-flat</key-accidental>
          <key-step>F</key-step>
          <key-alter>2</key-alter>
          <key-accidental>sharp</key-accidental>
        </key>
        """
        let decoded = try XMLDecoder().decode(Key.self, from: xml.data(using: .utf8)!)
        let expected = Key(
            kind: .nonTraditional([
                Key.AlteredTone(step: .b, alter: -1, accidental: .quarterFlat),
                Key.AlteredTone(step: .e, alter: -2, accidental: .slashFlat),
                Key.AlteredTone(step: .a, alter: -2, accidental: .slashFlat),
                Key.AlteredTone(step: .f, alter: 2, accidental: .sharp),
            ]),
            keyOctaves: []
        )
        XCTAssertEqual(decoded, expected)
    }
}
