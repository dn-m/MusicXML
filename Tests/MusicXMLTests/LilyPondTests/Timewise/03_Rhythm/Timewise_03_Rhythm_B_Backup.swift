//
//  Timewise_03_Rhythm_B_Backup.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

extension Timewise_03_Rhythm {
    var B_Backup: String {
        """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise version="1.1">
           <identification>
              <miscellaneous>
                 <miscellaneous-field name="description">Two voices with a backup, that
                  does not jump to the beginning for the measure for voice 2, but
                  somewhere in the middle. Voice 2 thus won't have any notes or rests
                  for the first beat of the measures.</miscellaneous-field>
              </miscellaneous>
          </identification>
           <part-list>
              <score-part id="P1">
                 <part-name>Part 1</part-name>
              </score-part>
          </part-list>
           <measure number="1">
              <part id="P1">
                 <attributes>
                    <divisions>2</divisions>
                    <key>
                       <fifths>0</fifths>
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
                       <octave>4</octave>
                    </pitch>
                    <duration>2</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>2</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                 </note>
                 <backup>
                    <duration>2</duration>
                 </backup>
                 <note>
                    <pitch>
                       <step>A</step>
                       <octave>3</octave>
                    </pitch>
                    <duration>2</duration>
                    <voice>2</voice>
                    <type>quarter</type>
                 </note>
                 <note>
                    <pitch>
                       <step>A</step>
                       <octave>3</octave>
                    </pitch>
                    <duration>2</duration>
                    <voice>2</voice>
                    <type>quarter</type>
                 </note>
              </part>
           </measure>
        </score-timewise>
        """
    }
}
