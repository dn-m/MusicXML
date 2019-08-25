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
            kind: .normal(
                Note.Normal(
                    chord: false,
                    pitchUnpitchedOrRest: .pitch(Pitch(step: .c, alter: -1.5, octave: 4)),
                    duration: 1,
                    ties: []
                )
            ),
            voice: "1",
            type: NoteType(value: .quarter)
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
            kind: .normal(
                Note.Normal(
                    pitchUnpitchedOrRest: .pitch(Pitch(step: .g, alter: 1, octave: 2)),
                    duration: 1,
                    ties: []
                )
            ),
            voice: "1",
            type: NoteType(value: .quarter),
            accidental: Accidental(value: .sharp)
        )
        XCTAssertEqual(decoded, expected)
    }

    func testTuplet() throws {
        let xml = """
        <note>
          <pitch>
            <step>C</step>
            <octave>4</octave>
          </pitch>
          <duration>56</duration>
          <voice>1</voice>
          <type>quarter</type>
          <time-modification>
            <actual-notes>3</actual-notes>
            <normal-notes>2</normal-notes>
          </time-modification>
          <notations>
            <tuplet number="1" type="start"/>
          </notations>
        </note>
        """
        let decoded = try XMLDecoder().decode(Note.self, from: xml.data(using: .utf8)!)
        let expected = Note(
            kind: .normal(
                Note.Normal(
                    pitchUnpitchedOrRest: .pitch(Pitch(step: .c, octave: 4)),
                    duration: 56,
                    ties: []
                )
            ),
            voice: "1",
            type: NoteType(value: .quarter),
            timeModification: TimeModification(actualNotes: 3, normalNotes: 2),
            notations: Notations(values: [.tuplet(Tuplet(type: .start, number: 1))])
        )
        XCTAssertEqual(decoded, expected)
    }

    #warning("FIXME: #68 Chord not decoding properly")
    func DISABLED_testChord() throws {
        let xml = """
        <note>
          <chord/>
          <pitch>
            <step>E</step><octave>5</octave>
          </pitch>
          <duration>1</duration>
          <voice>1</voice>
          <type>quarter</type>
        </note>
        """
        let expected = Note(kind: .normal(Note.Normal(chord: true, pitchUnpitchedOrRest: .pitch(Pitch(step: .e, octave: 5)), duration: 1, ties: [])), voice: "1", type: NoteType(value: .quarter))
        try assertDecoded(xml, equals: expected)
    }

    #warning("FIXME: #41 Note.dots not decoding properly yet")
    func DISABLED_testNoteDottedRestDecoding() throws {
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
        let expected = Note(
            kind: .normal(
                Note.Normal(
                    pitchUnpitchedOrRest: .rest(
                        Rest(/*displayStep: nil, displayOctave: nil, measure: nil*/)
                    ),
                    duration: 48,
                    ties: []
                )
            ),
            voice: "1",
            type: NoteType(value: .quarter)/*,
            dots: [EmptyPlacement(position: nil, printStyle: nil, placement: nil)]*/
        )
        XCTAssertEqual(decoded, expected)
    }
}
