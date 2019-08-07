//
//  Timewise_02_Rests_E_NoType.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/7/19.
//

extension Timewise_02_Rests {
    var E_NoType: String {
        """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise version="1.1">
           <identification>
              <miscellaneous>
                 <miscellaneous-field name="description">In some cases, a rest might
                  not have its type attribute set (this happens, for example, with
                  voices in Finale, where you don't manually insert a
                  rest).</miscellaneous-field>
              </miscellaneous>
          </identification>
           <part-list>
              <score-part id="P1">
                 <part-name>MusicXML Part</part-name>
              </score-part>
          </part-list>
           <measure number="0" implicit="yes">
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
                    <staves>2</staves>
                    <clef number="1">
                       <sign>G</sign>
                       <line>2</line>
                    </clef>
                    <clef number="2">
                       <sign>F</sign>
                       <line>4</line>
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
                    <staff>1</staff>
                 </note>
                 <backup>
                    <duration>1</duration>
                 </backup>
                 <note>
                    <rest/>
                    <duration>1</duration>
                    <voice>2</voice>
                    <staff>2</staff>
                 </note>
              </part>
           </measure>
           <measure number="1">
              <part id="P1">
                 <note>
                    <pitch>
                       <step>A</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>4</duration>
                    <voice>1</voice>
                    <type>whole</type>
                    <staff>1</staff>
                 </note>
                 <backup>
                    <duration>4</duration>
                 </backup>
                 <note>
                    <pitch>
                       <step>E</step>
                       <octave>3</octave>
                    </pitch>
                    <duration>4</duration>
                    <voice>2</voice>
                    <type>whole</type>
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
