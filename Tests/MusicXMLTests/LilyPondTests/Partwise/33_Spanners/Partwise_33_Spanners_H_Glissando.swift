//
//  Partwise_33_Spanners_H_Glissando.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/11/19.
//

extension Partwise_33_Spanners {
    var H_Glissando: String {
        """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 2.0 Partwise//EN"
                                        "http://www.musicxml.org/dtds/partwise.dtd">
        <score-partwise version="2.0">
          <identification>
            <miscellaneous>
              <miscellaneous-field name="description">All different types of
                  glissando defined in MusicXML</miscellaneous-field>
            </miscellaneous>
          </identification>
          <part-list>
            <score-part id="P1">
              <part-name></part-name>
            </score-part>
          </part-list>
          <!--=========================================================-->
          <part id="P1">
            <!-- Glissando styles: glissando/slide, solid/dashed/dotted/wavy -->
            <measure number="1">
              <attributes>
                <divisions>1</divisions>
                <key>
                  <fifths>0</fifths>
                  <mode>major</mode>
                </key>
                <clef>
                  <sign>G</sign>
                  <line>2</line>
                </clef>
              </attributes>
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <glissando number="1" type="start"/>
                </notations>
                <lyric number="1"><text>normal</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>F</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <glissando number="1" type="stop"/>
                </notations>
                <lyric number="1"><text>glissando</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <glissando line-type="solid" number="1" type="start">text</glissando>
                </notations>
                <lyric number="1"><text>solid</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>F</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <glissando line-type="solid" number="1" type="stop"/>
                </notations>
                <lyric number="1"><text>(+text)</text></lyric>
              </note>
            </measure>
            <measure number="2">
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <glissando line-type="dashed" number="1" type="start"/>
                </notations>
                <lyric number="1"><text>dashed</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>F</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <glissando line-type="dashed" number="1" type="stop"/>
                </notations>
              </note>
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <glissando line-type="dotted" number="1" type="start"/>
                </notations>
                <lyric number="1"><text>dotted</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>F</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <glissando line-type="dotted" number="1" type="stop"/>
                </notations>
              </note>
            </measure>
            <measure number="3">
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <glissando line-type="wavy" number="1" type="start"/>
                </notations>
                <lyric number="1"><text>wavy</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>F</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <glissando line-type="wavy" number="1" type="stop"/>
                </notations>
              </note>
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slide number="1" type="start"/>
                </notations>
                <lyric number="1"><text>normal</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>F</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slide number="1" type="stop"/>
                </notations>
                <lyric number="1"><text>slide</text></lyric>
              </note>
            </measure>
            <measure number="4">
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slide line-type="solid" number="1" type="start">text</slide>
                </notations>
                <lyric number="1"><text>solid</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>F</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slide line-type="solid" number="1" type="stop"/>
                </notations>
                <lyric number="1"><text>(+text)</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slide line-type="dashed" number="1" type="start"/>
                </notations>
                <lyric number="1"><text>dashed</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>F</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slide line-type="solid" number="1" type="stop"/>
                </notations>
              </note>
            </measure>
            <measure number="5">
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slide line-type="dotted" number="1" type="start"/>
                </notations>
                <lyric number="1"><text>dotted</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>F</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slide line-type="dotted" number="1" type="stop"/>
                </notations>
              </note>
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slide line-type="wavy" number="1" type="start"/>
                </notations>
                <lyric number="1"><text>wavy</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>F</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slide line-type="wavy" number="1" type="stop"/>
                </notations>
              </note>
              <barline location="right">
                <bar-style>light-heavy</bar-style>
              </barline>
            </measure>
          </part>
        </score-partwise>
        """
    }
}
