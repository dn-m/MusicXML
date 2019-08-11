//
//  Partwise_33_Spanners_B_Tie.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/11/19.
//

extension Partwise_33_Spanners {
    var B_Tie: String {
        """
        <?xml version="1.0" encoding="ISO-8859-1" standalone="no"?>
        <!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 0.6b Partwise//EN"
         "http://www.musicxml.org/dtds/partwise.dtd">
        <score-partwise>
            <identification>
                <miscellaneous>
                    <miscellaneous-field name="description">Two simple tied whole notes</miscellaneous-field>
                </miscellaneous>
            </identification>
            <part-list>
                <score-part id="P1"><part-name></part-name></score-part>
            </part-list>
            <part id="P1">
                <measure number="1">
                    <attributes>
                        <divisions>1</divisions>
                        <key><fifths>0</fifths></key>
                        <time><beats>4</beats><beat-type>4</beat-type></time>
                        <staves>1</staves>
                        <clef number="1"><sign>G</sign><line>2</line></clef>
                    </attributes>
                    <note>
                        <pitch><step>F</step><octave>4</octave></pitch>
                        <duration>4</duration>
                        <tie type="start"/>
                        <voice>1</voice>
                        <type>whole</type>
                        <notations><tied type="start"/></notations>
                    </note>
                </measure>
                <measure number="2">
                    <note>
                        <pitch><step>F</step><octave>4</octave></pitch>
                        <duration>4</duration>
                        <tie type="stop"/>
                        <voice>1</voice>
                        <type>whole</type>
                        <notations><tied type="stop"/></notations>
                    </note>
                </measure>
            </part>
        </score-partwise>
        """
    }
}
