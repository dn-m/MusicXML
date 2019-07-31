//
//  MiscellaneousTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 7/31/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class MiscellaneousTests: XCTestCase {

    func testDecoding() throws {
        let xml = """
        <miscellaneous>
          <miscellaneous-field name="description">All pitches from G to c'''' in
              ascending steps; First without accidentals, then with a sharp and then
              with a flat accidental, then with explicit natural accidentals.
              Double alterations and cautionary accidentals
              are tested at the end.</miscellaneous-field>
        </miscellaneous>
        """
        let decoded = try XMLDecoder().decode(Miscellaneous.self, from: xml.data(using: .utf8)!)
        let expected = Miscellaneous(
            fields: [
                MiscellaneousField(
                    name: "description",
                    value: """
                    All pitches from G to c\'\'\'\' in\n      ascending steps; First without accidentals, then with a sharp and then\n      with a flat accidental, then with explicit natural accidentals.\n      Double alterations and cautionary accidentals\n      are tested at the end.
                    """
                )
            ]
        )
        XCTAssertEqual(decoded, expected)
    }

    func testMiscellaneousRoundTrip() throws {
        let misc = Miscellaneous(
            fields: [
                MiscellaneousField(name: "one", value: "1"),
                MiscellaneousField(name: "two", value: "2"),
                MiscellaneousField(name: "three", value: "3"),
            ]
        )
        let encoded = try XMLEncoder().encode(misc, withRootKey: "miscellaneous")
        try testRoundTrip(misc)
    }
}
