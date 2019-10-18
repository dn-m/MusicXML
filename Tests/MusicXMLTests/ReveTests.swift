//
//  ReveTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 10/16/19.
//

import XCTest
import XMLCoder
import MusicXML

class ReveTests: XCTestCase {

    func testIdentification() throws {
        let xml = """
        <identification>
          <creator type="composer">Gabriel Fauré</creator>
          <rights>Copyright © 2002 MakeMusic, Inc.</rights>
          <encoding>
            <software>Finale v25 for Mac</software>
            <encoding-date>2017-12-15</encoding-date>
            <supports attribute="new-system" element="print" type="yes" value="yes"/>
            <supports attribute="new-page" element="print" type="yes" value="yes"/>
            <supports element="accidental" type="yes"/>
            <supports element="beam" type="yes"/>
            <supports element="stem" type="yes"/>
          </encoding>
        </identification>
        """
        let decoded = try MusicXMLDecoder().decode(Identification.self, from: xml)
        let expected = Identification(
            creators: [Creator("Gabriel Fauré", type: "composer")],
            rights: [Rights("Copyright © 2002 MakeMusic, Inc.")],
            encoding: Encoding([
                .software("Finale v25 for Mac"),
                .date("2017-12-15"),
                .supports(
                    Supports(attribute: "new-system", element: "print", type: true, value: "yes")
                ),
                .supports(
                    Supports(attribute: "new-page", element: "print", type: true, value: "yes")
                ),
                .supports(Supports(element: "accidental", type: true)),
                .supports(Supports(element: "beam", type: true)),
                .supports(Supports(element: "stem", type: true))
            ])
        )
        XCTAssertEqual(decoded, expected)
    }

    func testRights() throws {
        let xml = """
        <rights>Copyright © 2002 MakeMusic, Inc.</rights>
        """
        let decoded = try MusicXMLDecoder().decode(Rights.self, from: xml)
        let expected = Rights("Copyright © 2002 MakeMusic, Inc.")
        XCTAssertEqual(decoded, expected)
    }

    func testEncoding() throws {
        let xml = """
        <encoding>
          <software>Finale v25 for Mac</software>
          <encoding-date>2017-12-15</encoding-date>
          <supports attribute="new-system" element="print" type="yes" value="yes"/>
          <supports attribute="new-page" element="print" type="yes" value="yes"/>
          <supports element="accidental" type="yes"/>
          <supports element="beam" type="yes"/>
          <supports element="stem" type="yes"/>
        </encoding>
        """
        let decoded = try MusicXMLDecoder().decode(Encoding.self, from: xml)
        let expected = Encoding([
            .software("Finale v25 for Mac"),
            .date("2017-12-15"),
            .supports(
                Supports(attribute: "new-system", element: "print", type: true, value: "yes")
            ),
            .supports(Supports(attribute: "new-page", element: "print", type: true, value: "yes")),
            .supports(Supports(element: "accidental", type: true)),
            .supports(Supports(element: "beam", type: true)),
            .supports(Supports(element: "stem", type: true))
        ])
        XCTAssertEqual(decoded, expected)
    }

    func testSupportsAttributeElementTypeValue() throws {
        let xml = """
        <supports attribute="new-system" element="print" type="yes" value="yes"/>
        """
        let decoded = try MusicXMLDecoder().decode(Supports.self, from: xml)
        let expected = Supports(
            attribute: "new-system",
            element: "print",
            type: true,
            value: "yes"
        )
        XCTAssertEqual(decoded, expected)
    }

    func testSupportsElementType() throws {
        let xml = """
        <supports element="beam" type="yes"/>
        """
        let decoded = try MusicXMLDecoder().decode(Supports.self, from: xml)
        let expected = Supports(element: "beam", type: true)
        XCTAssertEqual(decoded, expected)
    }

    func testDefaults() throws {
        let xml = """
        <defaults>
            <scaling>
                <millimeters>6.35</millimeters>
                <tenths>40</tenths>
            </scaling>
            <page-layout>
                <page-height>1760</page-height>
                <page-width>1360</page-width>
                <page-margins type="both">
                <left-margin>80</left-margin>
                <right-margin>80</right-margin>
                <top-margin>80</top-margin>
                <bottom-margin>80</bottom-margin>
                </page-margins>
            </page-layout>
            <system-layout>
                <system-margins>
                <left-margin>0</left-margin>
                <right-margin>0</right-margin>
                </system-margins>
                <system-distance>127</system-distance>
                <top-system-distance>127</top-system-distance>
            </system-layout>
            <staff-layout>
                <staff-distance>80</staff-distance>
            </staff-layout>
            <appearance>
                <line-width type="stem">1.25</line-width>
                <line-width type="beam">5</line-width>
                <line-width type="staff">0.8333</line-width>
                <line-width type="light barline">2.0833</line-width>
                <line-width type="heavy barline">6.6667</line-width>
                <line-width type="leger">1.25</line-width>
                <line-width type="ending">0.7682</line-width>
                <line-width type="wedge">0.957</line-width>
                <line-width type="enclosure">1.6667</line-width>
                <line-width type="tuplet bracket">1.3542</line-width>
                <note-size type="grace">66</note-size>
                <note-size type="cue">66</note-size>
                <distance type="hyphen">60</distance>
                <distance type="beam">8</distance>
            </appearance>
            <music-font font-family="Maestro,engraved" font-size="18"/>
            <word-font font-family="Times New Roman" font-size="8.25"/>
            <lyric-font font-family="Times New Roman" font-size="10"/>
        </defaults>
        """
        let decoded = try MusicXMLDecoder().decode(Defaults.self, from: xml)
        let expected = Defaults(
            scaling: Scaling(millimeters: 6.35, tenths: 40),
            pageLayout: PageLayout(
                height: 1760,
                width: 1360,
                margins: [
                    PageMargins(type: .both, left: 80, right: 80, top: 80, bottom: 80)
                ]
            ),
            systemLayout: SystemLayout(
                margins: SystemMargins(left: 0, right: 0),
                distance: 127,
                topSystemDistance: 127
            ),
            staffLayout: StaffLayout(staffDistance: 80),
            appearance: Appearance(
                lineWidths: [
                    LineWidth(1.25, type: .stem),
                    LineWidth(5, type: .beam),
                    LineWidth(0.8333, type: .staff),
                    LineWidth(2.0833, type: .lightBarline),
                    LineWidth(6.6667, type: .heavyBarline),
                    LineWidth(1.25, type: .leger),
                    LineWidth(0.7682, type: .ending),
                    LineWidth(0.957, type: .wedge),
                    LineWidth(1.6667, type: .enclosure),
                    LineWidth(1.3542, type: .tupletBracket),
                ],
                noteSizes: [
                    NoteSize(66, type: .grace),
                    NoteSize(66, type: .cue),
                ],
                distances: [
                    Distance(60, type: .hyphen),
                    Distance(8, type: .beam),
                ]
            ),
            musicFont: Font(family: "Maestro,engraved", size: 18),
            wordFont: Font(family: "Times New Roman", size: 8.25),
            lyricFonts: [
                LyricFont(Font(family: "Times New Roman", size: 10))
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testScaling() throws {
        let xml = """
        <scaling>
            <millimeters>6.35</millimeters>
            <tenths>40</tenths>
        </scaling>
        """
        let decoded = try MusicXMLDecoder().decode(Scaling.self, from: xml)
        let expected = Scaling(millimeters: 6.35, tenths: 40)
        XCTAssertEqual(decoded, expected)
    }

    func testPageLayout() throws {
        let xml = """
        <page-layout>
            <page-height>1760</page-height>
            <page-width>1360</page-width>
            <page-margins type="both">
                <left-margin>80</left-margin>
                <right-margin>80</right-margin>
                <top-margin>80</top-margin>
                <bottom-margin>80</bottom-margin>
            </page-margins>
        </page-layout>
        """
        let decoded = try MusicXMLDecoder().decode(PageLayout.self, from: xml)
        let expected = PageLayout(
            height: 1760,
            width: 1360,
            margins: [
                PageMargins(type: .both, left: 80, right: 80, top: 80, bottom: 80)
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testSystemLayout() throws {
        let xml = """
        <system-layout>
            <system-margins>
                <left-margin>0</left-margin>
                <right-margin>0</right-margin>
            </system-margins>
            <system-distance>127</system-distance>
            <top-system-distance>127</top-system-distance>
        </system-layout>
        """
        let decoded = try MusicXMLDecoder().decode(SystemLayout.self, from: xml)
        let expected = SystemLayout(
            margins: SystemMargins(left: 0, right: 0),
            distance: 127,
            topSystemDistance: 127
        )
        XCTAssertEqual(decoded, expected)
    }

    func testSystemLayout2() throws {
        let xml = """
        <system-layout>
            <system-margins>
              <left-margin>3</left-margin>
              <right-margin>0</right-margin>
            </system-margins>
            <top-system-distance>280</top-system-distance>
          </system-layout>
        """
        let decoded = try MusicXMLDecoder().decode(SystemLayout.self, from: xml)
        let expected = SystemLayout(
            margins: SystemMargins(left: 3, right: 0),
            topSystemDistance: 280
        )
        XCTAssertEqual(decoded, expected)
    }

    func testStaffLayout() throws {
        let xml = """
        <staff-layout>
            <staff-distance>80</staff-distance>
        </staff-layout>
        """
        let decoded = try MusicXMLDecoder().decode(StaffLayout.self, from: xml)
        let expected = StaffLayout(staffDistance: 80)
        XCTAssertEqual(decoded, expected)
    }

    func testAppearance() throws {
        let xml = """
        <appearance>
            <line-width type="stem">1.25</line-width>
            <line-width type="beam">5</line-width>
            <line-width type="staff">0.8333</line-width>
            <line-width type="light barline">2.0833</line-width>
            <line-width type="heavy barline">6.6667</line-width>
            <line-width type="leger">1.25</line-width>
            <line-width type="ending">0.7682</line-width>
            <line-width type="wedge">0.957</line-width>
            <line-width type="enclosure">1.6667</line-width>
            <line-width type="tuplet bracket">1.3542</line-width>
            <note-size type="grace">66</note-size>
            <note-size type="cue">66</note-size>
            <distance type="hyphen">60</distance>
            <distance type="beam">8</distance>
        </appearance>
        """
        let decoded = try MusicXMLDecoder().decode(Appearance.self, from: xml)
        let expected = Appearance(
            lineWidths: [
                LineWidth(1.25, type: .stem),
                LineWidth(5, type: .beam),
                LineWidth(0.8333, type: .staff),
                LineWidth(2.0833, type: .lightBarline),
                LineWidth(6.6667, type: .heavyBarline),
                LineWidth(1.25, type: .leger),
                LineWidth(0.7682, type: .ending),
                LineWidth(0.957, type: .wedge),
                LineWidth(1.6667, type: .enclosure),
                LineWidth(1.3542, type: .tupletBracket),
            ],
            noteSizes: [
                NoteSize(66, type: .grace),
                NoteSize(66, type: .cue),
            ],
            distances: [
                Distance(60, type: .hyphen),
                Distance(8, type: .beam),

            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testMusicFont() throws {
        let xml = """
        <music-font font-family="Maestro,engraved" font-size="18"/>
        """
        let decoded = try MusicXMLDecoder().decode(Font.self, from: xml)
        let expected = Font(family: "Maestro,engraved", size: 18)
        XCTAssertEqual(decoded, expected)
    }

    func testWordFont() throws {
        let xml = """
        <word-font font-family="Times New Roman" font-size="8.25"/>
        """
        let decoded = try MusicXMLDecoder().decode(Font.self, from: xml)
        let expected = Font(family: "Times New Roman", size: 8.25)
        XCTAssertEqual(decoded, expected)
    }

    func testLyricFonts() throws {
        let xml = """
        <container>
            <lyric-font font-family="Times New Roman" font-size="10"/>
        </container>
        """
        let decoded = try MusicXMLDecoder().decode([LyricFont].self, from: xml)
        let expected = [LyricFont(Font(family: "Times New Roman", size: 10))]
        XCTAssertEqual(decoded, expected)
    }

    func testPartListDecoding() throws {
        let xml = """
        <part-list>
            <score-part id="P1">
                <part-name print-object="no">Voice</part-name>
                <score-instrument id="P1-I14">
                <instrument-name>Choir Aahs</instrument-name>
                <instrument-sound>voice.vocals</instrument-sound>
                <solo/>
                </score-instrument>
                <midi-instrument id="P1-I14">
                <midi-channel>1</midi-channel>
                <midi-program>53</midi-program>
                <volume>80</volume>
                <pan>0</pan>
                </midi-instrument>
            </score-part>
            <score-part id="P2">
                <part-name print-object="no">Piano</part-name>
                <score-instrument id="P2-I1">
                <instrument-name>Grand Piano</instrument-name>
                <instrument-sound>keyboard.piano</instrument-sound>
                </score-instrument>
                <midi-instrument id="P2-I1">
                <midi-channel>2</midi-channel>
                <midi-program>1</midi-program>
                <volume>80</volume>
                <pan>0</pan>
                </midi-instrument>
            </score-part>
        </part-list>
        """
        let _ = try MusicXMLDecoder().decode(PartList.self, from: xml)
    }

    func testPrint() throws {
        let xml = """
        <print>
          <system-layout>
            <system-margins>
              <left-margin>3</left-margin>
              <right-margin>0</right-margin>
            </system-margins>
            <top-system-distance>280</top-system-distance>
          </system-layout>
          <measure-numbering>system</measure-numbering>
        </print>
        """
        let decoded = try MusicXMLDecoder().decode(Print.self, from: xml)
        let expected = Print(
            systemLayout: SystemLayout(
                margins: SystemMargins(left: 3, right: 0),
                topSystemDistance: 280
            ),
            measureNumbering: MeasureNumbering(.system)
        )
        XCTAssertEqual(decoded, expected)
    }
}
