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
        let decoder = XMLDecoder()
        decoder.trimValueWhitespaces = false
        let decoded = try decoder.decode(Identification.self, from: xml.data(using: .utf8)!)
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
        let decoder = XMLDecoder()
        decoder.trimValueWhitespaces = false
        let decoded = try decoder.decode(Rights.self, from: xml.data(using: .utf8)!)
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
        let decoded = try XMLDecoder().decode(Encoding.self, from: xml.data(using: .utf8)!)
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
        let decoded = try XMLDecoder().decode(Supports.self, from: xml.data(using: .utf8)!)
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
        let decoded = try XMLDecoder().decode(Supports.self, from: xml.data(using: .utf8)!)
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
        let decoded = try XMLDecoder().decode(Defaults.self, from: xml.data(using: .utf8)!)
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
        let decoded = try XMLDecoder().decode(Scaling.self, from: xml.data(using: .utf8)!)
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
        let decoded = try XMLDecoder().decode(PageLayout.self, from: xml.data(using: .utf8)!)
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
        let decoded = try XMLDecoder().decode(SystemLayout.self, from: xml.data(using: .utf8)!)
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
        let decoded = try XMLDecoder().decode(SystemLayout.self, from: xml.data(using: .utf8)!)
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
        let decoded = try XMLDecoder().decode(StaffLayout.self, from: xml.data(using: .utf8)!)
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
        let decoded = try XMLDecoder().decode(Appearance.self, from: xml.data(using: .utf8)!)
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
        let decoded = try XMLDecoder().decode(Font.self, from: xml.data(using: .utf8)!)
        let expected = Font(family: "Maestro,engraved", size: 18)
        XCTAssertEqual(decoded, expected)
    }

    func testWordFont() throws {
        let xml = """
        <word-font font-family="Times New Roman" font-size="8.25"/>
        """
        let decoded = try XMLDecoder().decode(Font.self, from: xml.data(using: .utf8)!)
        let expected = Font(family: "Times New Roman", size: 8.25)
        XCTAssertEqual(decoded, expected)
    }

    func testLyricFonts() throws {
        let xml = """
        <container>
            <lyric-font font-family="Times New Roman" font-size="10"/>
        </container>
        """
        let decoded = try XMLDecoder().decode([LyricFont].self, from: xml.data(using: .utf8)!)
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
        let _ = try XMLDecoder().decode(PartList.self, from: xml.data(using: .utf8)!)
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
        let _ = try XMLDecoder().decode(Print.self, from: xml.data(using: .utf8)!)
    }

    func testPart1() throws {
        let xml = """
        <part id="P1">
            <measure number="1" width="366">
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
              <attributes>
                <divisions>24</divisions>
                <key>
                  <fifths>-3</fifths>
                  <mode>minor</mode>
                </key>
                <time>
                  <beats>3</beats>
                  <beat-type>4</beat-type>
                </time>
                <clef>
                  <sign>G</sign>
                  <line>2</line>
                </clef>
              </attributes>
              <direction directive="yes" placement="above">
                <direction-type>
                  <words default-y="15" font-size="10.5" font-weight="bold">Andantino</words>
                </direction-type>
                <sound tempo="60"/>
              </direction>
              <note>
                <rest measure="yes"/>
                <duration>72</duration>
                <voice>1</voice>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="2" width="245">
              <direction placement="above">
                <direction-type>
                  <words default-x="15" default-y="15" font-size="9" font-style="italic">dolce</words>
                </direction-type>
              </direction>
              <note default-x="27">
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>24</duration>
                <voice>1</voice>
                <type>quarter</type>
                <stem default-y="6">up</stem>
                <lyric default-y="-80" number="1">
                  <syllabic>single</syllabic>
                  <text>Dans</text>
                </lyric>
              </note>
              <direction placement="above">
                <direction-type>
                  <wedge default-y="20" type="crescendo"/>
                </direction-type>
                <offset>-8</offset>
              </direction>
              <note default-x="99">
                <pitch>
                  <step>C</step>
                  <octave>5</octave>
                </pitch>
                <duration>24</duration>
                <voice>1</voice>
                <type>quarter</type>
                <stem default-y="-50.5">down</stem>
                <lyric default-y="-80" number="1">
                  <syllabic>single</syllabic>
                  <text>un</text>
                </lyric>
              </note>
              <note default-x="171">
                <pitch>
                  <step>D</step>
                  <octave>5</octave>
                </pitch>
                <duration>24</duration>
                <voice>1</voice>
                <type>quarter</type>
                <stem default-y="-45.5">down</stem>
                <lyric default-y="-80" number="1">
                  <syllabic>begin</syllabic>
                  <text>som</text>
                </lyric>
              </note>
              <direction>
                <direction-type>
                  <wedge spread="11" type="stop"/>
                </direction-type>
                <offset>-11</offset>
              </direction>
            </measure>
            <!--=======================================================-->
            <measure number="3" width="303">
              <note default-x="26">
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>5</octave>
                </pitch>
                <duration>24</duration>
                <tie type="start"/>
                <voice>1</voice>
                <type>quarter</type>
                <stem default-y="-40.5">down</stem>
                <notations>
                  <tied type="start"/>
                </notations>
                <lyric default-y="-80" number="1">
                  <syllabic>end</syllabic>
                  <text>meil</text>
                  <extend/>
                </lyric>
              </note>
              <note default-x="93">
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>5</octave>
                </pitch>
                <duration>8</duration>
                <tie type="stop"/>
                <voice>1</voice>
                <type>eighth</type>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
                </time-modification>
                <stem default-y="-40">down</stem>
                <beam number="1">begin</beam>
                <notations>
                  <tied type="stop"/>
                  <tuplet bracket="no" number="1" placement="above" type="start"/>
                </notations>
              </note>
              <note default-x="123">
                <pitch>
                  <step>D</step>
                  <octave>5</octave>
                </pitch>
                <duration>8</duration>
                <voice>1</voice>
                <type>eighth</type>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
                </time-modification>
                <stem default-y="-42">down</stem>
                <beam number="1">continue</beam>
                <lyric default-y="-80" number="1">
                  <syllabic>single</syllabic>
                  <text>que</text>
                </lyric>
              </note>
              <note default-x="163">
                <pitch>
                  <step>C</step>
                  <octave>5</octave>
                </pitch>
                <duration>8</duration>
                <voice>1</voice>
                <type>eighth</type>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
                </time-modification>
                <stem default-y="-45">down</stem>
                <beam number="1">end</beam>
                <notations>
                  <tuplet number="1" type="stop"/>
                </notations>
                <lyric default-y="-80" number="1">
                  <syllabic>begin</syllabic>
                  <text>char</text>
                </lyric>
              </note>
              <note default-x="205">
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>5</octave>
                </pitch>
                <duration>8</duration>
                <voice>1</voice>
                <type>eighth</type>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
                </time-modification>
                <stem default-y="-40">down</stem>
                <beam number="1">begin</beam>
                <notations>
                  <tuplet bracket="no" number="1" placement="above" type="start"/>
                </notations>
                <lyric default-y="-80" number="1">
                  <syllabic>end</syllabic>
                  <text>mait</text>
                </lyric>
              </note>
              <note default-x="244">
                <pitch>
                  <step>D</step>
                  <octave>5</octave>
                </pitch>
                <duration>8</duration>
                <voice>1</voice>
                <type>eighth</type>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
                </time-modification>
                <stem default-y="-43">down</stem>
                <beam number="1">continue</beam>
                <lyric default-y="-80" number="1">
                  <syllabic>single</syllabic>
                  <text>ton</text>
                </lyric>
              </note>
              <note default-x="276">
                <pitch>
                  <step>C</step>
                  <octave>5</octave>
                </pitch>
                <duration>8</duration>
                <voice>1</voice>
                <type>eighth</type>
                <time-modification>
                  <actual-notes>3</actual-notes>
                  <normal-notes>2</normal-notes>
                </time-modification>
                <stem default-y="-45">down</stem>
                <beam number="1">end</beam>
                <notations>
                  <tuplet number="1" type="stop"/>
                </notations>
                <lyric default-y="-80" number="1">
                  <syllabic>begin</syllabic>
                  <text>i</text>
                </lyric>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="4" width="283">
              <direction placement="above">
                <direction-type>
                  <wedge default-y="20" spread="11" type="diminuendo"/>
                </direction-type>
                <offset>3</offset>
              </direction>
              <note default-x="27">
                <pitch>
                  <step>C</step>
                  <octave>5</octave>
                </pitch>
                <duration>48</duration>
                <voice>1</voice>
                <type>half</type>
                <stem default-y="-50.5">down</stem>
                <lyric default-y="-80" number="1">
                  <syllabic>middle</syllabic>
                  <text>ma</text>
                </lyric>
              </note>
              <direction>
                <direction-type>
                  <wedge type="stop"/>
                </direction-type>
                <offset>2</offset>
              </direction>
              <note default-x="196">
                <pitch>
                  <step>B</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>24</duration>
                <voice>1</voice>
                <type>quarter</type>
                <stem default-y="-55.5">down</stem>
                <lyric default-y="-80" number="1">
                  <syllabic>end</syllabic>
                  <text>ge</text>
                </lyric>
              </note>
            </measure>
          </part>
          <!--=========================================================-->
          <part id="P2">
            <measure number="1" width="366">
              <print>
                <staff-layout number="1">
                  <staff-distance>65</staff-distance>
                </staff-layout>
                <staff-layout number="2">
                  <staff-distance>48</staff-distance>
                </staff-layout>
                <measure-numbering>none</measure-numbering>
              </print>
              <attributes>
                <divisions>2</divisions>
                <key>
                  <fifths>-3</fifths>
                  <mode>minor</mode>
                </key>
                <time>
                  <beats>3</beats>
                  <beat-type>4</beat-type>
                </time>
                <staves>2</staves>
                <clef number="1">
                  <sign>G</sign>
                  <line>2</line>
                </clef>
                <clef number="2">
                  <sign>F</sign>
                  <line>4</line>
                </clef>
              </attributes>
              <direction placement="below">
                <direction-type>
                  <dynamics default-x="129" default-y="-75" halign="left">
                    <pp/>
                  </dynamics>
                </direction-type>
                <staff>1</staff>
                <sound dynamics="40"/>
              </direction>
              <note default-x="140">
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="3">up</stem>
                <staff>1</staff>
                <beam number="1">begin</beam>
              </note>
              <note default-x="140">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="140">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="178">
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="3">up</stem>
                <staff>1</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="178">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="178">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="214">
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="3">up</stem>
                <staff>1</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="214">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="214">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="252">
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="3">up</stem>
                <staff>1</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="252">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="252">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="289">
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="3">up</stem>
                <staff>1</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="289">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="289">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="327">
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="3">up</stem>
                <staff>1</staff>
                <beam number="1">end</beam>
              </note>
              <note default-x="327">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="327">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <backup>
                <duration>6</duration>
              </backup>
              <note>
                <rest measure="yes"/>
                <duration>6</duration>
                <voice>2</voice>
                <staff>2</staff>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="2" width="245">
              <note default-x="27">
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="3">up</stem>
                <staff>1</staff>
                <beam number="1">begin</beam>
              </note>
              <note default-x="27">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="27">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="63">
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="3">up</stem>
                <staff>1</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="63">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="63">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="99">
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="3">up</stem>
                <staff>1</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="99">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="99">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="135">
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="3">up</stem>
                <staff>1</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="135">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="135">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="171">
                <pitch>
                  <step>B</step>
                  <alter>-1</alter>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="3">up</stem>
                <staff>1</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="171">
                <chord/>
                <pitch>
                  <step>D</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="183">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="171">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="207">
                <pitch>
                  <step>B</step>
                  <alter>-1</alter>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="3">up</stem>
                <staff>1</staff>
                <beam number="1">end</beam>
              </note>
              <note default-x="207">
                <chord/>
                <pitch>
                  <step>D</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="219">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="207">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <backup>
                <duration>6</duration>
              </backup>
              <note>
                <rest measure="yes"/>
                <duration>6</duration>
                <voice>2</voice>
                <staff>2</staff>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="3" width="303">
              <note default-x="26">
                <pitch>
                  <step>A</step>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <accidental>natural</accidental>
                <stem default-y="91">up</stem>
                <staff>2</staff>
                <beam number="1">begin</beam>
              </note>
              <note default-x="26">
                <chord/>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="26">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="26">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="59">
                <pitch>
                  <step>A</step>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="91">up</stem>
                <staff>2</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="59">
                <chord/>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="59">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="59">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="93">
                <pitch>
                  <step>A</step>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="91">up</stem>
                <staff>2</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="93">
                <chord/>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="93">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="93">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="143">
                <pitch>
                  <step>A</step>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="91">up</stem>
                <staff>2</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="143">
                <chord/>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="143">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="143">
                <chord/>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="205">
                <pitch>
                  <step>A</step>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="91">up</stem>
                <staff>2</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="205">
                <chord/>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="205">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="217">
                <chord/>
                <pitch>
                  <step>F</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="260">
                <pitch>
                  <step>A</step>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="91">up</stem>
                <staff>2</staff>
                <beam number="1">end</beam>
              </note>
              <note default-x="260">
                <chord/>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="260">
                <chord/>
                <pitch>
                  <step>E</step>
                  <alter>-1</alter>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="272">
                <chord/>
                <pitch>
                  <step>F</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <backup>
                <duration>6</duration>
              </backup>
              <note default-x="26">
                <pitch>
                  <step>F</step>
                  <octave>1</octave>
                </pitch>
                <duration>6</duration>
                <voice>2</voice>
                <type>half</type>
                <dot/>
                <stem default-y="-105.5">down</stem>
                <staff>2</staff>
              </note>
              <note default-x="26">
                <chord/>
                <pitch>
                  <step>F</step>
                  <octave>2</octave>
                </pitch>
                <duration>6</duration>
                <voice>2</voice>
                <type>half</type>
                <dot/>
                <stem>down</stem>
                <staff>2</staff>
              </note>
            </measure>
            <!--=======================================================-->
            <measure number="4" width="283">
              <note default-x="27">
                <pitch>
                  <step>A</step>
                  <alter>-1</alter>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <accidental>flat</accidental>
                <stem default-y="88.5">up</stem>
                <staff>2</staff>
                <beam number="1">begin</beam>
              </note>
              <note default-x="27">
                <chord/>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="39">
                <chord/>
                <pitch>
                  <step>D</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="27">
                <chord/>
                <pitch>
                  <step>F</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="69">
                <pitch>
                  <step>A</step>
                  <alter>-1</alter>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="88.5">up</stem>
                <staff>2</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="69">
                <chord/>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="80">
                <chord/>
                <pitch>
                  <step>D</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="69">
                <chord/>
                <pitch>
                  <step>F</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="111">
                <pitch>
                  <step>A</step>
                  <alter>-1</alter>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="88.5">up</stem>
                <staff>2</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="111">
                <chord/>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="123">
                <chord/>
                <pitch>
                  <step>D</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="111">
                <chord/>
                <pitch>
                  <step>F</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="154">
                <pitch>
                  <step>A</step>
                  <alter>-1</alter>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="88.5">up</stem>
                <staff>2</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="154">
                <chord/>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="165">
                <chord/>
                <pitch>
                  <step>D</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="154">
                <chord/>
                <pitch>
                  <step>F</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="196">
                <pitch>
                  <step>A</step>
                  <alter>-1</alter>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="88.5">up</stem>
                <staff>2</staff>
                <beam number="1">continue</beam>
              </note>
              <note default-x="196">
                <chord/>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="208">
                <chord/>
                <pitch>
                  <step>D</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="196">
                <chord/>
                <pitch>
                  <step>F</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <note default-x="238">
                <pitch>
                  <step>A</step>
                  <alter>-1</alter>
                  <octave>3</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem default-y="88.5">up</stem>
                <staff>2</staff>
                <beam number="1">end</beam>
              </note>
              <note default-x="238">
                <chord/>
                <pitch>
                  <step>C</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="250">
                <chord/>
                <pitch>
                  <step>D</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>2</staff>
              </note>
              <note default-x="238">
                <chord/>
                <pitch>
                  <step>F</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>eighth</type>
                <stem>up</stem>
                <staff>1</staff>
              </note>
              <backup>
                <duration>6</duration>
              </backup>
              <note default-x="27">
                <pitch>
                  <step>B</step>
                  <alter>-1</alter>
                  <octave>1</octave>
                </pitch>
                <duration>6</duration>
                <voice>2</voice>
                <type>half</type>
                <dot/>
                <stem default-y="-90.5">down</stem>
                <staff>2</staff>
              </note>
              <note default-x="27">
                <chord/>
                <pitch>
                  <step>B</step>
                  <alter>-1</alter>
                  <octave>2</octave>
                </pitch>
                <duration>6</duration>
                <voice>2</voice>
                <type>half</type>
                <dot/>
                <stem>down</stem>
                <staff>2</staff>
              </note>
            </measure>
          </part>
        """
        let _ = try XMLDecoder().decode(Partwise.Part.self, from: xml.data(using: .utf8)!)
    }
}
