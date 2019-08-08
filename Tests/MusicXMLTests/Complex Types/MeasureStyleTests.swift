//
//  MeasureStyleTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import XCTest
import XMLCoder
@testable import MusicXML

class MeasureStyleTests: XCTestCase {

    func testMultipleRest() throws {
        let xml = """
        <measure-style>
          <multiple-rest>2</multiple-rest>
        </measure-style>
        """
        let decoded = try XMLDecoder().decode(MeasureStyle.self, from: xml.data(using: .utf8)!)
        let expected = MeasureStyle(kind: .multipleRest(MultipleRest(value: 2)))
        XCTAssertEqual(decoded, expected)
    }
}
