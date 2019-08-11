//
//  Partwise_33_Spanners_I_Ties_NotEnded.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/11/19.
//

extension Partwise_33_Spanners {
    var I_Ties_NotEnded: String {
        """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise version="2.0">
           <identification>
              <miscellaneous>
                 <miscellaneous-field name="description">Several ties that have their end tag missing.</miscellaneous-field>
              </miscellaneous>
          </identification>
           <part-list>
              <score-part id="P1">
                 <part-name>MusicXML Part</part-name>
              </score-part>
          </part-list>
           <measure number="1">
              <part id="P1">
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
                       <step>C</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>4</duration>
                    <tie type="start"/>
                    <voice>1</voice>
                    <type>whole</type>
                    <notations>
                       <tied type="start"/>
                    </notations>
                    <lyric number="1">
                       <syllabic>end</syllabic>
                       <text>A</text>
                    </lyric>
                 </note>
              </part>
           </measure>
           <measure number="2">
              <part id="P1">
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>4</duration>
                    <voice>1</voice>
                    <type>whole</type>
                    <lyric number="1">
                       <syllabic>end</syllabic>
                       <text>B</text>
                    </lyric>
                 </note>
              </part>
           </measure>
           <measure number="3">
              <part id="P1">
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>4</duration>
                    <tie type="stop"/>
                    <tie type="start"/>
                    <voice>1</voice>
                    <type>whole</type>
                    <notations>
                       <tied type="stop"/>
                       <tied type="start"/>
                    </notations>
                    <lyric number="1">
                       <syllabic>end</syllabic>
                       <text>C</text>
                    </lyric>
                 </note>
              </part>
           </measure>
           <measure number="4">
              <part id="P1">
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>4</duration>
                    <tie type="start"/>
                    <voice>1</voice>
                    <type>whole</type>
                    <notations>
                       <tied type="start"/>
                    </notations>
                    <lyric number="1" name="verse">
                       <syllabic>end</syllabic>
                       <text>D</text>
                    </lyric>
                 </note>
              </part>
           </measure>
           <measure number="5">
              <part id="P1">
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>4</duration>
                    <tie type="stop"/>
                    <voice>1</voice>
                    <type>whole</type>
                    <notations>
                       <tied type="stop"/>
                    </notations>
                    <lyric number="1" name="verse">
                       <syllabic>end</syllabic>
                       <text>E</text>
                    </lyric>
                 </note>
                 <barline location="right">
                    <bar-style>light-heavy</bar-style>
                 </barline>
              </part>
           </measure>
        </score-timewise>
        """
    }
}
