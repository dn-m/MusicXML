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
        let expected = Direction([.wedge(Wedge(type: .stop)), .dynamics([Dynamics([.fff])])],
            placement: .below,
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
        let expected = Direction([.pedal(Pedal(type: .change))])
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
        let expected = Direction([.dashes(Dashes(type: .stop))])
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

    func testEyeglasses() throws {
        let xml = """
        <direction-type>
           <eyeglasses/>
        </direction-type>
        """
        let decoded = try XMLDecoder().decode(DirectionType.self, from: xml.data(using: .utf8)!)
        let expected = DirectionType.eyeglasses(EmptyPrintStyleAlign())
        XCTAssertEqual(decoded, expected)
    }

    func testSegno() throws {
        let xml = """
        <direction-type>
           <segno/>
        </direction-type>
        """
        let decoded = try XMLDecoder().decode(DirectionType.self, from: xml.data(using: .utf8)!)
        let expected = DirectionType.segno(EmptyPrintStyleAlign())
        XCTAssertEqual(decoded, expected)
    }

    func testCoda() throws {
        let xml = """
        <direction-type>
           <coda/>
        </direction-type>
        """
        let decoded = try XMLDecoder().decode(DirectionType.self, from: xml.data(using: .utf8)!)
        let expected = DirectionType.coda(EmptyPrintStyleAlign())
        XCTAssertEqual(decoded, expected)
    }

    func testRehearsal() throws {
        let xml = """
        <direction-type>
           <rehearsal enclosure="circle">Crc</rehearsal>
        </direction-type>
        """
        let decoded = try XMLDecoder().decode(DirectionType.self, from: xml.data(using: .utf8)!)
        let expected = DirectionType.rehearsal([FormattedText("Crc", enclosure: .circle)])
        XCTAssertEqual(decoded, expected)
    }
}
