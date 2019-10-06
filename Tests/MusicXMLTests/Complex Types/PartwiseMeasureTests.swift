//
//  PartwiseMeasureTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class PartwiseMeasureTests: XCTestCase {

    func testDecodingEmpty() throws {
        let xml = """
        <measure number="1"></measure>
        """
        let decoded = try XMLDecoder()
            .decode(Partwise.Measure.self, from: xml.data(using: .utf8)!)
        let expected = Partwise.Measure(number: 1, musicData: [])
        XCTAssertEqual(decoded, expected)
    }

    func testDecodingAttributes() throws {
        let xml = """
        <measure number="1" width="123.4">
          <attributes>
            <divisions>1</divisions>
            <key>
              <fifths>0</fifths>
              <mode>major</mode>
            </key>
            <time symbol="common">
              <beats>4</beats>
              <beat-type>4</beat-type>
            </time>
            <clef>
              <sign>G</sign>
              <line>2</line>
            </clef>
          </attributes>
        </measure>
        """
        let decoded = try XMLDecoder()
            .decode(Partwise.Measure.self, from: xml.data(using: .utf8)!)
        let expected = Partwise.Measure(
            number: 1,
            width: Tenths(value: 123.4),
            musicData: [
                .attributes(
                    Attributes(
                        divisions: 1,
                        keys: [Key(fifths: 0, mode: .major)],
                        times: [Time(4, 4, symbol: .common)],
                        clefs: [Clef(sign: .g, line: 2)]
                    )
                )
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDecodingNotes() throws {
        let xml = """
        <measure number="1">
          <attributes>
            <divisions>1</divisions>
            <key>
              <fifths>0</fifths>
              <mode>major</mode>
            </key>
            <time symbol="common">
              <beats>4</beats>
              <beat-type>4</beat-type>
            </time>
            <clef>
              <sign>G</sign>
              <line>2</line>
            </clef>
          </attributes>
          <note>
            <pitch>
              <step>G</step>
              <octave>2</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>quarter</type>
          </note>
          <note>
            <pitch>
              <step>A</step>
              <octave>2</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>quarter</type>
          </note>
          <note>
            <pitch>
              <step>B</step>
              <octave>2</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>quarter</type>
          </note>
          <note>
            <pitch>
              <step>C</step>
              <octave>3</octave>
            </pitch>
            <duration>1</duration>
            <voice>1</voice>
            <type>quarter</type>
          </note>
        </measure>
        """
        let decoded = try XMLDecoder()
            .decode(Partwise.Measure.self, from: xml.data(using: .utf8)!)
        let expected = Partwise.Measure(
            number: 1,
            musicData: [
                .attributes(
                    Attributes(
                        divisions: 1,
                        keys: [Key(fifths: 0, mode: .major)],
                        times: [Time(4, 4, symbol: .common)],
                        clefs: [
                            Clef(sign: .g, line: 2)
                        ]
                    )
                ),
                .note(
                    Note(
                        kind: .normal(
                            Note.Normal(
                                pitchUnpitchedOrRest: .pitch(Pitch(step: .g, octave: 2)),
                                duration: 1
                            )
                        ),
                        voice: "1",
                        type: NoteType( .quarter)
                    )
                ),
                .note(
                    Note(
                        kind: .normal(
                            Note.Normal(
                                pitchUnpitchedOrRest: .pitch(Pitch(step: .a, octave: 2)),
                                duration: 1
                            )
                        ),
                        voice: "1",
                        type: NoteType( .quarter)
                    )
                ),
                .note(
                    Note(
                        kind: .normal(
                            Note.Normal(
                                pitchUnpitchedOrRest: .pitch(Pitch(step: .b, octave: 2)),
                                duration: 1
                            )
                        ),
                        voice: "1",
                        type: NoteType( .quarter)
                    )
                ),
                .note(
                    Note(
                        kind: .normal(
                            Note.Normal(
                                pitchUnpitchedOrRest: .pitch(Pitch(step: .c, octave: 3)),
                                duration: 1
                            )
                        ),
                        voice: "1",
                        type: NoteType( .quarter)
                    )
                )
            ]
        )
        XCTAssertEqual(decoded, expected)
    }
}
