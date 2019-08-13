//
//  Timewise_21_Chords_A_Basic.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/13/19.
//

extension Timewise_21_Chords {
    var A_Basic: String {
        """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise>
           <identification>
                    <miscellaneous>
                          <miscellaneous-field name="description">One simple chord
                                    consisting of two notes.</miscellaneous-field>
                    </miscellaneous>
              </identification>
           <part-list>
                    <score-part id="P0">
                          <part-name>MusicXML Part</part-name>
                    </score-part>
              </part-list>
           <measure number="1">
              <part id="P0">
                          <attributes>
                                <divisions>960</divisions>
                                <time>
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
                                      <step>A</step>
                                      <octave>4</octave>
                                </pitch>
                                <duration>960</duration>
                                <voice>1</voice>
                                <type>quarter</type>
                          </note>
                          <note>
                                <chord/>
                                <pitch>
                                      <step>F</step>
                                      <octave>4</octave>
                                </pitch>
                                <duration>960</duration>
                                <voice>1</voice>
                                <type>quarter</type>
                          </note>
                          <note>
                                <rest/>
                                <duration>960</duration>
                                <voice>1</voice>
                                <type>quarter</type>
                          </note>
                    </part>
           </measure>
        </score-timewise>
        """
    }
}
