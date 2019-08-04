//
//  IdentificationTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class IdentificationTests: XCTestCase {

    func testDecoding() throws {
        let xml = """
        <identification>
            <miscellaneous>
              <miscellaneous-field name="description">Here is some text.</miscellaneous-field>
            </miscellaneous>
        </identification>
        """
        let decoded = try XMLDecoder().decode(Identification.self, from: xml.data(using: .utf8)!)
        let expected = Identification(
            miscellaneous: Miscellaneous(
                fields: [
                    MiscellaneousField(name: "description", value: "Here is some text."),
                ]
            )
        )
        XCTAssertEqual(decoded, expected)
    }
}
