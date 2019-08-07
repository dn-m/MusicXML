//
//  Timewise_02_Rests_B_PitchedRests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/7/19.
//

extension Timewise_02_Rests {
    var B_PitchedRests: String {
        """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise>
           <identification>
                    <miscellaneous>
                          <miscellaneous-field name="description">Rests can have
                                    explicit pitches, where they are displayed. The
                                    first rest uses no explicit position and should use
                                    the default position, all others are explicitly
                                    positioned somewhere else.</miscellaneous-field>
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
                                <divisions>96</divisions>
                                <key>
                       <fifths>0</fifths>
                    </key>
                                <time>
                       <beats>5</beats>
                       <beat-type>4</beat-type>
                    </time>
                                <staves>1</staves>
                                <clef number="1">
                       <sign>G</sign>
                       <line>2</line>
                    </clef>
                          </attributes>
                          <note>
                                <rest/>
                                <duration>96</duration>
                                <voice>1</voice>
                                <type>quarter</type>
                                <staff>1</staff>
                          </note>
                          <note>
                                <rest>
                       <display-step>E</display-step>
                       <display-octave>4</display-octave>
                    </rest>
                                <duration>96</duration>
                                <voice>1</voice>
                                <type>quarter</type>
                                <staff>1</staff>
                          </note>
                          <note>
                                <rest>
                       <display-step>F</display-step>
                       <display-octave>5</display-octave>
                    </rest>
                                <duration>96</duration>
                                <voice>1</voice>
                                <type>quarter</type>
                                <staff>1</staff>
                          </note>
                          <note>
                                <rest>
                       <display-step>A</display-step>
                       <display-octave>3</display-octave>
                    </rest>
                                <duration>96</duration>
                                <voice>1</voice>
                                <type>quarter</type>
                                <staff>1</staff>
                          </note>
                          <note>
                                <rest>
                       <display-step>C</display-step>
                       <display-octave>6</display-octave>
                    </rest>
                                <duration>96</duration>
                                <voice>1</voice>
                                <type>quarter</type>
                                <staff>1</staff>
                          </note>
                    </part>
           </measure>
        </score-timewise>
        """
    }
}
