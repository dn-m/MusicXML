//
//  NotationsTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import XCTest
import XMLCoder
import MusicXML

class NotationsTests: XCTestCase {
    func testTied() throws {
        let xml = """
        <notations>
            <tied type="start"/>
        </notations>
        """
        let decoded = try MusicXMLDecoder().decode(Notations.self, from: xml.data(using: .utf8)!)
        let expected = Notations([.tied(Tied(type: .start))])

        XCTAssertEqual(decoded, expected)
    }

    func testTuplet() throws {
        let xml = """
        <notations>
          <tuplet number="1" type="start"/>
        </notations>
        """
        let decoded = try MusicXMLDecoder().decode(Notations.self, from: xml.data(using: .utf8)!)
        let expected = Notations([.tuplet(Tuplet(type: .start, number: 1))])
        XCTAssertEqual(decoded, expected)
    }

    func testFermata() throws {
        let xml = """
        <notations>
          <fermata>normal</fermata>
        </notations>
        """
        try assertDecoded(xml,
            equals: Notations([.fermata(Fermata(.normal))])
        )
    }

    func testAccidentalMark() throws {
        let xml = """
        <accidental-mark placement="above">sharp</accidental-mark>
        """
        let _ = try MusicXMLDecoder().decode(AccidentalMark.self, from: xml.data(using: .utf8)!)
    }

    func testTurn() throws {
        let xml = "<turn/>"
        let _ = try MusicXMLDecoder().decode(HorizontalTurn.self, from: xml.data(using: .utf8)!)
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
        let expected = Notations([
            .ornaments(
                Ornaments([.turn(HorizontalTurn())],
                    accidentalMarks: [
                        AccidentalMark(.sharp, placement: .above),
                        AccidentalMark(.threeQuartersFlat, placement: .above),
                    ]
                )
            )
        ])
        try assertDecoded(xml, equals: expected)
    }

    func testTechnical() throws {
        let xml = """
        <notations>
          <technical><harmonic><natural/><base-pitch/></harmonic></technical>
        </notations>
        """
        let expected = Notations([
            .technical(
                Technical([
                    .harmonic(
                        Harmonic(
                            naturalArtificial: .natural,
                            baseSoundingTouchingPitch: .base
                        )
                    )
                ])
            )
        ])
        try assertDecoded(xml, equals: expected)
    }

    func testAccidentalMarkNotation() throws {
        let xml = """
        <notations>
          <accidental-mark placement="above">double-sharp</accidental-mark>
        </notations>
        """
        try assertDecoded(xml,
            equals: Notations([
                .accidentalMark(AccidentalMark(.doubleSharp, placement: .above))
            ])
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
            equals: Notations([.articulations(Articulations([.plop(EmptyLine())]))])
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
        let expected = Notations([
            .articulations(
                Articulations([
                    .accent(EmptyPlacement(placement: .below)),
                    .tenuto(EmptyPlacement(placement: .below)),
                    .staccato(EmptyPlacement(placement: .above)),
                ])
            )
        ])
        try assertDecoded(xml, equals: expected)
    }

    func testArpeggiate() throws {
        let xml = """
        <notations><arpeggiate/></notations>
        """
        try assertDecoded(xml, equals: Notations([.arpeggiate(Arpeggiate())]))
    }

    func testNonArpeggiate() throws {
        let xml = """
        <notations><non-arpeggiate type="bottom"/></notations>
        """
        try assertDecoded(xml, equals: Notations([.nonArpeggiate(NonArpeggiate(type: .bottom))]))
    }

    func testFermataNoValue() throws {
        let xml = """
        <notations>
          <fermata type="upright"/>
        </notations>
        """
        try assertDecoded(xml,
            equals: Notations([.fermata(Fermata(.normal, type: .upright))])
        )
    }

    func testSlideNoValue() throws {
        let xml = """
        <notations>
          <slide line-type="solid" number="1" type="stop"/>
        </notations>
        """
        try assertDecoded(xml,
            equals: Notations([.slide(Slide(type: .stop, number: 1, lineType: .solid))])
        )
    }

    func testStaccatoArticulations() throws {
        let xml = "<articulations><staccato/></articulations>"
        let decoded = try MusicXMLDecoder().decode(Articulations.self, from: xml.data(using: .utf8)!)
        let expected = Articulations([.staccato()])
        XCTAssertEqual(decoded, expected)
    }

    func testStaccatoNotations() throws {
        let xml = """
        <notations>
          <articulations><tenuto/></articulations>
        </notations>
        """
        let decoded = try MusicXMLDecoder().decode(Notations.self, from: xml.data(using: .utf8)!)
        let expected = Notations([.articulations(Articulations([.tenuto()]))])
        XCTAssertEqual(decoded, expected)
    }

    func testStrongAccentArticulations() throws {
        let xml = "<articulations><strong-accent/></articulations>"
        let decoded = try MusicXMLDecoder().decode(Articulations.self, from: xml.data(using: .utf8)!)
        let expected = Articulations([.strongAccent()])
        XCTAssertEqual(decoded, expected)
    }

    func testSpiccatoArticulations() throws {
        let xml = "<articulations><spiccato/></articulations>"
        let decoded = try MusicXMLDecoder().decode(Articulations.self, from: xml.data(using: .utf8)!)
        let expected = Articulations([.spiccato()])
        XCTAssertEqual(decoded, expected)
    }

    func testBreathMarkArticulations() throws {
        let xml = "<articulations><breath-mark/></articulations>"
        let decoded = try MusicXMLDecoder().decode(Articulations.self, from: xml.data(using: .utf8)!)
        let expected = Articulations([.breathMark()])
        XCTAssertEqual(decoded, expected)
    }

    func testStressArticulations() throws {
        let xml = "<articulations><stress/></articulations>"
        let decoded = try MusicXMLDecoder().decode(Articulations.self, from: xml.data(using: .utf8)!)
        let expected = Articulations([.stress()])
        XCTAssertEqual(decoded, expected)
    }

    func testUpBowTechnical() throws {
        let xml = "<technical><up-bow/></technical>"
        let decoded = try MusicXMLDecoder().decode(Technical.self, from: xml.data(using: .utf8)!)
        let expected = Technical([.upBow()])
        XCTAssertEqual(decoded, expected)
    }

    func testDownBowTechnical() throws {
        let xml = "<technical><down-bow/></technical>"
        let decoded = try MusicXMLDecoder().decode(Technical.self, from: xml.data(using: .utf8)!)
        let expected = Technical([.downBow()])
        XCTAssertEqual(decoded, expected)
    }

    func testFingeringEmpty() throws {
        let xml = "<technical><fingering/></technical>"
        let decoded = try MusicXMLDecoder().decode(Technical.self, from: xml.data(using: .utf8)!)
        let expected = Technical([.fingering()])
        XCTAssertEqual(decoded, expected)
    }

    func testFingeringValue() throws {
        let xml = "<technical><fingering>1</fingering></technical>"
        let decoded = try MusicXMLDecoder().decode(Technical.self, from: xml.data(using: .utf8)!)
        let expected = Technical([.fingering(Fingering("1"))])
        XCTAssertEqual(decoded, expected)
    }

    func testPluckTechnical() throws {
        let xml = "<technical><pluck/></technical>"
        let decoded = try MusicXMLDecoder().decode(Technical.self, from: xml.data(using: .utf8)!)
        let expected = Technical([.pluck()])
        XCTAssertEqual(decoded, expected)
    }

    func testStoppedTechnical() throws {
        let xml = "<technical><stopped/></technical>"
        let decoded = try MusicXMLDecoder().decode(Technical.self, from: xml.data(using: .utf8)!)
        let expected = Technical([.stopped()])
        XCTAssertEqual(decoded, expected)
    }

    func testFretTechnical() throws {
        let xml = "<technical><fret/></technical>"
        let decoded = try MusicXMLDecoder().decode(Technical.self, from: xml.data(using: .utf8)!)
        let expected = Technical([.fret()])
        XCTAssertEqual(decoded, expected)
    }

    func testStringTechnical() throws {
        let xml = "<technical><string/></technical>"
        let decoded = try MusicXMLDecoder().decode(Technical.self, from: xml.data(using: .utf8)!)
        let expected = Technical([.string()])
        XCTAssertEqual(decoded, expected)
    }
    
    func testFingeringValueRoundTrip() throws {
        try testRoundTrip(Technical([.fingering(Fingering("1"))]))
    }
    
    func testFingeringEmptyRoundTrip() throws {
        try testRoundTrip(Technical([.fingering()]))
    }
}
