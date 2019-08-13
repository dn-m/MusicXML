//
//  PartwiseTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/13/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class PartwiseTests: XCTestCase {

    #warning("FIXME: #67 Directions not decoding properly")
    func DIASABLED_testNoThrows() throws {
        let xml = """
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
        </part>
        """
        let _ = try XMLDecoder().decode(Partwise.Part.self, from: xml.data(using: .utf8)!)
    }
}
