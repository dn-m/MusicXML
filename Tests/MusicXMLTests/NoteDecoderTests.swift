//
//  NoteDecoderTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/17/18.
//

import XCTest
import XMLCoder
import MusicXML

class NoteDecoderTests: XCTestCase {

    func testPitch() {
        let xml = """
        <pitch>
          <step>C</step>
          <octave>4</octave>
        </pitch>
        """
        let _ = try! XMLDecoder().decode(MusicXML.Pitch.self, from: xml.data(using: .utf8)!)
    }

    func testNote() {
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
        let _ = try! XMLDecoder().decode(MusicXML.Note.self, from: xml.data(using: .utf8)!)
    }

    func testMusicData() {
        let xml = """
        <note>
            <pitch>
                <step>C</step>
                <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>quarter</type>
        </note>
        """
        XCTAssertNoThrow(try XMLDecoder().decode([MusicXML.MusicData.Datum].self, from: xml.data(using: .utf8)!))
    }
}
