//
//  SimpleRepeatTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/12/19.
//

import XCTest
import XMLCoder
import MusicXML

class SimpleRepeatTests: XCTestCase {

    func testLilyPond() throws {
        let xml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 1.0 Partwise//EN"
                                        "http://www.musicxml.org/dtds/partwise.dtd">
        <score-partwise>
          <identification>
            <miscellaneous>
              <miscellaneous-field name="description">A simple, repeated measure
                  (repeated 5 times)</miscellaneous-field>
            </miscellaneous>
          </identification>
          <part-list>
            <score-part id="P1">
              <part-name>MusicXML Part</part-name>
            </score-part>
          </part-list>
          <!--=========================================================-->
          <part id="P1">
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
                <rest/>
                <duration>4</duration>
                <voice>1</voice>
              </note>
              <barline location="right">
                <bar-style>light-heavy</bar-style>
                <repeat direction="backward" times="5"/>
              </barline>
            </measure>
            <!--=======================================================-->
            <measure number="2">
              <note>
                <rest/>
                <duration>4</duration>
                <voice>1</voice>
              </note>
              <barline location="right">
                <bar-style>light-heavy</bar-style>
              </barline>
            </measure>
          </part>
          <!--=========================================================-->
        </score-partwise>
        """
        let _ = try MusicXML(string: xml)
    }
}
