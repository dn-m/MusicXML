//
//  ScoreDecoderTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/17/18.
//

import XCTest
import XMLCoder
import MusicXML

class ScoreDecoderTests: XCTestCase {

    func testMeasure() {
        let xml = """
        <measure number="1">
            <attributes>
                <divisions>1</divisions>
                <key>
                    <fifths>0</fifths>
                </key>
                <time>
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
                    <step>C</step>
                    <octave>4</octave>
                </pitch>
                <duration>4</duration>
                <type>whole</type>
            </note>
        </measure>
        """
        XCTAssertNoThrow(
            try XMLDecoder().decode(MusicXML.Score.Partwise.Measure.self, from: xml.data(using: .utf8)!)
        )
    }

    func testPart() {
        let xml = """
        <part id="P1">
            <measure number="1">
                <attributes>
                    <divisions>1</divisions>
                    <key>
                        <fifths>0</fifths>
                    </key>
                    <time>
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
                        <step>C</step>
                        <octave>4</octave>
                    </pitch>
                    <duration>4</duration>
                    <type>whole</type>
                </note>
            </measure>
        </part>
        """
        XCTAssertNoThrow(
            try XMLDecoder().decode(MusicXML.Score.Partwise.Part.self, from: xml.data(using: .utf8)!)
        )
    }

    func testPartList() {
        let xml = """
        <part-list>
            <score-part id="P1">
                <part-name>Music</part-name>
            </score-part>
        </part-list>
        """
        XCTAssertNoThrow(
            try XMLDecoder().decode(MusicXML.Score.Header.PartList.self, from: xml.data(using: .utf8)!)
        )
    }
}
