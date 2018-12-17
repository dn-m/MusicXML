//
//  HelloWorldDecoderTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/17/18.
//

import XCTest
import XMLCoder
import MusicXML

class HelloWorldDecoderTests: XCTestCase {

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
        let _ = try! XMLDecoder().decode(MusicXML.Score.self, from: xml.data(using: .utf8)!)
    }
}
