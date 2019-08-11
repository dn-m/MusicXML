//
//  Timewise_33_Spanners_G_Slur_ChordedNotes.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/11/19.
//

extension Timewise_33_Spanners {
    var G_Slur_ChordedNotes: String {
        """
                <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise version="1.1">
           <identification>
              <miscellaneous>
                 <miscellaneous-field name="description">Slurs on chorded notes: Only the
                  first note of the chord should get the slur notation. Some
                  applications print out the slur for all notes -- these should be
                  ignored.</miscellaneous-field>
              </miscellaneous>
          </identification>
           <part-list>
              <score-part id="P1">
                 <part-name print-object="no">MusicXML Part</part-name>
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
                       <step>G</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <notations>
                       <slur number="1" placement="above" type="start"/>
                    </notations>
                 </note>
                 <note>
                    <chord/>
                    <pitch>
                       <step>C</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
                 <note>
                    <chord/>
                    <pitch>
                       <step>G</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
                 <note>
                    <pitch>
                       <step>A</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
                 <note>
                    <chord/>
                    <pitch>
                       <step>D</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
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
                       <slur number="1" type="stop"/>
                       <slur number="1" placement="above" type="start"/>
                    </notations>
                 </note>
                 <note>
                    <chord/>
                    <pitch>
                       <step>D</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <notations>
                       <slur number="1" placement="above" type="start"/>
                    </notations>
                 </note>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <notations>
                       <slur number="1" type="stop"/>
                    </notations>
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
