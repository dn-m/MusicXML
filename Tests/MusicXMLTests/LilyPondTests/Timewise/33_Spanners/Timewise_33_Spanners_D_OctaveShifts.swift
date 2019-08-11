//
//  Timewise_33_Spanners_D_OctaveShifts.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/11/19.
//

extension Timewise_33_Spanners {
    var D_OctaveShifts: String {
        """
                <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise>
           <identification>
              <miscellaneous>
                 <miscellaneous-field name="description">All types of octave shifts (15ma,
                    15mb, 8va, 8vb)</miscellaneous-field>
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
                    <divisions>8</divisions>
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
                       <step>A</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>4</duration>
                    <voice>1</voice>
                    <type>eighth</type>
                    <beam number="1">begin</beam>
                 </note>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>4</duration>
                    <voice>1</voice>
                    <type>eighth</type>
                    <beam number="1">continue</beam>
                 </note>
                 <direction>
                    <direction-type>
                       <octave-shift size="15" type="down"/>
                    </direction-type>
                    <offset>-4</offset>
                 </direction>
                 <note>
                    <pitch>
                       <step>A</step>
                       <octave>6</octave>
                    </pitch>
                    <duration>4</duration>
                    <voice>1</voice>
                    <type>eighth</type>
                    <beam number="1">continue</beam>
                 </note>
                 <direction>
                    <direction-type>
                       <octave-shift size="15" type="stop"/>
                    </direction-type>
                    <offset>-4</offset>
                 </direction>
                 <direction>
                    <direction-type>
                       <octave-shift size="15" type="up"/>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>3</octave>
                    </pitch>
                    <duration>4</duration>
                    <voice>1</voice>
                    <type>eighth</type>
                    <beam number="1">end</beam>
                 </note>
                 <note>
                    <pitch>
                       <step>B</step>
                       <octave>2</octave>
                    </pitch>
                    <duration>4</duration>
                    <voice>1</voice>
                    <type>eighth</type>
                    <beam number="1">begin</beam>
                 </note>
                 <direction>
                    <direction-type>
                       <octave-shift size="15" type="stop"/>
                    </direction-type>
                    <offset>-4</offset>
                 </direction>
                 <direction>
                    <direction-type>
                       <octave-shift size="8" type="down"/>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>A</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>4</duration>
                    <voice>1</voice>
                    <type>eighth</type>
                    <beam number="1">end</beam>
                 </note>
                 <note>
                    <pitch>
                       <step>A</step>
                       <octave>5</octave>
                    </pitch>
                    <duration>4</duration>
                    <voice>1</voice>
                    <type>eighth</type>
                    <beam number="1">begin</beam>
                 </note>
                 <direction>
                    <direction-type>
                       <octave-shift size="8" type="stop"/>
                    </direction-type>
                    <offset>-3</offset>
                 </direction>
                 <direction>
                    <direction-type>
                       <octave-shift size="8" type="up"/>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>B</step>
                       <octave>3</octave>
                    </pitch>
                    <duration>2</duration>
                    <voice>1</voice>
                    <type>16th</type>
                    <beam number="1">continue</beam>
                    <beam number="2">begin</beam>
                 </note>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>2</duration>
                    <voice>1</voice>
                    <type>16th</type>
                    <beam number="1">end</beam>
                    <beam number="2">end</beam>
                 </note>
                 <direction>
                    <direction-type>
                       <octave-shift size="8" type="stop"/>
                    </direction-type>
                    <offset>-2</offset>
                 </direction>
                 <barline location="right">
                    <bar-style>light-heavy</bar-style>
                 </barline>
              </part>
           </measure>
        </score-timewise>
        """
    }
}
