//
//  StaffNoteStylesTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/11/19.
//

import XCTest
import MusicXML
import XMLCoder

class StaffNoteStylesTests: XCTestCase {

    func testStaffNoteStyles() throws {
        let xml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 1.1 Partwise//EN"
                                        "http://www.musicxml.org/dtds/partwise.dtd">
        <score-partwise version="1.1">
          <identification>
            <miscellaneous>
              <miscellaneous-field name="description">Staff-connected note styles:
                slash notation, hidden notes (with and without hidden staff
                lines)</miscellaneous-field>
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
                <pitch>
                  <step>A</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <attributes>
                <measure-style>
                  <slash type="start" use-stems="no"/>
                </measure-style>
              </attributes>
              <note>
                <pitch>
                  <step>A</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <lyric number="1"><text>slash, no stem</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <attributes>
                <measure-style>
                  <slash type="stop"/>
                </measure-style>
                <measure-style>
                  <slash type="start" use-stems="yes"/>
                </measure-style>
              </attributes>
              <note>
                <pitch>
                  <step>A</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <lyric number="1"><text>slash, with stem</text></lyric>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="2">
              <note>
                <pitch>
                  <step>C</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <attributes>
                <measure-style>
                  <slash type="stop"/>
                </measure-style>
              </attributes>
              <note print-object="no">
                <pitch>
                  <step>A</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <lyric number="1"><text>hidden notes</text></lyric>
              </note>
              <note print-object="no">
                <pitch>
                  <step>C</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <attributes>
                <staff-details>
                  <staff-lines>0</staff-lines>
                </staff-details>
              </attributes>
              <note print-object="no">
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <lyric number="1"><text>hidden notes, staff lines</text></lyric>
              </note>
            </measure>
            <measure number="3">
              <note print-object="no">
                <pitch>
                  <step>D</step>
                  <octave>4</octave>
                </pitch>
                <duration>2</duration>
                <voice>1</voice>
                <type>half</type>
              </note>
              <attributes>
                <staff-details>
                  <staff-lines>5</staff-lines>
                </staff-details>
              </attributes>
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>2</duration>
                <voice>1</voice>
                <type>half</type>
                <lyric number="1"><text>normal settings restored</text></lyric>
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

    func testMeasureStylesAttributes() throws {
        let xml = """
        <attributes>
            <measure-style>
                <slash type="start" use-stems="no"/>
            </measure-style>
        </attributes>
        """
        let decoded = try XMLDecoder().decode(Attributes.self, from: xml.data(using: .utf8)!)
    }

    func testMeasureStyles() throws {
        let xml = """
        <measure-style>
            <slash type="start" use-stems="no"/>
        </measure-style>
        """
        let decoded = try XMLDecoder().decode(MeasureStyle.self, from: xml.data(using: .utf8)!)
    }
}
