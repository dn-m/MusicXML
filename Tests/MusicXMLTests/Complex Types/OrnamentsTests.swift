//
//  OrnamentsTests.swift
//  MusicXMLTests
//
//  Created by Ben Lu on 10/8/19.
//

import XCTest
import XMLCoder
import MusicXML

class OrnamentsTests: XCTestCase {
    func testDecoding() throws {
        let xml = """
        <ornaments>
          <turn/>
          <accidental-mark placement="above">sharp</accidental-mark>
          <accidental-mark placement="above">three-quarters-flat</accidental-mark>
        </ornaments>
        """
        let decoded = try MusicXMLDecoder().decode(Ornaments.self, from: xml)
        let expected = Ornaments([.turn(HorizontalTurn())],
            accidentalMarks: [
                AccidentalMark(.sharp, placement: .above),
                AccidentalMark(.threeQuartersFlat, placement: .above),
            ]
        )

        XCTAssertEqual(decoded, expected)
    }

    func testDecoding_2() throws {
        let xml = """
        <ornaments>
          <trill-mark/>
          <wavy-line number="1" type="start"/>
        </ornaments>
        """
        let decoded = try MusicXMLDecoder().decode(Ornaments.self, from: xml)
        let expected = Ornaments([
            .trillMark(EmptyTrillSound()),
            .wavyLine(WavyLine(type: .start, number: 1))
        ])

        XCTAssertEqual(decoded, expected)
    }
}
