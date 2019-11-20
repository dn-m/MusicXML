//
//  MeasureStyleTests.swift
//  MusicXMLTests
//
//  Created by James Bean on 8/8/19.
//

import MusicXML
import XCTest
import XMLCoder

class MeasureStyleTests: XCTestCase {
    func testMultipleRest() throws {
        let xml = """
        <measure-style>
          <multiple-rest>2</multiple-rest>
        </measure-style>
        """
        let decoded = try XMLDecoder().decode(MeasureStyle.self, from: xml.data(using: .utf8)!)
        let expected = MeasureStyle(kind: .multipleRest(MultipleRest(2)))
        XCTAssertEqual(decoded, expected)
    }
}
