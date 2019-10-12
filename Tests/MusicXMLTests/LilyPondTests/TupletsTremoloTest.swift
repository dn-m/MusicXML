//
//  TupletsTremoloTest.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/11/19.
//

import XCTest
import MusicXML
import XMLCoder

class TupletsTremoloTest: XCTestCase {

    func testTupletsTremolo() throws {
        let xml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 1.1 Partwise//EN"
                                        "http://www.musicxml.org/dtds/partwise.dtd">
        <score-partwise version="1.1">
          <identification>
            <miscellaneous>
              <miscellaneous-field name="description">Tremolo tuplets are tuplets on
                  single notes with a tremolo ornament. The application shall correctly
                  import these notes with 2/3 or their time...</miscellaneous-field>
            </miscellaneous>
          </identification>
          <part-list>
            <score-part id="P1">
              <part-name print-object="no">MusicXML Part</part-name>
            </score-part>
          </part-list>
          <!--=========================================================-->
          <part id="P1">
            <measure number="1">
              <attributes>
                <divisions>36</divisions>
                <key>
                  <fifths>0</fifths>
                  <mode>major</mode>
                </key>
                <time>
                  <beats>3</beats>
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
                  <articulations>
                    <staccato placement="below"/>
                  </articulations>
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
                <notations>
                  <articulations>
                    <staccato placement="below"/>
                  </articulations>
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
                <beam number="1">end</beam>
                <notations>
                  <tuplet number="1" type="stop"/>
                  <articulations>
                    <staccato placement="below"/>
                  </articulations>
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
                <beam number="1">begin</beam>
                <notations>
                  <tuplet number="1" type="start"/>
                  <articulations>
                    <staccato placement="below"/>
                  </articulations>
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
                <notations>
                  <articulations>
                    <staccato placement="below"/>
                  </articulations>
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
                <beam number="1">end</beam>
                <notations>
                  <tuplet number="1" type="stop"/>
                  <articulations>
                    <staccato placement="below"/>
                  </articulations>
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
                <beam number="1">begin</beam>
                <notations>
                  <tuplet number="1" type="start"/>
                  <articulations>
                    <staccato placement="below"/>
                  </articulations>
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
                <notations>
                  <articulations>
                    <staccato placement="below"/>
                  </articulations>
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
                <beam number="1">end</beam>
                <notations>
                  <tuplet number="1" type="stop"/>
                  <articulations>
                    <staccato placement="below"/>
                  </articulations>
                </notations>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="2">
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>36</duration>
                <voice>1</voice>
                <type>quarter</type>
                <dot/>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
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
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>36</duration>
                <voice>1</voice>
                <type>quarter</type>
                <dot/>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
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
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>36</duration>
                <voice>1</voice>
                <type>quarter</type>
                <dot/>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
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
            <!--=======================================================-->
            <measure number="3">
              <note>
                <pitch>
                  <step>G</step>
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
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>36</duration>
                <voice>1</voice>
                <type>quarter</type>
                <dot/>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
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
            <!--=======================================================-->
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
            <!--=======================================================-->
            <measure number="5">
              <note>
                <pitch>
                  <step>G</step>
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
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>36</duration>
                <voice>1</voice>
                <type>quarter</type>
                <dot/>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
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

    func testTremolo() throws {
        let xml = """
        <tremolo>1</tremolo>
        """
        let decoded = try XMLDecoder().decode(Tremolo.self, from: xml.data(using: .utf8)!)
        let expected = Tremolo(marks: 1)
        XCTAssertEqual(decoded, expected)
    }
}
