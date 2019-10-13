//
//  AccordionRegistrationTests.swift
//  MusicXMLTests
//
//  Created by Sihao Lu on 10/12/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class AccordionRegistrationTests: XCTestCase {
    func testDecoding() throws {
        let xml = """
        <accordion-registration>
            <accordion-high/>
            <accordion-middle>2</accordion-middle>
        </accordion-registration>
        """
        let decoded = try XMLDecoder().decode(AccordionRegistration.self, from: xml.data(using: .utf8)!)
        let expected = AccordionRegistration(accordionHigh: Empty(), accordionMiddle: 2)
        XCTAssertEqual(decoded, expected)
    }
    
    func testBigRegistration() throws {
        let xml = """
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 2.0 Partwise//EN"
                                "http://www.musicxml.org/dtds/partwise.dtd">
<score-partwise version="2.0">
  <identification>
    <miscellaneous>
      <miscellaneous-field name="description">All possible accordion
          registrations.</miscellaneous-field>
    </miscellaneous>
  </identification>
  <part-list>
    <score-part id="P1">
      <part-name></part-name>
    </score-part>
  </part-list>
  <!--=========================================================-->
  <part id="P1">
    <!-- Direction type can contain the following child types:
         rehearsal+ | segno+ | words+ |
         coda+ | wedge | dynamics+ | dashes | bracket | pedal |
         metronome | octave-shift | harp-pedals | damp |
         damp-all | eyeglasses | scordatura | image |
         accordion-registration | other-direction -->
    <!-- Rehearsal marks -->
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
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-low/>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>0/0/1</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-middle>1</accordion-middle>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>0/1/0</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-middle>1</accordion-middle>
              <accordion-low/>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>0/1/1</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-middle>2</accordion-middle>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>0/2/0</text></lyric>
      </note>
    </measure>
    <measure number="2">
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-middle>2</accordion-middle>
              <accordion-low/>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>0/2/1</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-middle>3</accordion-middle>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>0/3/0</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-middle>3</accordion-middle>
              <accordion-low/>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>0/3/1</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-high/>
              <accordion-low/>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>1/0/1</text></lyric>
      </note>
    </measure>
    <measure number="3">
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-high/>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>1/0/0</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-high/>
              <accordion-middle>1</accordion-middle>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>1/1/0</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-high/>
              <accordion-middle>1</accordion-middle>
              <accordion-low/>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>1/1/1</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-high/>
              <accordion-middle>2</accordion-middle>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>1/2/0</text></lyric>
      </note>
    </measure>
    <measure number="4">
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-high/>
              <accordion-middle>2</accordion-middle>
              <accordion-low/>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>1/2/1</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-high/>
              <accordion-middle>3</accordion-middle>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>1/3/0</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-high/>
              <accordion-middle>3</accordion-middle>
              <accordion-low/>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>1/3/1</text></lyric>
      </note>
      <!-- Special cases: No accordion-(high|middle|low) given, empty middle,
           middle with invalid value, middle with 0 -->
      <direction>
        <direction-type>
          <accordion-registration>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>empty</text></lyric>
      </note>
    </measure>
    <measure number="5">
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-high/>
              <accordion-middle/>
              <accordion-low/>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>empty M</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-high/>
              <accordion-middle>test</accordion-middle>
              <accordion-low/>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>inval.M</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-high/>
              <accordion-middle>0</accordion-middle>
              <accordion-low/>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>M=0</text></lyric>
      </note>
      <direction>
        <direction-type>
          <accordion-registration>
              <accordion-high/>
              <accordion-middle>5</accordion-middle>
              <accordion-low/>
          </accordion-registration>
        </direction-type>
      </direction>
      <note>
        <pitch><step>C</step><octave>4</octave></pitch>
        <duration>1</duration>
        <voice>1</voice>
        <type>quarter</type>
        <lyric number="1"><text>M=5</text></lyric>
      </note>
      
      <barline location="right">
        <bar-style>light-heavy</bar-style>
      </barline>
    </measure>
    <!--=======================================================-->
  </part>
  <!--=========================================================-->
</score-partwise>
"""
    let decoded = try XMLDecoder().decode(Traversal.self, from: xml.data(using: .utf8)!)
    let expected = AccordionRegistration(accordionHigh: Empty(), accordionMiddle: 2)
    }
}
