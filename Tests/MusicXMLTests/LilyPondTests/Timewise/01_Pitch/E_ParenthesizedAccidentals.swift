//
//  E_ParenthesizedAccidentals.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/17/18.
//

extension Timewise_01_Pitches {
    var E_ParenthesizedAccidentals: String {
        return """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise>
           <identification>
              <miscellaneous>
                 <miscellaneous-field name="description">Accidentals can be cautionary
                  or editorial. Each measure has a normal accidental, an editorial,
                  a cautionary and an editioal and cautionary accidental.</miscellaneous-field>
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
                       <step>D</step>
                       <alter>-1</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental>flat</accidental>
                 </note>
                 <note>
                    <pitch>
                       <step>D</step>
                       <alter>-1</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental editorial="yes">flat</accidental>
                 </note>
                 <note>
                    <pitch>
                       <step>D</step>
                       <alter>-1</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental cautionary="yes">flat</accidental>
                 </note>
                 <note>
                    <pitch>
                       <step>D</step>
                       <alter>-1</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental editorial="yes" cautionary="yes">flat</accidental>
                 </note>
              </part>
           </measure>
           <measure number="2">
              <part id="P1">
                 <note>
                    <pitch>
                       <step>C</step>
                       <alter>1</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental>sharp</accidental>
                 </note>
                 <note>
                    <pitch>
                       <step>C</step>
                       <alter>1</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental editorial="yes">sharp</accidental>
                 </note>
                 <note>
                    <pitch>
                       <step>C</step>
                       <alter>1</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental cautionary="yes">sharp</accidental>
                 </note>
                 <note>
                    <pitch>
                       <step>C</step>
                       <alter>1</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental editorial="yes" cautionary="yes">sharp</accidental>
                 </note>
              </part>
           </measure>
           <measure number="3">
              <part id="P1">
                 <note>
                    <pitch>
                       <step>D</step>
                       <alter>-2</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental>double-flat</accidental>
                 </note>
                 <note>
                    <pitch>
                       <step>D</step>
                       <alter>-2</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental editorial="yes">double-flat</accidental>
                 </note>
                 <note>
                    <pitch>
                       <step>D</step>
                       <alter>-2</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental cautionary="yes">double-flat</accidental>
                 </note>
                 <note>
                    <pitch>
                       <step>D</step>
                       <alter>-2</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental editorial="yes" cautionary="yes">double-flat</accidental>
                 </note>
              </part>
           </measure>
           <measure number="4">
              <part id="P1">
                 <note>
                    <pitch>
                       <step>C</step>
                       <alter>2</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental>double-sharp</accidental>
                 </note>
                 <note>
                    <pitch>
                       <step>C</step>
                       <alter>2</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental editorial="yes">double-sharp</accidental>
                 </note>
                 <note>
                    <pitch>
                       <step>C</step>
                       <alter>2</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental cautionary="yes">double-sharp</accidental>
                 </note>
                 <note>
                    <pitch>
                       <step>C</step>
                       <alter>2</alter>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <accidental editorial="yes" cautionary="yes">double-sharp</accidental>
                 </note>
              </part>
           </measure>
        </score-timewise>
        """
    }
}
