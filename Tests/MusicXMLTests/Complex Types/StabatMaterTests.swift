//
//  StabatMaterTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/9/19.
//

import XCTest
import MusicXML
import XMLCoder

class StabatMaterTests: XCTestCase {

    func testSchubertStabatMater() throws {
        let xml = """
        <?xml version="1.0"?>
        <!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 0.6 Partwise//EN" "http://www.musicxml.org/dtds/partwise.dtd">
        <score-partwise>
            <identification>
                    <miscellaneous>
                            <miscellaneous-field name="description">Chords in the
                                second measure, after several ornaments in the first
                                measure and a p at the beginning of the second
                                measure.</miscellaneous-field>
                    </miscellaneous>
            </identification>
            <part-list>
                    <score-part id="P0">
                            <part-name>MusicXML Part</part-name>
                    </score-part>
            </part-list>
            <part id="P0">
                <measure number="1">
                <attributes>
                    <divisions>8</divisions>
                    <key>
                    <fifths>-4</fifths>
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
                <direction placement="above">
                    <direction-type>
                    <words font-weight="bold">Largo</words>
                    </direction-type>
                </direction>
                <direction placement="below">
                    <direction-type>
                    <dynamics>
                        <fp/>
                    </dynamics>
                    </direction-type>
                    <offset>3</offset>
                </direction>
                <note>
                    <pitch>
                    <step>F</step>
                    <octave>4</octave>
                    </pitch>
                    <duration>32</duration>
                    <voice>1</voice>
                    <type>whole</type>
                    <notations>
                    <articulations>
                        <accent placement="below"/>
                    </articulations>
                    <fermata type="upright"/>
                    </notations>
                </note>
                </measure>
                <!--=======================================================-->
                <measure number="2">
                <direction placement="below">
                    <direction-type>
                    <dynamics>
                        <p/>
                    </dynamics>
                    </direction-type>
                </direction>
                <note>
                    <pitch>
                    <step>F</step>
                    <octave>4</octave>
                    </pitch>
                    <duration>12</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <dot/>
                </note>
                <note>
                    <chord/>
                    <pitch>
                    <step>A</step>
                    <alter>-1</alter>
                    <octave>4</octave>
                    </pitch>
                    <duration>12</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <dot/>
                </note>
                <note>
                    <pitch>
                    <step>F</step>
                    <octave>4</octave>
                    </pitch>
                    <duration>4</duration>
                    <voice>1</voice>
                    <type>eighth</type>
                </note>
                <note>
                    <chord/>
                    <pitch>
                    <step>A</step>
                    <alter>-1</alter>
                    <octave>4</octave>
                    </pitch>
                    <duration>4</duration>
                    <voice>1</voice>
                    <type>eighth</type>
                </note>
                <note>
                    <pitch>
                    <step>G</step>
                    <octave>4</octave>
                    </pitch>
                    <duration>8</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                </note>
                <note>
                    <chord/>
                    <pitch>
                    <step>B</step>
                    <alter>-1</alter>
                    <octave>4</octave>
                    </pitch>
                    <duration>8</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                </note>
                <note>
                    <pitch>
                    <step>G</step>
                    <octave>4</octave>
                    </pitch>
                    <duration>8</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                </note>
                <note>
                    <chord/>
                    <pitch>
                    <step>B</step>
                    <alter>-1</alter>
                    <octave>4</octave>
                    </pitch>
                    <duration>8</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                </note>
                </measure>
            </part>
        </score-partwise>
        """
    }

    func testWordsDirection() throws {
        let xml = """
        <direction placement="above">
            <direction-type>
                <words font-weight="bold">Largo</words>
            </direction-type>
        </direction>
        """
        let decoded = try XMLDecoder().decode(Direction.self, from: xml.data(using: .utf8)!)
        let expected = Direction(
            placement: .above,
            directionType: .words(
                FormattedText("Largo", printStyle: PrintStyle(font: Font(weight: .bold)))
            )
        )
        XCTAssertEqual(decoded, expected)
    }

    func testWordsDirectionType() throws {
        let xml = """
        <direction-type>
            <words font-weight="bold">Largo</words>
        </direction-type>
        """
        let decoded = try XMLDecoder().decode(DirectionType.self, from: xml.data(using: .utf8)!)
        let expected = DirectionType.words(
            FormattedText("Largo", printStyle: PrintStyle(font: Font(weight: .bold)))
        )
        XCTAssertEqual(decoded, expected)
    }
}
