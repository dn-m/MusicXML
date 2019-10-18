//
//  PartwiseMeasureTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import XCTest
import XMLCoder
import MusicXML

class PartwiseMeasureTests: XCTestCase {

    func testDecodingEmpty() throws {
        let xml = """
        <measure number="1"></measure>
        """
        let decoded = try MusicXMLDecoder()
            .decode(Partwise.Measure.self, from: xml.data(using: .utf8)!)
        let expected = Partwise.Measure(number: "1", musicData: [])
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
            <transpose>
              <diatonic>2</diatonic>
              <chromatic>3</chromatic>
            </transpose>
          </attributes>
        </measure>
        """
        let decoded = try MusicXMLDecoder()
            .decode(Partwise.Measure.self, from: xml.data(using: .utf8)!)
        let expected = Partwise.Measure(
            number: "1",
            width: 123.4,
            musicData: [
                .attributes(
                    Attributes(
                        divisions: 1,
                        keys: [Key(fifths: 0, mode: .major)],
                        times: [Time(4, 4, symbol: .common)],
                        clefs: [Clef(sign: .g, line: 2)],
                        transpose: [Transpose(diatonic: 2, chromatic: 3)]
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
        let decoded = try MusicXMLDecoder()
            .decode(Partwise.Measure.self, from: xml.data(using: .utf8)!)
        let expected = Partwise.Measure(
            number: "1",
            musicData: [
                .attributes(
                    Attributes(
                        divisions: 1,
                        keys: [Key(fifths: 0, mode: .major)],
                        times: [Time(4, 4, symbol: .common)],
                        clefs: [Clef(sign: .g, line: 2)]
                    )
                ),
                .note(
                    Note(
                        pitch: Pitch(step: .g, octave: 2),
                        duration: 1,
                        voice: "1",
                        type: .quarter
                    )
                ),
                .note(
                    Note(
                        pitch: Pitch(step: .a, octave: 2),
                        duration: 1,
                        voice: "1",
                        type: .quarter
                    )
                ),
                .note(
                    Note(
                        pitch: Pitch(step: .b, octave: 2),
                        duration: 1,
                        voice: "1",
                        type: .quarter
                    )
                ),
                .note(
                    Note(
                        pitch: Pitch(step: .c, octave: 3),
                        duration: 1,
                        voice: "1",
                        type: .quarter
                    )
                )
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDecodingBarline() throws {
        let xml = """
        <barline location="right">
          <bar-style>light-heavy</bar-style>
        </barline>
        """
        let decoded = try MusicXMLDecoder().decode(Barline.self, from: xml.data(using: .utf8)!)
        let expected = Barline(location: .right, barStyle: .lightHeavy)
        XCTAssertEqual(decoded, expected)
    }
}
