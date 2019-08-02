//
//  ScorePartTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class ScorePartTests: XCTestCase {

    func testDecoding() throws {
        let xml = """
        <score-part id="P1">
            <part-name>MusicXML Part</part-name>
        </score-part>
        """
        let decoded = try XMLDecoder().decode(ScorePart.self, from: xml.data(using: .utf8)!)
        let expected = ScorePart(
            id: "P1",
            identification: nil,
            name: PartName(
                value: "MusicXML Part",
                printStyle: nil,
                printObject: nil,
                justify: nil
            ),
            nameDisplay: nil,
            partAbbreviation: nil,
            partAbbreviationDisplay: nil,
            group: nil,
            scoreInstrument: nil,
            midi: nil
        )
        XCTAssertEqual(decoded, expected)
    }
}
