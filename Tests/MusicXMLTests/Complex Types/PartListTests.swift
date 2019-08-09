//
//  PartListTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class PartListTests: XCTestCase {

    func testScorePartDecoding() throws {
        let xml = """
        <part-list>
            <score-part id="P1">
                <part-name>MusicXML Part</part-name>
            </score-part>
        </part-list>
        """
        let decoded = try XMLDecoder().decode(PartList.self, from: xml.data(using: .utf8)!)
        let expected = PartList([
            .part(ScorePart(id: "P1", name: PartName(value: "MusicXML Part")))
        ])
        XCTAssertEqual(decoded, expected)
    }

    func testScorePartAndPartGroupDecoding() throws {
        let xml = """
        <part-list>
            <part-group number="1" type="start">
                <group-symbol>bracket</group-symbol>
                <group-barline>yes</group-barline>
            </part-group>
            <score-part id="P1">
                <part-name>Part 1</part-name>
            </score-part>
            <score-part id="P2">
                <part-name>Part 2</part-name>
            </score-part>
            <part-group number="1" type="stop"/>
        </part-list>
        """
        let decoded = try XMLDecoder().decode(PartList.self, from: xml.data(using: .utf8)!)
        let expected = PartList([
            .group(
                PartGroup(
                    type: .start,
                    number: 1,
                    symbol: GroupSymbol(value: .bracket),
                    barline: GroupBarline(value: .yes)
                )
            ),
            .part(ScorePart(id: "P1", name: PartName(value: "Part 1"))),
            .part(ScorePart(id: "P2", name: PartName(value: "Part 2"))),
            .group(PartGroup(type: .stop, number: 1)),
        ])
        XCTAssertEqual(decoded, expected)
    }
}
