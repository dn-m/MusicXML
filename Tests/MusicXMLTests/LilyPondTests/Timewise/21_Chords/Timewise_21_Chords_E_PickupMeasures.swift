//
//  Timewise_21_Chords_E_PickupMeasures.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/13/19.
//

extension Timewise_21_Chords {
    var E_PickupMeasures: String {
        """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise version="2.0">
           <identification>
              <miscellaneous>
                 <miscellaneous-field name="description">Check for proper chord detection
                  after a pickup measure (i.e. the first beat of the measure is not
                  aligned with multiples of the time signature)!</miscellaneous-field>
              </miscellaneous>
          </identification>
           <part-list>
                <score-part id="P2">
                    <part-name>MusicXML Part</part-name>
                </score-part>
            </part-list>
           <measure number="0" implicit="yes">
              <part id="P2">
                    <attributes>
                        <divisions>1</divisions>
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
                </part>
           </measure>
           <measure number="1">
              <part id="P2">
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
                        <chord/>
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
                            <step>F</step>
                            <octave>4</octave>
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
                    <note>
                        <chord/>
                        <pitch>
                            <step>A</step>
                            <octave>4</octave>
                        </pitch>
                        <duration>1</duration>
                        <voice>1</voice>
                        <type>quarter</type>
                    </note>
                </part>
           </measure>
        </score-timewise>
        """
    }
}