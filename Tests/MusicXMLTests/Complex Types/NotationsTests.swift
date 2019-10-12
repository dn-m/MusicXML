//
//  NotationsTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class NotationsTests: XCTestCase {
    func testTied() throws {
        let xml = """
        <notations>
            <tied type="start"/>
        </notations>
        """
        let decoded = try XMLDecoder().decode(Notations.self, from: xml.data(using: .utf8)!)
        let expected = Notations(values: [
            .tied(Tied(type: .start))
        ])

        XCTAssertEqual(decoded, expected)
    }

    func testTuplet() throws {
        let xml = """
        <notations>
          <tuplet number="1" type="start"/>
        </notations>
        """
        let decoded = try XMLDecoder().decode(Notations.self, from: xml.data(using: .utf8)!)
        let expected = Notations(values: [.tuplet(Tuplet(type: .start, number: 1))])
        XCTAssertEqual(decoded, expected)
    }

    func testFermata() throws {
        let xml = """
        <notations>
          <fermata>normal</fermata>
        </notations>
        """
        try assertDecoded(xml,
            equals: Notations(values: [.fermata(Fermata(value: .normal))])
        )
    }

    func testAccidentalMark() throws {
        let xml = """
        <accidental-mark placement="above">sharp</accidental-mark>
        """
        let _ = try XMLDecoder().decode(AccidentalMark.self, from: xml.data(using: .utf8)!)
    }

    func testTurn() throws {
        let xml = "<turn/>"
        let _ = try XMLDecoder().decode(HorizontalTurn.self, from: xml.data(using: .utf8)!)
    }

    func testOrnamentsNotation() throws {
        let xml = """
        <notations>
            <ornaments>
              <turn/>
              <accidental-mark placement="above">sharp</accidental-mark>
              <accidental-mark placement="above">three-quarters-flat</accidental-mark>
            </ornaments>
        </notations>
        """
        let expected = Notations(
            values: [
                .ornaments(
                    Ornaments(
                        values: [
                            .turn(HorizontalTurn()),
                        ],
                        accidentalMarks: [
                            AccidentalMark(value: .sharp, placement: .above),
                            AccidentalMark(value: .threeQuartersFlat, placement: .above),
                        ]
                    )
                )
            ]
        )
        try assertDecoded(xml, equals: expected)
    }

    func testTechnical() throws {
        let xml = """
        <notations>
          <technical><harmonic><natural/><base-pitch/></harmonic></technical>
        </notations>
        """
        let expected = Notations(
            values: [
                .technical(
                    Technical(
                        values: [
                            .harmonic(
                                Harmonic(
                                    naturalArtificial: .natural,
                                    baseSoundingTouchingPitch: .base
                                )
                            )
                        ]
                    )
                )
            ]
        )
        try assertDecoded(xml, equals: expected)
    }

    func testAccidentalMarkNotation() throws {
        let xml = """
        <notations>
          <accidental-mark placement="above">double-sharp</accidental-mark>
        </notations>
        """
        try assertDecoded(xml,
            equals: Notations(
                values: [.accidentalMark(AccidentalMark(value: .doubleSharp, placement: .above))]
            )
        )
    }

    func testArticulations() throws {
        let xml = """
        <notations>
            <articulations>
                <plop/>
            </articulations>
        </notations>
        """
        try assertDecoded(xml,
            equals: Notations(values: [.articulations(Articulations(values: [.plop(EmptyLine())]))])
        )
    }

    func testMultipleArticulations() throws {
        let xml = """
        <notations>
          <articulations>
            <accent placement="below"/>
            <tenuto placement="below"/>
            <staccato placement="above"/>
          </articulations>
        </notations>
        """
        let expected = Notations(
            values: [
                .articulations(
                    Articulations(
                        values: [
                            .accent(EmptyPlacement(placement: .below)),
                            .tenuto(EmptyPlacement(placement: .below)),
                            .staccato(EmptyPlacement(placement: .above)),
                        ]
                    )
                )
            ]
        )
        try assertDecoded(xml, equals: expected)
    }

    func testArpeggiate() throws {
        let xml = """
        <notations><arpeggiate/></notations>
        """
        try assertDecoded(xml,
            equals: Notations(values: [.arpeggiate(Arpeggiate())])
        )
    }

    func testNonArpeggiate() throws {
        let xml = """
        <notations><non-arpeggiate type="bottom"/></notations>
        """
        try assertDecoded(xml,
              equals: Notations(values: [.nonArpeggiate(NonArpeggiate(type: .bottom))])
        )
    }

    func testFermataNoValue() throws {
        let xml = """
        <notations>
          <fermata type="upright"/>
        </notations>
        """
        try assertDecoded(xml,
            equals: Notations(values: [.fermata(Fermata(value: .normal, type: .upright))])
        )
    }

    func testSlideNoValue() throws {
        let xml = """
        <notations>
          <slide line-type="solid" number="1" type="stop"/>
        </notations>
        """
        try assertDecoded(xml,
            equals: Notations(values: [
                .slide(Slide(type: .stop, number: 1, lineType: .solid))
            ])
        )
    }

    func testLilyPond() throws {
        let xml = """
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE score-partwise PUBLIC "-//Recordare//DTD MusicXML 2.0 Partwise//EN"
                                        "http://www.musicxml.org/dtds/partwise.dtd">
        <score-partwise version="2.0">
          <movement-title>MusicXML notations (attached to note)</movement-title>
          <identification>
            <miscellaneous>
              <miscellaneous-field name="description">All &lt;notation&gt; elements
                  defined in MusicXML. The lyrics show the notation assigned to each
                  note.</miscellaneous-field>
            </miscellaneous>
          </identification>
          <part-list>
            <score-part id="P1">
              <part-name></part-name>
            </score-part>
          </part-list>
          <!--=========================================================-->
          <part id="P1">
            <!-- General Notation elements (no spanners, which are tested separately):
                 fermata | arpeggiate | non-arpeggiate | accidental-mark -->
            <measure number="1">
              <attributes>
                <divisions>1</divisions>
                <key>
                  <fifths>0</fifths>
                  <mode>major</mode>
                </key>
                <clef>
                  <sign>G</sign>
                  <line>2</line>
                </clef>
              </attributes>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <fermata type="upright"/>
                </notations>
                <lyric number="1"><text>ferm.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <fermata>normal</fermata>
                </notations>
                <lyric number="1"><text>normal ferm.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <fermata>angled</fermata>
                </notations>
                <lyric number="1"><text>angled ferm.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <fermata>square</fermata>
                </notations>
                <lyric number="1"><text>square ferm.</text></lyric>
              </note>
            </measure>
            <measure number="2">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <fermata type="inverted"/>
                </notations>
                <lyric number="1"><text>inv.ferm.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations><arpeggiate/></notations>
                <lyric number="1"><text>arp.</text></lyric>
              </note>
              <note>
                <chord/>
                <pitch>
                  <step>E</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations><arpeggiate/></notations>
              </note>
              <note>
                <chord/>
                <pitch>
                  <step>G</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations><arpeggiate/></notations>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations><non-arpeggiate type="bottom"/></notations>
                <lyric number="1"><text>non-arp.</text></lyric>
              </note>
              <note>
                <chord/>
                <pitch>
                  <step>E</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <chord/>
                <pitch>
                  <step>G</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations><non-arpeggiate type="top"/></notations>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <accidental-mark placement="above">double-sharp</accidental-mark>
                </notations>
                <lyric number="1"><text>acc.mark</text></lyric>
              </note>
              <barline location="right">
                <bar-style>light-light</bar-style>
              </barline>
            </measure>

            <!-- Articulations:
                    accent | strong-accent | staccato | tenuto |
                    detached-legato | staccatissimo | spiccato |
                    scoop | plop | doit | falloff | breath-mark |
                    caesura | stress | unstress | other-articulation -->
            <measure number="3">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><accent/></articulations>
                </notations>
                <lyric number="1"><text>acc.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><strong-accent/></articulations>
                </notations>
                <lyric number="1"><text>str.-acc.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><staccato/></articulations>
                </notations>
                <lyric number="1"><text>stacc.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><tenuto/></articulations>
                </notations>
                <lyric number="1"><text>ten.</text></lyric>
              </note>
            </measure>
            <measure number="4">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><detached-legato/></articulations>
                </notations>
                <lyric number="1"><text>det.-leg.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><staccatissimo/></articulations>
                </notations>
                <lyric number="1"><text>stacc.ss</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><spiccato/></articulations>
                </notations>
                <lyric number="1"><text>spicc.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><scoop/></articulations>
                </notations>
                <lyric number="1"><text>scoop</text></lyric>
              </note>
            </measure>
            <measure number="5">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><plop/></articulations>
                </notations>
                <lyric number="1"><text>plop</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><doit/></articulations>
                </notations>
                <lyric number="1"><text>doit</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><falloff/></articulations>
                </notations>
                <lyric number="1"><text>falloff</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><breath-mark/></articulations>
                </notations>
                <lyric number="1"><text>breath</text></lyric>
              </note>
            </measure>
            <measure number="6">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><caesura/></articulations>
                </notations>
                <lyric number="1"><text>caes.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><stress/></articulations>
                </notations>
                <lyric number="1"><text>stress</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations><unstress/></articulations>
                </notations>
                <lyric number="1"><text>unstr.</text></lyric>
              </note>
              <note>
                <rest/>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <barline location="right">
                <bar-style>light-light</bar-style>
              </barline>
            </measure>

            <!-- Ornaments:
                 trill-mark | turn | delayed-turn | inverted-turn |
                 shake | wavy-line | mordent | inverted-mordent |
                 schleifer | tremolo | other-ornament),
                 accidental-mark

                 Test cases for various tremolo options are in a separate
                 unit test file
                 -->
            <measure number="7">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments><trill-mark/></ornaments>
                </notations>
                <lyric number="1"><text>tr.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments><turn/></ornaments>
                </notations>
                <lyric number="1"><text>turn</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments><delayed-turn/></ornaments>
                </notations>
                <lyric number="1"><text>del.turn</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments><inverted-turn/></ornaments>
                </notations>
                <lyric number="1"><text>inv.turn</text></lyric>
              </note>
            </measure>
            <measure number="8">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments><shake/></ornaments>
                </notations>
                <lyric number="1"><text>shake</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments>
                    <wavy-line placement="below" type="start"/>
                  </ornaments>
                </notations>
                <lyric number="1"><syllabic>begin</syllabic><text>wavy</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments>
                    <wavy-line placement="below" type="stop"/>
                    <wavy-line placement="below" type="start"/>
                  </ornaments>
                </notations>
                <lyric number="1"><syllabic>middle</syllabic><text>wavy</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments>
                    <wavy-line placement="below" type="stop"/>
                  </ornaments>
                </notations>
                <lyric number="1"><syllabic>end</syllabic><text>line</text></lyric>
              </note>
            </measure>
            <measure number="9">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments><mordent/></ornaments>
                </notations>
                <lyric number="1"><text>mord.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments><inverted-mordent/></ornaments>
                </notations>
                <lyric number="1"><text>inv.mord.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments><schleifer/></ornaments>
                </notations>
                <lyric number="1"><text>schl.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments><tremolo>3</tremolo></ornaments>
                </notations>
                <lyric number="1"><text>trem.</text></lyric>
              </note>
            </measure>
            <measure number="10">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments>
                    <turn/>
                    <accidental-mark>natural</accidental-mark>
                  </ornaments>
                </notations>
                <lyric number="1"><text>turn+acc.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step>
                  <octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <ornaments>
                    <turn/>
                    <accidental-mark placement="above">sharp</accidental-mark>
                    <accidental-mark placement="above">three-quarters-flat</accidental-mark>
                  </ornaments>
                </notations>
                <lyric number="1"><text>turn+acc.(ab.+bel./rel to turn)</text></lyric>
              </note>
              <note>
                <rest/>
                <duration>2</duration>
                <voice>1</voice>
                <type>half</type>
              </note>
              <barline location="right">
                <bar-style>light-light</bar-style>
              </barline>
            </measure>

            <!-- Technical:
                 up-bow | down-bow | harmonic | open-string |
                 thumb-position | fingering | pluck | double-tongue |
                 triple-tongue | stopped | snap-pizzicato | fret |
                 string | hammer-on | pull-off | bend | tap | heel |
                 toe | fingernails | other-technical -->
            <measure number="11">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><up-bow/></technical>
                </notations>
                <lyric number="1"><text>up-b.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><down-bow/></technical>
                </notations>
                <lyric number="1"><text>down-b.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><harmonic/></technical>
                </notations>
                <lyric number="1"><text>harm.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><harmonic><natural/></harmonic></technical>
                </notations>
                <lyric number="1"><text>nat.harm.</text></lyric>
              </note>
            </measure>
            <measure number="12">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><harmonic><artificial/></harmonic></technical>
                </notations>
                <lyric number="1"><text>art.harm.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><harmonic><natural/><base-pitch/></harmonic></technical>
                </notations>
                <lyric number="1"><text>nat.h./base</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><harmonic><natural/><touching-pitch/></harmonic></technical>
                </notations>
                <lyric number="1"><text>nat.h./touching</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><harmonic><natural/><sounding-pitch/></harmonic></technical>
                </notations>
                <lyric number="1"><text>nat.h./sounding</text></lyric>
              </note>
            </measure>
            <measure number="13">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><open-string/></technical>
                </notations>
                <lyric number="1"><text>open-str.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><thumb-position/></technical>
                </notations>
                <lyric number="1"><text>thumb-pos.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><fingering/></technical>
                </notations>
                <lyric number="1"><text>empty fing.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><fingering>1</fingering></technical>
                </notations>
                <lyric number="1"><text>fing.1</text></lyric>
              </note>
            </measure>
            <measure number="14">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><fingering>2</fingering></technical>
                </notations>
                <lyric number="1"><text>fing.2</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><fingering>3</fingering></technical>
                </notations>
                <lyric number="1"><text>fing.3</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><fingering>4</fingering></technical>
                </notations>
                <lyric number="1"><text>fing.4</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><fingering>5</fingering></technical>
                </notations>
                <lyric number="1"><text>fing.5</text></lyric>
              </note>
            </measure>
            <measure number="15">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><fingering>something</fingering></technical>
                </notations>
                <lyric number="1"><text>fing.sth.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><fingering>5</fingering><fingering substitution="yes">3</fingering><fingering alternate="yes">2</fingering></technical>
                </notations>
                <lyric number="1"><text>mult.fing.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><pluck/></technical>
                </notations>
                <lyric number="1"><text>empty pluck</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><pluck>a</pluck></technical>
                </notations>
                <lyric number="1"><text>pluck a</text></lyric>
              </note>
            </measure>
            <measure number="16">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><double-tongue/></technical>
                </notations>
                <lyric number="1"><text>dbl.tng.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><triple-tongue/></technical>
                </notations>
                <lyric number="1"><text>trpl.tng.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><stopped/></technical>
                </notations>
                <lyric number="1"><text>stopped</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><snap-pizzicato/></technical>
                </notations>
                <lyric number="1"><text>snp.pizz.</text></lyric>
              </note>
            </measure>
            <measure number="17">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><fret/></technical>
                </notations>
                <lyric number="1"><text>empty fret</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><fret>0</fret></technical>
                </notations>
                <lyric number="1"><text>fret0</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><string/></technical>
                </notations>
                <lyric number="1"><text>empty str.</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <string>5</string>
                  </technical>
                </notations>
                <lyric number="1"><text>str. 5</text></lyric>
              </note>
            </measure>
            <measure number="18">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <hammer-on type="start"/>
                  </technical>
                </notations>
                <lyric number="1"><syllabic>begin</syllabic><text>hammer</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <hammer-on type="stop"/>
                  </technical>
                </notations>
                <lyric number="1"><syllabic>end</syllabic><text>on</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <pull-off type="start"/>
                  </technical>
                </notations>
                <lyric number="1"><syllabic>begin</syllabic><text>pull</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <pull-off type="stop"/>
                  </technical>
                </notations>
                <lyric number="1"><syllabic>end</syllabic><text>off</text></lyric>
              </note>
            </measure>
            <measure number="19">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <bend><bend-alter>4</bend-alter></bend>
                  </technical>
                </notations>
                <lyric number="1"><text>bend</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <bend><bend-alter>3</bend-alter><release/><with-bar/></bend>
                  </technical>
                </notations>
                <lyric number="1"><text>b.3 with-bar</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <bend><bend-alter>-0.5</bend-alter><pre-bend/></bend>
                  </technical>
                </notations>
                <lyric number="1"><text>pre-b. -0.5</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical>
                    <bend><bend-alter>3.5</bend-alter><release/></bend>
                  </technical>
                </notations>
                <lyric number="1"><text>b. release 3.5</text></lyric>
              </note>
            </measure>
            <measure number="20">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><tap/></technical>
                </notations>
                <lyric number="1"><text>tap</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><tap>T</tap></technical>
                </notations>
                <lyric number="1"><text>tap T</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><heel/></technical>
                </notations>
                <lyric number="1"><text>heel</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><toe substitution="yes"/></technical>
                </notations>
                <lyric number="1"><text>toe</text></lyric>
              </note>
            </measure>
            <measure number="21">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <technical><fingernails/></technical>
                </notations>
                <lyric number="1"><text>fingern.</text></lyric>
              </note>
              <note>
                <rest/>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
              </note>
              <note>
                <rest/>
                <duration>2</duration>
                <voice>1</voice>
                <type>half</type>
              </note>
              <barline location="right">
                <bar-style>light-light</bar-style>
              </barline>
            </measure>

            <!-- Dynamics, attached to notes by putting them inside <notations> tags -->
            <measure number="22">
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <dynamics><f/></dynamics>
                </notations>
                <lyric number="1"><text>f</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <dynamics><ppp/></dynamics>
                </notations>
                <lyric number="1"><text>ppp</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <dynamics><sfp/></dynamics>
                </notations>
                <lyric number="1"><text>sfp</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>C</step><octave>5</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <dynamics><other-dynamics>sfffz</other-dynamics></dynamics>
                </notations>
                <lyric number="1"><text>Oth.dyn.</text></lyric>
              </note>
            </measure>

            <!-- General tests: multiple notations, directions, etc. -->
            <measure number="23">
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations>
                    <strong-accent placement="above" type="up"/>
                    <staccato placement="above"/>
                  </articulations>
                </notations>
                <lyric number="1"><text>both above</text></lyric>
              </note>
              <note>
                <pitch>
                  <step>G</step>
                  <octave>4</octave>
                </pitch>
                <duration>1</duration>
                <voice>1</voice>
                <type>quarter</type>
                <notations>
                  <articulations>
                    <accent placement="below"/>
                    <tenuto placement="below"/>
                    <staccato placement="above"/>
                  </articulations>
                </notations>
                <lyric number="1"><text>ab./bel./bel.</text></lyric>
              </note>
              <note>
                <rest/>
                <duration>2</duration>
                <voice>1</voice>
                <type>half</type>
              </note>
              <barline location="right">
                <bar-style>light-heavy</bar-style>
              </barline>
            </measure>
          </part>
        </score-partwise>
        """
        let _ = try MusicXML(string: xml)
    }
}
