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
        #warning("Make assetion in note accidental test")
//        let expected = Note(
//            voice: "1",
//            type: NoteType(value: .quarter, size: nil),
//            accidental: Accidental(value: <#T##AccidentalValue#>, cautionary: <#T##Bool?#>, editorial: <#T##Bool?#>, parentheses: <#T##Bool?#>, bracket: <#T##Bool?#>, size: <#T##SymbolSize?#>, position: <#T##Position?#>, printStyle: <#T##PrintStyle?#>)
//            pitch: Pitch(step: .g, alter: 1, octave: 2)
//            duration: 1
//        )
    }
}
