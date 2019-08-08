//
//  Timewise_03_Rhythm_D_DottedDurations_Factors.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

extension Timewise_03_Rhythm {
    var D_DottedDurations_Factors: String {
        """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise>
           <identification>
              <miscellaneous>
                 <miscellaneous-field name="description">Although uncommon, the divisions
                    of a quarter note can change somewhere in the middle of a MusicXML
                    file. Here, the first half measure uses a division of 1, which
                    then changes to 8 in the middle of the first measure and to 38
                    in the middle of the second measure.</miscellaneous-field>
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
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
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
                    <divisions>8</divisions>
                 </attributes>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>8</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>8</duration>
                    <voice>1</voice>
                    <type>quarter</type>
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
                    <duration>16</duration>
                    <voice>1</voice>
                    <type>half</type>
                 </note>
                 <attributes>
                    <divisions>38</divisions>
                 </attributes>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>76</duration>
                    <voice>1</voice>
                    <type>half</type>
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
