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
                    duration: 1
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
                    duration: 1
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
                    duration: 56
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
        let expected = Note(kind: .normal(Note.Normal(chord: true, pitchUnpitchedOrRest: .pitch(Pitch(step: .e, octave: 5)), duration: 1)), voice: "1", type: NoteType(value: .quarter))
        try assertDecoded(xml, equals: expected)
    }

    #warning("FIXME: Reengage dots")
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
        let expected = Note(
            kind: .normal(
                Note.Normal(
                    pitchUnpitchedOrRest: .rest(
                        Rest(/*displayStep: nil, displayOctave: nil, measure: nil*/)
                    ),
                    duration: 48
                )
            ),
            voice: "1",
            type: NoteType(value: .quarter)/*,
            dots: [EmptyPlacement(position: nil, printStyle: nil, placement: nil)]*/
        )
        XCTAssertEqual(decoded, expected)
    }

    func testBeam() throws {
        let xml = """
        <note default-x="368.91" default-y="0.00">
          <pitch>
            <step>F</step>
            <alter>1</alter>
            <octave>5</octave>
            </pitch>
          <duration>1</duration>
          <voice>1</voice>
          <type>16th</type>
          <stem>down</stem>
          <beam number="1">begin</beam>
          <beam number="2">begin</beam>
        </note>
        """
        let decoded = try XMLDecoder().decode(Note.self, from: xml.data(using: .utf8)!)
        let expected = Note(
            kind: .normal(
                Note.Normal(
                    pitchUnpitchedOrRest: .pitch(
                        Pitch(step: .f, alter: 1, octave: 5)
                    ),
                    duration: 1
                )
            ),
            position: Position(defaultX: 368.91, defaultY: 0),
            voice: "1",
            type: NoteType(value: .sixteenth),
            stem: .down,
            beams: [
                Beam(value: .begin, number: .one),
                Beam(value: .begin, number: .two)
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testTies() throws {
        let xml = """
        <note default-x="483.50" default-y="-25.00">
          <pitch>
            <step>A</step>
            <octave>4</octave>
            </pitch>
          <duration>4</duration>
          <tie type="stop"/>
          <tie type="start"/>
          <voice>1</voice>
          <type>quarter</type>
          <stem>up</stem>
          <notations>
            <tied type="stop"/>
            <tied type="start"/>
          </notations>
        </note>
        """
        let decoded = try XMLDecoder().decode(Note.self, from: xml.data(using: .utf8)!)
        let expected = Note(
            kind: .normal(
                Note.Normal(
                    pitchUnpitchedOrRest: .pitch(
                        Pitch(step: .a, octave: 4)
                    ),
                    duration: 4,
                    ties: Ties(start: Tie(type: .start), stop: Tie(type: .stop))
                )
            ),
            position: Position(defaultX: 483.50, defaultY: -25.00),
            voice: "1",
            type: NoteType(value: .quarter),
            stem: .up,
            notations: Notations(values: [
                .tied(Tied(type: .stop)),
                .tied(Tied(type: .start))
            ])
        )
        XCTAssertEqual(decoded, expected)
    }

    func testUnpitched() throws {
        let xml = """
        <note default-x="68">
          <unpitched>
            <display-step>F</display-step>
            <display-octave>4</display-octave>
          </unpitched>
          <duration>1</duration>
          <instrument id="P1-X2"/>
          <voice>1</voice>
          <type>eighth</type>
          <stem default-y="-70">down</stem>
          <beam number="1">begin</beam>
        </note>
        """
        let decoded = try XMLDecoder().decode(Note.self, from: xml.data(using: .utf8)!)
        let expected = Note(
            kind: .normal(
                Note.Normal(
                    pitchUnpitchedOrRest: .unpitched(
                        Unpitched(
                            displayStep: .f,
                            displayOctave: 4
                        )
                    ),
                    duration: 1
                )
            ),
            position: Position(defaultX: 68),
            instrument: Instrument(id: "P1-X2"),
            voice: "1",
            type: NoteType(value: .eighth),
            stem: Stem(.down, position: Position(defaultY: -70)),
            beams: [Beam(value: .begin, number: .one)]
        )
        XCTAssertEqual(decoded, expected)
    }
}
