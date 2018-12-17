//
//  DecoderTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/16/18.
//

import XCTest
import XMLCoder
import MusicXML

class DecoderTests: XCTestCase {

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

    func testTime() {
        let xml = """
        <time>
            <beats>4</beats>
            <beat-type>4</beat-type>
        </time>
        """
        let _ = try! XMLDecoder().decode(MusicXML.Attributes.Time.self, from: xml.data(using: .utf8)!)
    }

    func testKey() {
        let xml = """
        <key>
            <fifths>0</fifths>
        </key>
        """
        let _ = try! XMLDecoder().decode(MusicXML.Attributes.Key.self, from: xml.data(using: .utf8)!)
    }

    func testClef() {
        let xml = """
        <clef>
            <sign>G</sign>
            <line>2</line>
        </clef>
        """
        let _ = try! XMLDecoder().decode(MusicXML.Attributes.Clef.self, from: xml.data(using:. utf8)!)
    }

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
        let _ = try! XMLDecoder().decode(MusicXML.MeasurePartwise.self, from: xml.data(using: .utf8)!)
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
        let _ = try! XMLDecoder().decode(MusicXML.PartPartwise.self, from: xml.data(using: .utf8)!)
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

    func testHelloWorld() {
        let xml = """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-partwise PUBLIC
            "-//Recordare//DTD MusicXML 3.1 Partwise//EN"
            "http://www.musicxml.org/dtds/partwise.dtd">
        <score-partwise version="3.1">
          <part-list>
            <score-part id="P1">
              <part-name>Music</part-name>
            </score-part>
          </part-list>
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
        </score-partwise>
        """
        let scorePartwise = try! XMLDecoder().decode(MusicXML.ScorePartwise.self, from: xml.data(using: .utf8)!)
        dump(scorePartwise)
    }
}
