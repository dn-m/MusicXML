//
//  C_NoVoiceElement.swift
//  MusicXMLTests
//
//  Created by James Bean on 12/17/18.
//

extension Timewise_01_Pitches {
    var C_NoVoiceElement: String {
        return """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise version="2.0">
           <identification>
              <miscellaneous>
                 <miscellaneous-field name="description">The &lt;voice&gt; element
                of notes is optional in MusicXML (although Dolet always writes it out).
                Here, there is one note with lyrics, but without a voice assigned. It
                should still be correctly converted.</miscellaneous-field>
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
                    <divisions>4</divisions>
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
                    <duration>16</duration>
                    <type>whole</type>
                    <lyric number="1">
                       <syllabic>single</syllabic>
                       <text>A</text>
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
