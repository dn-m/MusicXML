//
//  Timewise_12_Clefs_B_NoKeyOrClef.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

extension Timewise_12_Clefs {
    var B_NoKeyOrClef: String {
        """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise version="2.0">
           <identification>
             <miscellaneous>
                   <miscellaneous-field name="description">A score without
                             any key or clef defined. The default (4/4 in treble
                             clef) should be used.</miscellaneous-field>
             </miscellaneous>
           </identification>
           <part-list>
             <score-part id="P0">
                   <part-name>Some Part</part-name>
             </score-part>
           </part-list>
           <measure number="1">
             <part id="P0">
               <attributes>
                   <divisions>1</divisions>
                   <time>
                     <beats>4</beats>
                     <beat-type>4</beat-type>
                   </time>
               </attributes>
               <note>
                   <pitch>
                     <step>C</step>
                     <octave>4</octave>
                   </pitch>
                   <duration>4</duration>
                   <voice>1</voice>
                   <type>whole</type>
               </note>
             </part>
           </measure>
           <measure number="2">
              <part id="P0">
                  <note>
                    <pitch>
                      <step>C</step>
                      <octave>4</octave>
                    </pitch>
                    <duration>4</duration>
                    <voice>1</voice>
                    <type>whole</type>
                  </note>
                </part>
           </measure>
        </score-timewise>
        """
    }
}
