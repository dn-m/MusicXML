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
            printStyle: nil,
            printObject: nil,
            printDot: nil,
            printSpacing: nil,
            printLyric: nil,
            dynamics: nil,
            endDynamics: nil,
            attack: nil,
            release: nil,
            timeOnly: nil,
            pizzicato: nil,
            instrument: nil,
            footnote: nil,
            level: nil,
            voice: "1",
            type: NoteType(value: .quarter, size: nil),
            dots: nil,
            accidental: nil,
            timeModification: nil,
            stem: nil,
            notehead: nil,
            noteheadText: nil,
            staff: nil,
            beams: nil,
            notations: nil,
            lyrics: nil,
            play: nil,
            pitch: Pitch(step: .c, alter: -1.5, octave: 4),
            duration: 1
        )
        XCTAssertEqual(decoded, expected)
    }
}
