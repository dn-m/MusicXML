//
//  MeasureTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/4/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class MeasureTests: XCTestCase {

    func testDecoding() throws {
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
            .decode(Score.Partwise.Measure.self, from: xml.data(using: .utf8)!)
        dump(decoded)
    }
}
