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

    #warning("FIXME: #56 Notations.Notation.tuplet not decoding properly yet")
    func DISABLED_testOrnaments() throws {
        let xml = """
        <notations>
          <ornaments>
            <turn/>
            <accidental-mark placement="above">sharp</accidental-mark>
            <accidental-mark placement="above">three-quarters-flat</accidental-mark>
          </ornaments>
        </notations>
        """
        try assertDecoded(xml,
            equals: Notations(
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
        )
    }

    #warning("FIXME: #41 Note.dots not decoding properly yet")
    func DISABLED_testTechnical() throws {
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

    #warning("FIXME: #56 Notations.Notation.tuplet not decoding properly yet")
    func DISABLED_testAccidentalMark() throws {
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

    #warning("FIXME: #41 Note.dots not decoding properly yet")
    func DISABLED_testArticulations() throws {
        let xml = """
        <articulations><plop/></articulations>
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

    #warning("FIXME: #41 Note.dots not decoding properly yet")
    func DISABLED_testArpeggiate() throws {
        let xml = """
        <notations><arpeggiate/></notations>
        """
        try assertDecoded(xml,
            equals: Notations(values: [.arpeggiate(Arpeggiate())])
        )
    }

    #warning("FIXME: #41 Note.dots not decoding properly yet")
    func DISABLED_testNonArpeggiate() throws {
        let xml = """
        <notations><non-arpeggiate type="bottom"/></notations>
        """
        try assertDecoded(xml,
              equals: Notations(values: [.nonArpeggiate(NonArpeggiate(type: .bottom))])
        )
    }

    #warning("FIXME: #41 Note.dots not decoding properly yet")
    func DISABLED_testFermataNoValue() throws {
        let xml = """
        <notations>
          <fermata type="upright"/>
        </notations>
        """
        try assertDecoded(xml,
            equals: Notations(values: [.fermata(Fermata(value: .none, type: .upright))])
        )
    }
}
