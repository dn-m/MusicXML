//
//  NoteTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 7/31/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class NoteTests: XCTestCase {

    func testNoteDecoding() throws {
        let xml = """
        <note>
            <pitch>
                <step>C</step>
                <alter>-1.5</alter>
                <octave>4</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>quarter</type>
        </note>
        """
        let decoded = try XMLDecoder().decode(Note.self, from: xml.data(using: .utf8)!)
        let expected = Note(
            voice: "1",
            type: NoteType(value: .quarter, size: nil),
            pitch: Pitch(step: .c, alter: -1.5, octave: 4),
            duration: 1
        )
        XCTAssertEqual(decoded, expected)
    }

    func testNoteAccidentalDecoding() throws {
        let xml = """
        <note>
          <pitch>
            <step>G</step>
            <alter>1</alter>
            <octave>2</octave>
          </pitch>
          <duration>1</duration>
          <voice>1</voice>
          <type>quarter</type>
          <accidental>sharp</accidental>
        </note>
        """
        let decoded = try XMLDecoder().decode(Note.self, from: xml.data(using: .utf8)!)
        let expected = Note(
            voice: "1",
            type: NoteType(value: .quarter),
            accidental: Accidental(value: .sharp),
            pitch: Pitch(step: .g, alter: 1, octave: 2),
            duration: 1
        )
        XCTAssertEqual(decoded, expected)
    }

    func testNoteDottedRestDecoding() throws {
        let xml = """
        <note>
          <rest/>
          <duration>48</duration>
          <voice>1</voice>
          <type>quarter</type>
          <dot/>
        </note>
        """
        let decoded = try XMLDecoder().decode(Note.self, from: xml.data(using: .utf8)!)
        let expected = Note(voice: "1", type: .init(value: .quarter), dots: [EmptyPlacement.init(position: nil, printStyle: nil, placement: nil)], duration: 48)
        
    }
}
