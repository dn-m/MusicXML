//
//  NoteDecoderTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/17/18.
//

import XCTest
import XMLCoder
@testable import MusicXML

class NoteDecoderTests: XCTestCase {

    func testPitch() {
        let xml = """
        <pitch>
          <step>C</step>
          <octave>4</octave>
        </pitch>
        """
        let expected = Pitch(step: .c, alter: nil, octave: 4)
        let pitch = try! XMLDecoder().decode(Pitch.self, from: xml.data(using: .utf8)!)
        XCTAssertEqual(pitch, expected)
    }

    func testNoteThin() {
        let xml = """
        <note>
            <pitch>
                <step>C</step>
                <octave>4</octave>
            </pitch>
            <duration>4</duration>
            <type>whole</type>
        </note>
        """
        let expected = Note(
            pitch: Pitch(step: .c, alter: nil, octave: 4),
            duration: 4,
            durationType: .init(kind: .whole, size: nil),
            accidental: nil
        )
        let note = try! XMLDecoder().decode(Note.self, from: xml.data(using: .utf8)!)
        XCTAssertEqual(note, expected)
    }

    func testNoteFull() {
        let xml = """
        <note default-x="83">
            <pitch>
                <step>A</step>
                <alter>1</alter>
                <octave>4</octave>
            </pitch>
            <duration>2</duration>
            <voice>1</voice>
            <type>quarter</type>
            <accidental>sharp</accidental>
            <stem default-y="10.5">up</stem>
        </note>
        """
        let expected = Note(
            pitch: Pitch(step: .a, alter: 1, octave: 4),
            duration: 2,
            durationType: .init(kind: .quarter, size: nil),
            accidental: Accidental(.sharp)
        )
        let note = try! XMLDecoder().decode(Note.self, from: xml.data(using: .utf8)!)
        XCTAssertEqual(expected, note)
    }

    func testAccidental() {
        let xml = """
        <accidental>sharp</accidental>
        """
        let expected = Accidental(.sharp)
        let accidental = try! XMLDecoder().decode(Accidental.self, from: xml.data(using: .utf8)!)
        XCTAssertEqual(accidental, expected)
    }

    func testAccidentalParenthetical() {
        let xml = """
        <accidental parentheses="yes">natural</accidental>
        """
        let expected = Accidental(.natural, parentheses: true)
        let accidental = try! XMLDecoder().decode(Accidental.self, from: xml.data(using: .utf8)!)
        XCTAssertEqual(accidental, expected)
    }
}
