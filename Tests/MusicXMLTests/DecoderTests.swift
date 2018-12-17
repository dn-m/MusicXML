//
//  DecoderTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/16/18.
//

import XCTest
import XMLCoder

class DecoderTests: XCTestCase {

    func testPitch() {
        let xml = """
        <pitch>
          <step>C</step>
          <octave>4</octave>
        </pitch>
        """
        let _ = try! XMLDecoder().decode(Pitch.self, from: xml.data(using: .utf8)!)
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
        let _ = try! XMLDecoder().decode(Note.self, from: xml.data(using: .utf8)!)
    }

    func testTime() {
        let xml = """
        <time>
            <beats>4</beats>
            <beat-type>4</beat-type>
        </time>
        """
        let _ = try! XMLDecoder().decode(Time.self, from: xml.data(using: .utf8)!)
    }

    func testKey() {
        let xml = """
        <key>
            <fifths>0</fifths>
        </key>
        """
        let _ = try! XMLDecoder().decode(Key.self, from: xml.data(using: .utf8)!)
    }

    func testClef() {
        let xml = """
        <clef>
            <sign>G</sign>
            <line>2</line>
        </clef>
        """
        let _ = try! XMLDecoder().decode(Clef.self, from: xml.data(using:. utf8)!)
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
        let _ = try! XMLDecoder().decode(Measure.self, from: xml.data(using: .utf8)!)
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
        let _ = try! XMLDecoder().decode(Part.self, from: xml.data(using: .utf8)!)
    }

    func testPartList() {
        let xml = """
        <part-list>
            <score-part id="P1">
                <part-name>Music</part-name>
            </score-part>
        </part-list>
        """
        let _ = try! XMLDecoder().decode(PartList.self, from: xml.data(using: .utf8)!)
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
        let _ = try! XMLDecoder().decode(ScorePartWise.self, from: xml.data(using: .utf8)!)
    }
}

struct Note: Decodable {
    let pitch: Pitch
    let duration: Int
    let type: String
}

struct Pitch: Decodable {
    let id: Int?
    let step: String
    let octave: Int
}

struct Measure: Decodable {

    enum CodingKeys: String, CodingKey {
        case notes = "note"
        case attributes
        case number
    }

    let number: Int
    let attributes: Attributes
    let notes: [Note]
}

struct Time: Decodable {

    let beats: Int
    let type: Int

    enum CodingKeys: String, CodingKey {
        case beats
        case type = "beat-type"
    }
}

struct Key: Decodable {
    let fifths: Int
}

struct Clef: Decodable {
    let sign: String
    let line: Int
}

struct Attributes: Decodable {
    let key: Key
    let clef: Clef
    let time: Time
    let divisions: Int
}

struct Part: Decodable {

    enum CodingKeys: String, CodingKey {
        case id
        case measures = "measure"
    }

    let id: String
    let measures: [Measure]
}

struct ScorePart: Decodable {

    enum CodingKeys: String, CodingKey {
        case id
        case name = "part-name"
    }

    let id: String
    let name: String
}

struct PartList: Decodable {

    enum CodingKeys: String, CodingKey {
        case parts = "score-part"
    }

    let parts: [ScorePart]
}

struct ScorePartWise: Decodable {

    enum CodingKeys: String, CodingKey {
        case partList = "part-list"
        case parts = "part"
    }

    let partList: PartList
    let parts: [Part]
}
