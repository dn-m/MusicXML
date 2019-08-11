//
//  Partwise_33_Spanners_A.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/11/19.
//

extension Partwise_33_Spanners {
    var A: String {
        """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 1.0 Partwise//EN"
                                        "http://www.musicxml.org/dtds/partwise.dtd">
        <score-partwise>
          <identification>
            <miscellaneous>
              <miscellaneous-field name="description">Several spanners defined in
                   MusicXML: tuplet, slur (solid, dashed), tie,  wedge (cresc, dim),
                   tr + wavy-line, single-note trill spanner, octave-shift (8va,15mb),
                   bracket (solid down/down, dashed down/down, solid none/down,
                   dashed none/up, solid none/none), dashes, glissando (wavy),
                   bend-alter, slide (solid), grouping, two-note tremolo, hammer-on,
                   pull-off, pedal (down, change, up).</miscellaneous-field>
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
                <divisions>3</divisions>
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
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>2</duration>
                <voice>1</voice>
                <type>quarter</type>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
                </time-modification>
                <notations>
                  <tuplet number="1" placement="above" type="start"/>
                </notations>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>2</duration>
                <voice>1</voice>
                <type>quarter</type>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
                </time-modification>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>2</duration>
                <voice>1</voice>
                <type>quarter</type>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
                </time-modification>
                <notations>
                  <tuplet number="1" type="stop"/>
                </notations>
              </note>
              <note>
                <rest/>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="2">
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slur number="1" type="start"/>
                </notations>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slur number="1" type="stop"/>
                </notations>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="3">
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slur line-type="dashed" number="1" type="start"/>
                </notations>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slur number="1" type="stop"/>
                </notations>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="4">
              <direction placement="above">
                <direction-type>
                  <wedge spread="0" type="crescendo"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <direction>
                <direction-type>
                  <wedge spread="15" type="stop"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="5">
              <direction placement="above">
                <direction-type>
                  <wedge spread="15" type="diminuendo"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <direction>
                <direction-type>
                  <wedge spread="0" type="stop"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="6">
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments>
                    <trill-mark/>
                    <wavy-line number="1" type="start"/>
                  </ornaments>
                </notations>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments>
                    <wavy-line number="1" type="stop"/>
                  </ornaments>
                </notations>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="7">
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments>
                    <wavy-line number="1" type="start"/>
                    <wavy-line number="1" type="stop"/>
                  </ornaments>
                </notations>
              </note>
              <note>
                <rest/>
                <duration>6</duration>
                <voice>1</voice>
                <type>half</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="8">
              <direction>
                <direction-type>
                  <octave-shift size="8" type="down"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>5</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>5</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>5</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <direction>
                <direction-type>
                  <octave-shift size="8" type="stop"/>
                </direction-type>
              </direction>
            </measure>
            <!--=======================================================-->
            <measure number="9">
              <direction>
                <direction-type>
                  <octave-shift size="15" type="up"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>2</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>2</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>2</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <direction>
                <direction-type>
                  <octave-shift size="15" type="stop"/>
                </direction-type>
              </direction>
            </measure>
            <!--=======================================================-->
            <measure number="10">
              <direction placement="above">
                <direction-type>
                  <bracket line-end="down" line-type="solid" number="1" type="start"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <direction placement="above">
                <direction-type>
                  <bracket line-end="down" number="1" type="stop"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="11">
              <direction placement="above">
                <direction-type>
                  <bracket line-end="down" line-type="dashed" number="1" type="start"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <direction placement="above">
                <direction-type>
                  <bracket line-end="down" number="1" type="stop"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="12">
              <direction placement="above">
                <direction-type>
                  <bracket line-end="none" line-type="solid" number="1" type="start"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <direction placement="above">
                <direction-type>
                  <bracket line-end="down" number="1" type="stop"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="13">
              <direction placement="above">
                <direction-type>
                  <bracket line-end="none" line-type="dashed" number="1" type="start"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <direction placement="above">
                <direction-type>
                  <bracket line-end="up" number="1" type="stop"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="14">
              <direction placement="above">
                <direction-type>
                  <bracket line-end="none" line-type="solid" number="1" type="start"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <direction placement="above">
                <direction-type>
                  <bracket line-end="none" number="1" type="stop"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="15">
              <direction placement="above">
                <direction-type>
                  <dashes number="1" type="start"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <direction placement="above">
                <direction-type>
                  <dashes number="1" type="stop"/>
                </direction-type>
              </direction>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="16">
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <glissando line-type="wavy" number="1" type="start"/>
                </notations>
              </note>
              <note>
                <pitch>
                  <step>F</step>
                  <octave>5</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <glissando line-type="wavy" number="1" type="stop"/>
                </notations>
              </note>
              <note>
                <rest/>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="17">
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <bend>
                      <bend-alter>6</bend-alter>
                    </bend>
                  </technical>
                </notations>
              </note>
              <note>
                <pitch>
                  <step>C</step>
                  <octave>5</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <bend>
                      <bend-alter>0</bend-alter>
                    </bend>
                  </technical>
                </notations>
              </note>
              <note>
                <rest/>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="18">
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slide line-type="solid" number="1" type="start"/>
                </notations>
              </note>
              <note>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <slide line-type="solid" number="1" type="stop"/>
                </notations>
              </note>
              <note>
                <rest/>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="19">
              <grouping type="start"/>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <grouping type="stop"/>
            </measure>
            <!--=======================================================-->
            <measure number="20">
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments><tremolo type="start">2</tremolo></ornaments>
                </notations>
              </note>
              <note>
                <pitch>
                  <step>B</step>
                  <octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments><tremolo type="stop">2</tremolo></ornaments>
                </notations>
              </note>
              <note>
                <rest/>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="21">
              <note>
                <pitch>
                  <step>B</step><octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <hammer-on type="start"/>
                  </technical>
                </notations>
              </note>
              <note>
                <pitch>
                  <step>B</step><octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <hammer-on type="stop"/>
                  </technical>
                </notations>
              </note>
              <note>
                <rest/>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="22">
              <note>
                <pitch>
                  <step>B</step><octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <pull-off type="start"/>
                  </technical>
                </notations>
              </note>
              <note>
                <pitch>
                  <step>B</step><octave>4</octave>
                </pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <pull-off type="stop"/>
                  </technical>
                </notations>
              </note>
              <note>
                <rest/>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="23">
              <direction>
                <direction-type>
                  <pedal type="start"/>
                </direction-type>
              </direction>
              <note>
                <pitch><step>B</step><octave>4</octave></pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <direction>
                <direction-type>
                  <pedal type="change"/>
                </direction-type>
              </direction>
              <note>
                <pitch><step>B</step><octave>4</octave></pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <direction>
                <direction-type>
                  <pedal type="stop"/>
                </direction-type>
              </direction>
              <note>
                <pitch><step>B</step><octave>4</octave></pitch>
                <duration>3</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <barline location="right">
                <bar-style>light-heavy</bar-style>
              </barline>
            </measure>
          </part>
          <!--=========================================================-->
        </score-partwise>
        """
    }
}
