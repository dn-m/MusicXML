//
//  DirectionsTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/11/19.
//

import XCTest
import MusicXML
import XMLCoder

class DirectionsTests: XCTestCase {

    func testDirections() throws {
        let xml = """
        <?xml version="1.0" encoding="UTF-8" standalone="no"?>
        <!DOCTYPE score-timewise
          PUBLIC "-//Recordare//DTD MusicXML 2.0 Timewise//EN" "http://www.musicxml.org/dtds/timewise.dtd">
        <score-timewise version="2.0">
           <movement-title>MusicXML directions (attached to staff)</movement-title>
           <identification>
              <miscellaneous>
                 <miscellaneous-field name="description">All &lt;direction&gt; elements
                  defined in MusicXML. The lyrics for each note describes the direction
                  element assigned to that note.</miscellaneous-field>
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
                 <direction placement="below">
                    <direction-type>
                       <rehearsal>A</rehearsal>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>reh.A (def=sq.)</text>
                    </lyric>
                 </note>
                 <direction placement="above">
                    <direction-type>
                       <rehearsal enclosure="none">B</rehearsal>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>reh.B (none)</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <rehearsal enclosure="square">Test</rehearsal>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>reh.Test (sq.)</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <rehearsal enclosure="circle">Crc</rehearsal>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>reh.Crc (crc.)</text>
                    </lyric>
                 </note>
              </part>
           </measure>
           <measure number="2">
              <part id="P1">
                 <direction>
                    <direction-type>
                       <segno/>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>Segno</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <coda/>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>Coda</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <words>words</words>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>Words</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <eyeglasses/>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>Eyegl.</text>
                    </lyric>
                 </note>
              </part>
           </measure>
           <measure number="3">
              <part id="P1">
                 <direction>
                    <direction-type>
                       <dynamics>
                          <p/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>p</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <pp/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>pp</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <ppp/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>ppp</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <pppp/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>pppp</text>
                    </lyric>
                 </note>
              </part>
           </measure>
           <measure number="4">
              <part id="P1">
                 <direction>
                    <direction-type>
                       <dynamics>
                          <ppppp/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>ppppp</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <pppppp/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>pppppp</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <f/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>f</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <ff/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>ff</text>
                    </lyric>
                 </note>
              </part>
           </measure>
           <measure number="5">
              <part id="P1">
                 <direction>
                    <direction-type>
                       <dynamics>
                          <fff/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>fff</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <ffff/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>ffff</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <fffff/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>fffff</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <ffffff/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>ffffff</text>
                    </lyric>
                 </note>
              </part>
           </measure>
           <measure number="6">
              <part id="P1">
                 <direction>
                    <direction-type>
                       <dynamics>
                          <mp/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>mp</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <mf/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>mf</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <sf/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>sf</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <sfp/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>sfp</text>
                    </lyric>
                 </note>
              </part>
           </measure>
           <measure number="7">
              <part id="P1">
                 <direction>
                    <direction-type>
                       <dynamics>
                          <sfpp/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>sfpp</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <fp/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>fp</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <rf/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>rf</text>
                    </lyric>
                 </note>
                 <direction>
                    <direction-type>
                       <dynamics>
                          <rfz/>
                       </dynamics>
                    </direction-type>
                 </direction>
                 <note>
                    <pitch>
                       <step>C</step>
                       <octave>4</octave>
                    </pitch>
                    <duration>1</duration>
                    <voice>1</voice>
                    <type>quarter</type>
                    <lyric number="1">
                       <text>rfz</text>
                    </lyric>
                 </note>
              </part>
           </measure>
        </score-timewise>
        """
        let _ = try MusicXML(string: xml)
    }

    func testMeasure8() throws {
        let xml = """
                   <measure number="8">
           <part id="P1">
              <direction>
                 <direction-type>
                    <dynamics>
                       <sfz/>
                    </dynamics>
                 </direction-type>
              </direction>
              <note>
                 <pitch>
                    <step>C</step>
                    <octave>4</octave>
                 </pitch>
                 <duration>1</duration>
                 <voice>1</voice>
                 <type>quarter</type>
                 <lyric number="1">
                    <text>sfz</text>
                 </lyric>
              </note>
              <direction>
                 <direction-type>
                    <dynamics>
                       <sffz/>
                    </dynamics>
                 </direction-type>
              </direction>
              <note>
                 <pitch>
                    <step>C</step>
                    <octave>4</octave>
                 </pitch>
                 <duration>1</duration>
                 <voice>1</voice>
                 <type>quarter</type>
                 <lyric number="1">
                    <text>sffz</text>
                 </lyric>
              </note>
              <direction>
                 <direction-type>
                    <dynamics>
                       <fz/>
                    </dynamics>
                 </direction-type>
              </direction>
              <note>
                 <pitch>
                    <step>C</step>
                    <octave>4</octave>
                 </pitch>
                 <duration>1</duration>
                 <voice>1</voice>
                 <type>quarter</type>
                 <lyric number="1">
                    <text>fz</text>
                 </lyric>
              </note>
              <direction>
                 <direction-type>
                    <dynamics>
                       <other-dynamics>abc-ffz</other-dynamics>
                    </dynamics>
                 </direction-type>
              </direction>
              <note>
                 <pitch>
                    <step>C</step>
                    <octave>4</octave>
                 </pitch>
                 <duration>1</duration>
                 <voice>1</voice>
                 <type>quarter</type>
                 <lyric number="1">
                    <text>abc-ffz (oth.)</text>
                 </lyric>
              </note>
           </part>
        </measure>
        """
        let decoded = try XMLDecoder().decode(Timewise.Measure.self, from: xml.data(using: .utf8)!)

    }

    func testNoteWithLyric() throws {
        let xml = """
        <note>
           <rest/>
           <duration>1</duration>
           <voice>1</voice>
           <type>quarter</type>
           <lyric number="1">
              <text>subp</text>
           </lyric>
        </note>
        """
        let decoded = try XMLDecoder().decode(Note.self, from: xml.data(using: .utf8)!)
        let expected = Note(
            kind: .normal(
                Note.Normal(
                    pitchUnpitchedOrRest: PitchUnpitchedOrRest.rest(Rest()),
                    duration: 1
                )
            ),
            voice: "1",
            type: NoteType(.quarter),
            lyrics: [
                Lyric(kind: .verbal(Lyric.Verbal(text: "subp")), number: "1")
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testLyricNumberText() throws {
        let xml = """
        <lyric number="1">
            <text>subp</text>
        </lyric>
        """
        let decoded = try XMLDecoder().decode(Lyric.self, from: xml.data(using: .utf8)!)
        let expected = Lyric(kind: .verbal(Lyric.Verbal(text: "subp")), number: "1")
        XCTAssertEqual(decoded, expected)
    }

    func testLyricSyllabic() throws {
        let xml = """
        <lyric number="1">
           <syllabic>end</syllabic>
           <text>to fff</text>
        </lyric>
        """
        let decoded = try XMLDecoder().decode(Lyric.self, from: xml.data(using: .utf8)!)
        let expected = Lyric(
            kind: .verbal(Lyric.Verbal(text: "to fff", syllabic: .end)),
            number: "1"
        )
        XCTAssertEqual(decoded, expected)
    }

    func testDirectionWedgeAndDynamic() throws {
        let xml = """
        <direction placement="below">
           <direction-type>
              <wedge type="stop"/>
           </direction-type>
           <direction-type>
              <dynamics>
                 <fff/>
              </dynamics>
           </direction-type>
           <offset>2</offset>
        </direction>
        """
        let decoded = try XMLDecoder().decode(Direction.self, from: xml.data(using: .utf8)!)
        let expected = Direction(
            placement: .below,
            directionType: [
                .wedge(Wedge(type: .stop)),
                .dynamics(Dynamics([.fff]))
            ],
            offset: 2
        )
        XCTAssertEqual(decoded, expected)
    }

    func testFormattedText() throws {
        let xml = """
        <words default-y="-80"
            font-family="Times New Roman"
            font-size="10.25"
            font-style="italic">subito</words>
        """
        let decoded = try XMLDecoder().decode(FormattedText.self, from: xml.data(using: .utf8)!)
        let expected = FormattedText("subito",
            printStyle: PrintStyle(
                position: Position(defaultY: -80),
                font: Font(
                    family: "Times New Roman",
                    style: .italic,
                    size: 10.25
                )
            )
        )
        XCTAssertEqual(decoded, expected)
    }

    func testScordaturaDirectionType() throws {
        let xml = """
        <direction-type>
           <scordatura>
              <accord string="3">
                 <tuning-step>C</tuning-step>
                 <tuning-octave>3</tuning-octave>
              </accord>
              <accord string="2">
                 <tuning-step>G</tuning-step>
                 <tuning-octave>5</tuning-octave>
              </accord>
              <accord string="1">
                 <tuning-step>E</tuning-step>
                 <tuning-octave>5</tuning-octave>
              </accord>
           </scordatura>
        </direction-type>
        """
        let decoded = try XMLDecoder().decode(DirectionType.self, from: xml.data(using: .utf8)!)
        let expected = DirectionType.scordatura(
            Scordatura([
                Accord(string: 3, tuningStep: .c, tuningOctave: 3),
                Accord(string: 2, tuningStep: .g, tuningOctave: 5),
                Accord(string: 1, tuningStep: .e, tuningOctave: 5),
            ])
        )
        XCTAssertEqual(decoded, expected)
    }

    func testScordatura() throws {
        let xml = """
        <scordatura>
            <accord string="3">
                <tuning-step>C</tuning-step>
                <tuning-octave>3</tuning-octave>
            </accord>
            <accord string="2">
                <tuning-step>G</tuning-step>
                <tuning-octave>5</tuning-octave>
            </accord>
            <accord string="1">
                <tuning-step>E</tuning-step>
                <tuning-octave>5</tuning-octave>
            </accord>
        </scordatura>
        """
        let decoded = try XMLDecoder().decode(Scordatura.self, from: xml.data(using: .utf8)!)
        let expected = Scordatura([
            Accord(string: 3, tuningStep: .c, tuningOctave: 3),
            Accord(string: 2, tuningStep: .g, tuningOctave: 5),
            Accord(string: 1, tuningStep: .e, tuningOctave: 5),
        ])
        XCTAssertEqual(decoded, expected)
    }

    func testHarpPedalsDirectionType() throws {
        let xml = """
        <direction-type>
           <harp-pedals>
              <pedal-tuning>
                 <pedal-step>D</pedal-step>
                 <pedal-alter>0</pedal-alter>
              </pedal-tuning>
              <pedal-tuning>
                 <pedal-step>C</pedal-step>
                 <pedal-alter>-1</pedal-alter>
              </pedal-tuning>
              <pedal-tuning>
                 <pedal-step>B</pedal-step>
                 <pedal-alter>-1</pedal-alter>
              </pedal-tuning>
              <pedal-tuning>
                 <pedal-step>E</pedal-step>
                 <pedal-alter>0</pedal-alter>
              </pedal-tuning>
              <pedal-tuning>
                 <pedal-step>F</pedal-step>
                 <pedal-alter>0</pedal-alter>
              </pedal-tuning>
              <pedal-tuning>
                 <pedal-step>G</pedal-step>
                 <pedal-alter>1</pedal-alter>
              </pedal-tuning>
              <pedal-tuning>
                 <pedal-step>A</pedal-step>
                 <pedal-alter>-1</pedal-alter>
              </pedal-tuning>
           </harp-pedals>
        </direction-type>
        """
        let decoded = try XMLDecoder().decode(DirectionType.self, from: xml.data(using: .utf8)!)
        let expected = DirectionType.harpPedals(
            HarpPedals([
                PedalTuning(step: .d, alter: 0),
                PedalTuning(step: .c, alter: -1),
                PedalTuning(step: .b, alter: -1),
                PedalTuning(step: .e, alter: 0),
                PedalTuning(step: .f, alter: 0),
                PedalTuning(step: .g, alter: 1),
                PedalTuning(step: .a, alter: -1),
            ])
        )
        XCTAssertEqual(decoded, expected)
    }

    func testHarpPedals() throws {
        let xml = """
        <harp-pedals>
           <pedal-tuning>
              <pedal-step>D</pedal-step>
              <pedal-alter>0</pedal-alter>
           </pedal-tuning>
           <pedal-tuning>
              <pedal-step>C</pedal-step>
              <pedal-alter>-1</pedal-alter>
           </pedal-tuning>
           <pedal-tuning>
              <pedal-step>B</pedal-step>
              <pedal-alter>-1</pedal-alter>
           </pedal-tuning>
           <pedal-tuning>
              <pedal-step>E</pedal-step>
              <pedal-alter>0</pedal-alter>
           </pedal-tuning>
           <pedal-tuning>
              <pedal-step>F</pedal-step>
              <pedal-alter>0</pedal-alter>
           </pedal-tuning>
           <pedal-tuning>
              <pedal-step>G</pedal-step>
              <pedal-alter>1</pedal-alter>
           </pedal-tuning>
           <pedal-tuning>
              <pedal-step>A</pedal-step>
              <pedal-alter>-1</pedal-alter>
           </pedal-tuning>
        </harp-pedals>
        """
        let decoded = try XMLDecoder().decode(HarpPedals.self, from: xml.data(using: .utf8)!)
        let expected = HarpPedals([
            PedalTuning(step: .d, alter: 0),
            PedalTuning(step: .c, alter: -1),
            PedalTuning(step: .b, alter: -1),
            PedalTuning(step: .e, alter: 0),
            PedalTuning(step: .f, alter: 0),
            PedalTuning(step: .g, alter: 1),
            PedalTuning(step: .a, alter: -1),
        ])
        XCTAssertEqual(decoded, expected)
    }

    func testPedalDirection() throws {
        let xml = """
        <direction>
           <direction-type>
              <pedal type="change"/>
           </direction-type>
        </direction>
        """
        let decoded = try XMLDecoder().decode(Direction.self, from: xml.data(using: .utf8)!)
        let expected = Direction(directionType: [.pedal(Pedal(type: .change))])
        XCTAssertEqual(decoded, expected)
    }

    func testPedalChange() throws {
        let xml = """
        <pedal type="change"/>
        """
        let decoded = try XMLDecoder().decode(Pedal.self, from: xml.data(using: .utf8)!)
        let expected = Pedal(type: .change)
        XCTAssertEqual(decoded, expected)
    }

    func testDashesDirection() throws {
        let xml = """
        <direction>
           <direction-type>
              <dashes type="stop"/>
           </direction-type>
        </direction>
        """
        let decoded = try XMLDecoder().decode(Direction.self, from: xml.data(using: .utf8)!)
        let expected = Direction(directionType: [.dashes(Dashes(type: .stop))])
        XCTAssertEqual(decoded, expected)
    }

    func testDashesStop() throws {
        let xml = """
        <dashes type="stop"/>
        """
        let decoded = try XMLDecoder().decode(Dashes.self, from: xml.data(using: .utf8)!)
        let expected = Dashes(type: .stop)
        XCTAssertEqual(decoded, expected)
    }

    func testOtherDynamics() throws {
        let xml = """
        <dynamics>
           <other-dynamics>abc-ffz</other-dynamics>
        </dynamics>
        """
        let decoded = try XMLDecoder().decode(Dynamics.self, from: xml.data(using: .utf8)!)
        let expected = Dynamics([.other("abc-ffz")])
        XCTAssertEqual(decoded, expected)
    }
}
