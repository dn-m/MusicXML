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
        let _ = try! XMLDecoder().decode(MusicXML.Measure.Partwise.self, from: xml.data(using: .utf8)!)
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
        let _ = try! XMLDecoder().decode(MusicXML.Part.Partwise.self, from: xml.data(using: .utf8)!)
    }

    func testPartList() {
        let xml = """
        <part-list>
            <score-part id="P1">
                <part-name>Music</part-name>
            </score-part>
        </part-list>
        """
        let _ = try! XMLDecoder().decode(MusicXML.PartList.self, from: xml.data(using: .utf8)!)
    }
}
