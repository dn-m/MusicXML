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

    func testDecoding() throws {
        let xml = """
        <part-list>
            <score-part id="P1">
                <part-name>MusicXML Part</part-name>
            </score-part>
        </part-list>
        """
        let decoded = try XMLDecoder().decode(PartList.self, from: xml.data(using: .utf8)!)
        let expected = PartList(
            parts: [
                .part(
                    ScorePart(
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
                )
            ]
        )
        XCTAssertEqual(decoded, expected)
    }
}
