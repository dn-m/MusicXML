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
                        keys: [
                            Key(kind: .traditional(Key.Traditional(fifths: 0, mode: .major)))
                        ],
                        times: [
                            Time(
                                symbol: .common,
                                kind: .measured(
                                    Time.Measured(
                                        signatures: [Time.Signature(beats: "4", beatType: "4")]
                                    )
                                )
                            )
                        ],
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
                        keys: [
                            Key(kind: .traditional(Key.Traditional(fifths: 0, mode: .major)))
                        ],
                        times: [
                            Time(
                                symbol: .common,
                                kind: .measured(
                                    Time.Measured(signatures: [Time.Signature(beats: "4", beatType: "4")])
                                )
                            )
                        ],
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
                                duration: 1,
                                ties: []
                            )
                        ),
                        voice: "1",
                        type: NoteType(value: .quarter)
                    )
                ),
                .note(
                    Note(
                        kind: .normal(
                            Note.Normal(
                                pitchUnpitchedOrRest: .pitch(Pitch(step: .a, octave: 2)),
                                duration: 1,
                                ties: []
                            )
                        ),
                        voice: "1",
                        type: NoteType(value: .quarter)
                    )
                ),
                .note(
                    Note(
                        kind: .normal(
                            Note.Normal(
                                pitchUnpitchedOrRest: .pitch(Pitch(step: .b, octave: 2)),
                                duration: 1,
                                ties: []
                            )
                        ),
                        voice: "1",
                        type: NoteType(value: .quarter)
                    )
                ),
                .note(
                    Note(
                        kind: .normal(
                            Note.Normal(
                                pitchUnpitchedOrRest: .pitch(Pitch(step: .c, octave: 3)),
                                duration: 1,
                                ties: []
                            )
                        ),
                        voice: "1",
                        type: NoteType(value: .quarter)
                    )
                )
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    #warning("FIXME: #67 Directions not decoding properly")
    func DISABLED_testNoThrows() throws {
        let xml = """
        <measure number="4">
          <note>
            <pitch>
              <step>F</step>
              <octave>4</octave>
            </pitch>
            <duration>12</duration>
            <voice>1</voice>
            <type>eighth</type>
            <time-modification>
              <actual-notes>3</actual-notes>
              <normal-notes>2</normal-notes>
            </time-modification>
            <beam number="1">begin</beam>
            <notations>
              <tuplet number="1" type="start"/>
            </notations>
          </note>
          <note>
            <pitch>
              <step>A</step>
              <octave>4</octave>
            </pitch>
            <duration>12</duration>
            <voice>1</voice>
            <type>eighth</type>
            <time-modification>
              <actual-notes>3</actual-notes>
              <normal-notes>2</normal-notes>
            </time-modification>
            <beam number="1">continue</beam>
          </note>
          <note>
            <pitch>
              <step>A</step>
              <octave>4</octave>
            </pitch>
            <duration>12</duration>
            <voice>1</voice>
            <type>eighth</type>
            <time-modification>
              <actual-notes>3</actual-notes>
              <normal-notes>2</normal-notes>
            </time-modification>
            <beam number="1">end</beam>
            <notations>
              <tuplet number="1" type="stop"/>
            </notations>
          </note>
          <direction placement="below">
            <direction-type>
              <dynamics>
                <fp/>
              </dynamics>
            </direction-type>
          </direction>
          <note>
            <pitch>
              <step>A</step>
              <octave>4</octave>
            </pitch>
            <duration>72</duration>
            <voice>1</voice>
            <type>half</type>
            <dot/>
            <time-modification>
              <actual-notes>6</actual-notes>
              <normal-notes>4</normal-notes>
              <normal-type>eighth</normal-type>
            </time-modification>
            <notations>
              <tuplet number="1" type="start"/>
              <tuplet number="1" type="stop"/>
              <ornaments>
                <tremolo>1</tremolo>
              </ornaments>
            </notations>
          </note>
        </measure>
        """
        let _ = try XMLDecoder().decode(Partwise.Measure.self, from: xml.data(using: .utf8)!)
    }
}
