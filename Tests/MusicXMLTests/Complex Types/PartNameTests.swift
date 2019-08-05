//
//  PartNameTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/2/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class PartNameTests: XCTestCase {

    func testDecoding() throws {
        let xml = "<part-name>MusicXML Part</part-name>"
        let decoded = try XMLDecoder().decode(PartName.self, from: xml.data(using: .utf8)!)
        let expected = PartName(value: "MusicXML Part")
        XCTAssertEqual(decoded, expected)
    }
}
